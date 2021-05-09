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
        respond specimenService.list(params), model:[specimenCount: specimenService.count()]
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

    @Secured(['ROLE_SUPERADMIN', 'ROLE_MT', 'ROLE_QA', 'ROLE_MB', 'ROLE_PATH'])
    def decide(Specimen specimenInstance) {
        if (specimenInstance == null) {
            notFound()
            return
        }

        def message

        switch(params.decision) {
            case 'acceptSample':
                message = 'Sample accepted.'
                specimenInstance?.status = SpecimenStatus.FOR_PROCESSING
                break
            case 'rejectSample':
                message = 'Sample rejected.'
                specimenInstance?.status = SpecimenStatus.SAMPLE_REJECTED
                specimenInstance?.labResult = LabResult.REJECT
                break
            case 'acceptMT1':
                message = 'Result accepted.'
                specimenInstance?.approverMT1 = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_MT2
                break
            case 'acceptMT2':
                message = 'Result accepted.'
                specimenInstance?.approverMT2 = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_QA
                break
            case 'acceptQA':
                message = 'Result accepted.'
                specimenInstance?.approverQA = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_MB
                break
            case 'acceptMB':
                message = 'Result accepted.'
                specimenInstance?.approverMB = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.FOR_VERIFICATION_PATH
                break
            case 'acceptPATH':
                message = 'Result accepted.'
                specimenInstance?.approverPATH = springSecurityService?.currentUser
                specimenInstance?.status = SpecimenStatus.RESULT_ACCEPTED
                break
            case 'rejectResult':
                message = 'Result not accepted.'
                specimenInstance?.status = SpecimenStatus.RESULT_REJECTED
                specimenInstance?.labResult = LabResult.REJECT
                break
            default:
                break
        }

        if(specimenService.save(specimenInstance)) {
            flash.message = message
        } else {
            flash.error = "Something went wrong. Try again later."
        }

        redirect action: 'index'
        return
    }

    def batchAction() {
        println JSON.toString(params.specimen)

        if(params.containsKey('accept')) {

        } else if(params.containsKey('reject')) {

        }
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
