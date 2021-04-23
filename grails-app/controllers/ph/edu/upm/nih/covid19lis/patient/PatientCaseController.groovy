package ph.edu.upm.nih.covid19lis.patient

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PatientCaseController {

    PatientCaseService patientCaseService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond patientCaseService.list(params), model:[patientCaseCount: patientCaseService.count()]
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
