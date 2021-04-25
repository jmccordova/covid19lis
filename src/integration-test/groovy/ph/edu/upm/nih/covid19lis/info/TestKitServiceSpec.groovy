package ph.edu.upm.nih.covid19lis.info

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class TestKitServiceSpec extends Specification {

    TestKitService testKitService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new TestKit(...).save(flush: true, failOnError: true)
        //new TestKit(...).save(flush: true, failOnError: true)
        //TestKit testKit = new TestKit(...).save(flush: true, failOnError: true)
        //new TestKit(...).save(flush: true, failOnError: true)
        //new TestKit(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //testKit.id
    }

    void "test get"() {
        setupData()

        expect:
        testKitService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<TestKit> testKitList = testKitService.list(max: 2, offset: 2)

        then:
        testKitList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        testKitService.count() == 5
    }

    void "test delete"() {
        Long testKitId = setupData()

        expect:
        testKitService.count() == 5

        when:
        testKitService.delete(testKitId)
        sessionFactory.currentSession.flush()

        then:
        testKitService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        TestKit testKit = new TestKit()
        testKitService.save(testKit)

        then:
        testKit.id != null
    }
}
