package ph.edu.upm.nih.covid19lis.info

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SpecimenServiceSpec extends Specification {

    SpecimenService specimenService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Specimen(...).save(flush: true, failOnError: true)
        //new Specimen(...).save(flush: true, failOnError: true)
        //Specimen specimen = new Specimen(...).save(flush: true, failOnError: true)
        //new Specimen(...).save(flush: true, failOnError: true)
        //new Specimen(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //specimen.id
    }

    void "test get"() {
        setupData()

        expect:
        specimenService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Specimen> specimenList = specimenService.list(max: 2, offset: 2)

        then:
        specimenList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        specimenService.count() == 5
    }

    void "test delete"() {
        Long specimenId = setupData()

        expect:
        specimenService.count() == 5

        when:
        specimenService.delete(specimenId)
        sessionFactory.currentSession.flush()

        then:
        specimenService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Specimen specimen = new Specimen()
        specimenService.save(specimen)

        then:
        specimen.id != null
    }
}
