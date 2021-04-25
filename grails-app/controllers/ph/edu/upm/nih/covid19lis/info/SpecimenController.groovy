package ph.edu.upm.nih.covid19lis.info

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class SpecimenController {

    SpecimenService specimenService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond specimenService.list(params), model:[specimenCount: specimenService.count()]
    }

    def show(Long id) {
        render view: "show", model: [specimenInstance: specimenService.get(id)]
    }

    def create() {
        respond new Specimen(params)
    }

    def save(Specimen specimen) {
        if (specimen == null) {
            notFound()
            return
        }

        try {
            specimenService.save(specimen)
        } catch (ValidationException e) {
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
