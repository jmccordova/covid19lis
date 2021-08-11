package ph.edu.upm.nih.covid19lis.info

import grails.gorm.services.Service

@Service(Vaccine)
interface VaccineService {

    Vaccine get(Serializable id)

    List<Vaccine> list(Map args)

    Long count()

    void delete(Serializable id)

    Vaccine save(Vaccine vaccine)

}