package ph.edu.upm.nih.covid19lis

import grails.gorm.services.Service

@Service(Transportation)
interface TransportationService {

    Transportation get(Serializable id)

    List<Transportation> list(Map args)

    Long count()

    void delete(Serializable id)

    Transportation save(Transportation transportation)

}