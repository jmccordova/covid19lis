package ph.edu.upm.nih.covid19lis.info

import grails.gorm.services.Service

@Service(LaboratoryInfo)
interface LaboratoryInfoService {

    LaboratoryInfo get(Serializable id)

    List<LaboratoryInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    LaboratoryInfo save(LaboratoryInfo laboratoryInfo)

}