package ph.edu.upm.nih

import grails.gorm.DetachedCriteria
import groovy.transform.ToString

import org.codehaus.groovy.util.HashCodeHelper
import grails.compiler.GrailsCompileStatic

@GrailsCompileStatic
@ToString(cache=true, includeNames=true, includePackage=false)
class StaffRole implements Serializable {

	private static final long serialVersionUID = 1

	Staff staff
	Role role

	@Override
	boolean equals(other) {
		if (other instanceof StaffRole) {
			other.staffId == staff?.id && other.roleId == role?.id
		}
	}

    @Override
	int hashCode() {
	    int hashCode = HashCodeHelper.initHash()
        if (staff) {
            hashCode = HashCodeHelper.updateHash(hashCode, staff.id)
		}
		if (role) {
		    hashCode = HashCodeHelper.updateHash(hashCode, role.id)
		}
		hashCode
	}

	static StaffRole get(long staffId, long roleId) {
		criteriaFor(staffId, roleId).get()
	}

	static boolean exists(long staffId, long roleId) {
		criteriaFor(staffId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long staffId, long roleId) {
		StaffRole.where {
			staff == Staff.load(staffId) &&
			role == Role.load(roleId)
		}
	}

	static StaffRole create(Staff staff, Role role, boolean flush = false) {
		def instance = new StaffRole(staff: staff, role: role)
		instance.save(flush: flush)
		instance
	}

	static boolean remove(Staff u, Role r) {
		if (u != null && r != null) {
			StaffRole.where { staff == u && role == r }.deleteAll()
		}
	}

	static int removeAll(Staff u) {
		u == null ? 0 : StaffRole.where { staff == u }.deleteAll() as int
	}

	static int removeAll(Role r) {
		r == null ? 0 : StaffRole.where { role == r }.deleteAll() as int
	}

	static constraints = {
	    staff nullable: false
		role nullable: false, validator: { Role r, StaffRole ur ->
			if (ur.staff?.id) {
				if (StaffRole.exists(ur.staff.id, r.id)) {
				    return ['userRole.exists']
				}
			}
		}
	}

	static mapping = {
		id composite: ['staff', 'role']
		version false
	}
}
