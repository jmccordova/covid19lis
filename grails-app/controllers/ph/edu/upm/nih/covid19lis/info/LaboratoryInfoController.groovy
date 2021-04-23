package ph.edu.upm.nih.covid19lis.info

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class LaboratoryInfoController {

    LaboratoryInfoService laboratoryInfoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond laboratoryInfoService.list(params), model:[laboratoryInfoCount: laboratoryInfoService.count()]
    }

    def show(Long id) {
        respond laboratoryInfoService.get(id)
    }

    def create() {
        respond new LaboratoryInfo(params)
    }

    def save(LaboratoryInfo laboratoryInfo) {
        if (laboratoryInfo == null) {
            notFound()
            return
        }

        try {
            laboratoryInfoService.save(laboratoryInfo)
        } catch (ValidationException e) {
            respond laboratoryInfo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'laboratoryInfo.label', default: 'LaboratoryInfo'), laboratoryInfo.id])
                redirect laboratoryInfo
            }
            '*' { respond laboratoryInfo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond laboratoryInfoService.get(id)
    }

    def update(LaboratoryInfo laboratoryInfo) {
        if (laboratoryInfo == null) {
            notFound()
            return
        }

        try {
            laboratoryInfoService.save(laboratoryInfo)
        } catch (ValidationException e) {
            respond laboratoryInfo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'laboratoryInfo.label', default: 'LaboratoryInfo'), laboratoryInfo.id])
                redirect laboratoryInfo
            }
            '*'{ respond laboratoryInfo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        laboratoryInfoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'laboratoryInfo.label', default: 'LaboratoryInfo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'laboratoryInfo.label', default: 'LaboratoryInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
