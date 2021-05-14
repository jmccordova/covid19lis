package ph.edu.upm.nih.covid19lis.info

import grails.gorm.services.Service

@Service(ClinicalInfo)
interface ClinicalInfoService {

    ClinicalInfo get(Serializable id)

    List<ClinicalInfo> list(Map args)

    Long count()

    void delete(Serializable id)

    ClinicalInfo save(ClinicalInfo clinicalInfo)

}