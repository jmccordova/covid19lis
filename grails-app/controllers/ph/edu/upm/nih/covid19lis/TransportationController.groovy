package ph.edu.upm.nih.covid19lis

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TransportationController {

    TransportationService transportationService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond transportationService.list(params), model:[transportationCount: transportationService.count()]
    }

    def show(Long id) {
        respond transportationService.get(id)
    }

    def create() {
        respond new Transportation(params)
    }

    def save(Transportation transportation) {
        if (transportation == null) {
            notFound()
            return
        }

        try {
            transportationService.save(transportation)
        } catch (ValidationException e) {
            respond transportation.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'transportation.label', default: 'Transportation'), transportation.id])
                redirect transportation
            }
            '*' { respond transportation, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond transportationService.get(id)
    }

    def update(Transportation transportation) {
        if (transportation == null) {
            notFound()
            return
        }

        try {
            transportationService.save(transportation)
        } catch (ValidationException e) {
            respond transportation.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'transportation.label', default: 'Transportation'), transportation.id])
                redirect transportation
            }
            '*'{ respond transportation, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        transportationService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'transportation.label', default: 'Transportation'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'transportation.label', default: 'Transportation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
