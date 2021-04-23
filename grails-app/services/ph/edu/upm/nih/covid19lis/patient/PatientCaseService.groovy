package ph.edu.upm.nih.covid19lis.patient

import grails.gorm.services.Service

@Service(PatientCase)
interface PatientCaseService {

    PatientCase get(Serializable id)

    List<PatientCase> list(Map args)

    Long count()

    void delete(Serializable id)

    PatientCase save(PatientCase patientCase)

}