package ph.edu.upm.nih.covid19lis.info

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class TestKitController {

    TestKitService testKitService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond testKitService.list(params), model:[testKitCount: testKitService.count()]
    }

    def show(Long id) {
        render view: 'edit', model: [testKitInstance: testKitService.get(id)]
    }

    def create() {
        respond new TestKit(params)
    }

    def save(TestKit testKit) {
        if (testKit == null) {
            notFound()
            return
        }

        try {
            testKitService.save(testKit)
        } catch (ValidationException e) {
            respond testKit.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'testKit.label', default: 'TestKit'), testKit.id])
                redirect testKit
            }
            '*' { respond testKit, [status: CREATED] }
        }
    }

    def edit(Long id) {
        render view: 'edit', model: [testKitInstance: testKitService.get(id)]
    }

    def update(TestKit testKit) {
        if (testKit == null) {
            notFound()
            return
        }

        try {
            testKitService.save(testKit)
        } catch (ValidationException e) {
            respond testKit.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'testKit.label', default: 'TestKit'), testKit.id])
                redirect testKit
            }
            '*'{ respond testKit, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        testKitService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'testKit.label', default: 'TestKit'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'testKit.label', default: 'TestKit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
