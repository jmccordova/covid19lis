package ph.edu.upm.nih.covid19lis.info

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ClinicalInfoController {

    ClinicalInfoService clinicalInfoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond clinicalInfoService.list(params), model:[clinicalInfoCount: clinicalInfoService.count()]
    }

    def show(Long id) {
        respond clinicalInfoService.get(id)
    }

    def create() {
        respond new ClinicalInfo(params)
    }

    def save(ClinicalInfo clinicalInfo) {
        if (clinicalInfo == null) {
            notFound()
            return
        }

        try {
            clinicalInfoService.save(clinicalInfo)
        } catch (ValidationException e) {
            respond clinicalInfo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clinicalInfo.label', default: 'ClinicalInfo'), clinicalInfo.id])
                redirect controller: 'patientCase', action: 'show', id: clinicalInfo?.patientCase?.id
            }
            '*' { respond clinicalInfo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        render view: 'edit', model: [clinicalInfoInstance: clinicalInfoService.get(id)]
    }

    def update(ClinicalInfo clinicalInfo) {
        if (clinicalInfo == null) {
            notFound()
            return
        }

        try {
            clinicalInfoService.save(clinicalInfo)
        } catch (ValidationException e) {
            respond clinicalInfo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'clinicalInfo.label', default: 'ClinicalInfo'), clinicalInfo.id])
                redirect clinicalInfo
            }
            '*'{ respond clinicalInfo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        clinicalInfoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'clinicalInfo.label', default: 'ClinicalInfo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clinicalInfo.label', default: 'ClinicalInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
