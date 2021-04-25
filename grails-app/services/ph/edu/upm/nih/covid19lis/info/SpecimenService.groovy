package ph.edu.upm.nih.covid19lis.info

import grails.gorm.services.Service

@Service(Specimen)
interface SpecimenService {

    Specimen get(Serializable id)

    List<Specimen> list(Map args)

    Long count()

    void delete(Serializable id)

    Specimen save(Specimen specimen)

}