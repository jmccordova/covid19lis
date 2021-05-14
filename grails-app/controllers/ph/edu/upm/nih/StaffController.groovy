package ph.edu.upm.nih

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_SUPERADMIN'])

class StaffController {

    StaffService staffService
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond staffService.list(params), model:[staffCount: staffService.count()]
    }

    def show(Long id) {
        render view: 'show', model: [staffInstance: staffService.get(id)]
    }

    def create() {
        respond new Staff(params)
    }

    def save(Staff staff) {
        if (staff == null) {
            notFound()
            return
        }

        try {
            staffService.save(staff)
            StaffRole.withTransaction { status ->
                StaffRole.create(staff, Role.findById(params.long('role.id')))
            }
        } catch (ValidationException e) {
            respond staff.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'staff.label', default: 'Staff'), staff.id])
                redirect staff
            }
            '*' { respond staff, [status: CREATED] }
        }
    }

    def edit(Long id) {
        render view: 'edit', model: [staffInstance: staffService.get(id)]
    }

    def update(Staff staff) {
        if (staff == null) {
            notFound()
            return
        }

        try {
            staffService.save(staff)
            StaffRole.withTransaction { status ->
                def role = Role.findById(params.long('role.id'))
                StaffRole.removeAll(staff)
                StaffRole.create(staff, role)
                if (springSecurityService.loggedIn && springSecurityService.principal.username == staff.username) {
                    springSecurityService.reauthenticate(staff.username)
          }
            }
        } catch (ValidationException e) {
            respond staff.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'staff.label', default: 'Staff'), staff.id])
                redirect staff
            }
            '*'{ respond staff, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        staffService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'staff.label', default: 'Staff'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'staff.label', default: 'Staff'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
