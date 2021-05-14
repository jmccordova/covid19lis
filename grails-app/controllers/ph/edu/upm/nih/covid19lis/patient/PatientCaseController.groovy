package ph.edu.upm.nih.covid19lis.patient

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class PatientCaseController {

    PatientCaseService patientCaseService
    def codeGeneratorService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        def startDate = params.startDate ? params.date('startDate', 'yyyy-MM-dd') : null
        def endDate = params.endDate ? params.date('endDate', 'yyyy-MM-dd') : null
        
        def patientCaseList

        if(startDate && endDate) {
            patientCaseList = PatientCase.executeQuery("SELECT pc FROM PatientCase pc WHERE pc.dateInterviewed BETWEEN :startDate AND :endDate", [startDate: startDate, endDate: endDate])
        } else if(startDate && !endDate) {
            patientCaseList = PatientCase.executeQuery("SELECT pc FROM PatientCase pc WHERE pc.dateInterviewed = :startDate", [startDate: startDate])
        } else if(!startDate && endDate) {
            patientCaseList = PatientCase.executeQuery("SELECT pc FROM PatientCase pc WHERE pc.dateInterviewed = :endDate", [endDate: endDate])
        } else {
            patientCaseList = PatientCase.list()
        }

        render view: 'index', model: [patientCaseList: patientCaseList]
    }

    def show(Long id) {
        render view: "show", model: [patientCaseInstance: patientCaseService.get(id)]
    }

    def create() {
        respond new PatientCase(params)
    }

    def save(PatientCase patientCase) {
        if (patientCase == null) {
            notFound()
            return
        }

        try {
            patientCase.caseNum = codeGeneratorService.getCaseNum()
            patientCaseService.save(patientCase)
        } catch (ValidationException e) {
            println e
            respond patientCase.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'patientCase.label', default: 'PatientCase'), patientCase.id])
                redirect patientCase
            }
            '*' { respond patientCase, [status: CREATED] }
        }
    }

    def edit(Long id) {
        render view: "edit", model: [patientCaseInstance: patientCaseService.get(id)]
    }

    def update(PatientCase patientCase) {
        if (patientCase == null) {
            notFound()
            return
        }

        try {
            patientCaseService.save(patientCase)
        } catch (ValidationException e) {
            respond patientCase.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'patientCase.label', default: 'PatientCase'), patientCase.id])
                redirect patientCase
            }
            '*'{ respond patientCase, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        patientCaseService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'patientCase.label', default: 'PatientCase'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'patientCase.label', default: 'PatientCase'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
