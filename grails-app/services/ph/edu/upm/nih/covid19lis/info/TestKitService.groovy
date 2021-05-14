package ph.edu.upm.nih.covid19lis.info

import grails.gorm.services.Service

@Service(TestKit)
interface TestKitService {

    TestKit get(Serializable id)

    List<TestKit> list(Map args)

    Long count()

    void delete(Serializable id)

    TestKit save(TestKit testKit)

}