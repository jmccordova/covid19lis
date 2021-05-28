package ph.edu.upm.nih.covid19lis.info

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured
import grails.converters.JSON

@Secured(['IS_AUTHENTICATED_FULLY'])
class SpecimenController {

    SpecimenService specimenService
    def codeGeneratorService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", decide: "POST", batchAction: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render view: 'index', model:[specimenList: Specimen.getAllForApproval(), specimenCount: specimenService.count()]
    }

    def show(Long id) {
        render view: "show", model: [specimenInstance: specimenService.get(id)]
    }

    @Secured(['ROLE_SUPERADMIN', 'ROLE_ENCODER'])
    def create() {
        respond new Specimen(params)
    }

    @Secured(['ROLE_SUPERADMIN', 'ROLE_ENCODER'])
    def save(Specimen specimen) {
        if (specimen == null) {
            notFound()
            return
        }

        try {
            specimen.specimenNum = codeGeneratorService.getSpecimenNum()
            specimenService.save(specimen)
        } catch (ValidationException e) {
            println e
            render view: "create", model: [specimenInstance: specimen]
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'specimen.label', default: 'Specimen'), specimen.id])
                redirect specimen
            }
            '*' { respond specimen, [status: CREATED] }
        }
    }

    def edit(Long id) {
        render view: "edit", model: [specimenInstance: specimenService.get(id)]
    }

    def update(Specimen specimen) {
        if (specimen == null) {
            notFound()
            return
        }

        try {
            specimenService.save(specimen)
        } catch (ValidationException e) {
            respond specimen.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'specimen.label', default: 'Specimen'), specimen.id])
                redirect specimen
            }
            '*'{ respond specimen, [status: OK] }
        }
    }
    
    @Secured(['ROLE_SUPERADMIN', 'ROLE_MT', 'ROLE_QA', 'ROLE_MB', 'ROLE_PATH'])
    def addResult(Specimen specimenInstance) {
        if (specimenInstance == null) {
            notFound()
            return
        }

        render view: 'addResult', model: [specimenInstance: specimenInstance]
    }

    private def changeStatus(Specimen specimenInstance, String decision) {
        switch(decision) {
            case 'acceptSample':
                specimenInstance?.status = SpecimenStatus.FOR_PROCESSING
                break
            case 'rejectSample':
                specimenInstance?.status = SpecimenStatus.SAMPLE_REJECTED
                specimenInstance?.labResult = LabResult.REJECT
                specimenInstance?.dateReleased = new Date()
                break
            case 'acceptMT1':
                specimenInstance?.approverMT1 = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_MT2
                break
            case 'acceptMT2':
                specimenInstance?.approverMT2 = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_SUP
                break
            case 'acceptSUP':
                specimenInstance?.approverSUP = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_QA
                break
            case 'acceptQA':
                specimenInstance?.approverQA = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_MB
                break
            case 'acceptMB':
                specimenInstance?.approverMB = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_PATH
                break
            case 'acceptPATH':
                specimenInstance?.approverPATH = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.RESULT_ACCEPTED
                break
            case 'rejectResult':
                specimenInstance?.status = SpecimenStatus.RESULT_REJECTED
                specimenInstance?.labResult = LabResult.REJECT
                specimenInstance?.dateReleased = new Date()
                break
            default:
                break
        }

        specimenInstance
    }

    private def getNextDecision(SpecimenStatus currentStatus, Boolean accept) {
        def nextDecision

        if(accept) {
            switch(currentStatus) {
                case SpecimenStatus.SUBMITTED:
                    nextDecision = 'acceptSample'
                    break
                case SpecimenStatus.FOR_PROCESSING:
                    nextDecision = 'acceptSample' // Similar to above; Users should add result
                    break
                case SpecimenStatus.FOR_VERIFICATION_MT1:
                    nextDecision = 'acceptMT2'
                    break
                case SpecimenStatus.FOR_VERIFICATION_MT2:
                    nextDecision = 'acceptSUP'
                    break
                case SpecimenStatus.FOR_VERIFICATION_SUP:
                    nextDecision = 'acceptQA'
                    break
                case SpecimenStatus.FOR_VERIFICATION_QA:
                    nextDecision = 'acceptMB'
                    break
                case SpecimenStatus.FOR_VERIFICATION_MB:
                    nextDecision = 'acceptPATH'
                    break
            }
        } else {
            switch(currentStatus) {
                case SpecimenStatus.SUBMITTED:
                    nextDecision = 'rejectSample'
                    break
                default:
                    nextDecision = 'rejectResult'
                    break
            }
        }

        nextDecision
    }

    @Secured(['ROLE_SUPERADMIN', 'ROLE_MT', 'ROLE_QA', 'ROLE_MB', 'ROLE_PATH'])
    def decide(Specimen specimenInstance) {
        if (specimenInstance == null) {
            notFound()
            return
        }

        def message = specimenInstance?.status == SpecimenStatus.SUBMITTED ? 'Sample ' : 'Result '
        message += params.decision.contains('accept') ? 'accepted.' : 'rejected.'

        specimenInstance = changeStatus(specimenInstance, params.decision)

        if(specimenService.save(specimenInstance)) {
            flash.message = message
        } else {
            flash.error = "Something went wrong. Try again later."
        }

        redirect action: 'index'
        return
    }

    def batchAction() {
        def specimenList = Specimen.findAllByIdInList(JSON.parse(params.specimens))
        if(specimenList?.isEmpty()) {
            def choice = params.containsKey('accept')
            def decision
            Specimen.withTransaction { status ->
                specimenList?.each {
                    decision = getNextDecision(it?.status, choice)
                    it = changeStatus(it, decision)
                    if(!it.save(failOnError: true)) {
                        status.setRollbackOnly()

                        flash.error = "Something went wrong while doing batch update."
                        redirect action: 'index'
                        return
                    }
                }
            }

            flash.message = "Batch update done."
        } else {
            flash.warning = "None selected."
        }

        redirect action: 'index'
        return
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        specimenService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'specimen.label', default: 'Specimen'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'specimen.label', default: 'Specimen'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
