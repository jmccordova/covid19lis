package ph.edu.upm.nih

import grails.gorm.services.Service

@Service(Staff)
interface StaffService {

    Staff get(Serializable id)

    List<Staff> list(Map args)

    Long count()

    void delete(Serializable id)

    Staff save(Staff staff)

}