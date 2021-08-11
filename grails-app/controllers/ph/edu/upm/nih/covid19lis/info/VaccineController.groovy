package ph.edu.upm.nih.covid19lis.info

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class VaccineController {

    VaccineService vaccineService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render view: 'index', model: [vaccineList: vaccineService.list(params)]
    }

    def show(Long id) {
        render view: 'show', model: [vaccineInstance: vaccineService.get(id)]
    }

    def create() {
        respond new Vaccine(params)
    }

    def save(Vaccine vaccine) {
        if (vaccine == null) {
            notFound()
            return
        }

        try {
            vaccineService.save(vaccine)
        } catch (ValidationException e) {
            respond vaccine.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vaccine.label', default: 'Vaccine'), vaccine.id])
                redirect vaccine
            }
            '*' { respond vaccine, [status: CREATED] }
        }
    }

    def edit(Long id) {
        render view: 'edit', model: [vaccineInstance: vaccineService.get(id)]
    }

    def update(Vaccine vaccine) {
        if (vaccine == null) {
            notFound()
            return
        }

        try {
            vaccineService.save(vaccine)
        } catch (ValidationException e) {
            respond vaccine.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'vaccine.label', default: 'Vaccine'), vaccine.id])
                redirect vaccine
            }
            '*'{ respond vaccine, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        vaccineService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'vaccine.label', default: 'Vaccine'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vaccine.label', default: 'Vaccine'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
