package ph.edu.upm.nih.covid19lis.info

import ph.edu.upm.nih.Staff
import ph.edu.upm.nih.covid19lis.patient.PatientCase

import java.text.SimpleDateFormat
class Specimen {

	Date dateCreated
	Date lastUpdated

	// 13. Laboratory Information
	Date dateCollected
    String healthFacilityName
    Integer ziplockNum
	LabTest labTest 		// Enum: RT-PCR, Antigen, Antibody
    String specimenNum
	SpecimenStatus status = SpecimenStatus.SUBMITTED
	String specimenRemarks
	TestKit extractionKit
    Date dateAnalyzed
    TestKit pcrKit
	LabResult labResult = LabResult.PENDING
	Date dateReleased
    String resultRemarks
    Staff approverMT1
    Staff approverMT2
    Staff approverSUP
    Staff approverQA
    Staff approverMB
    Staff approverPATH

    static def springSecurityService

    static belongsTo = [patientCase: PatientCase]

    static constraints = {
    	dateCollected nullable: false, blank: false
        healthFacilityName nullable: false, blank: false
        ziplockNum nullable: false, blank: false, unique: true
        extractionKit nullable: false, blank: false
        specimenNum nullable: false, blank: false, unique: true
        status nullable: false, blank: false
        specimenRemarks nullable: true, blank: true
        labTest nullable: false, blank: false
        dateAnalyzed nullable: true, blank: true
        pcrKit nullable: true, blank: true
    	labResult nullable: false, blank: false
    	dateReleased nullable: true, blank: true
        resultRemarks nullable: true, blank: true
		approverMT1 nullable: true, blank: true
		approverMT2 nullable: true, blank: true
        approverSUP nullable: true, blank: true
		approverQA nullable: true, blank: true
		approverMB nullable: true, blank: true
		approverPATH nullable: true, blank: true
    }

    static def getAllForApproval() {
        def role = springSecurityService?.currentUser?.authorities?.first()?.authority
        def specimenList

        switch(role) {
            case 'ROLE_SUPERADMIN':
                specimenList = Specimen.list()
                break
            case 'ROLE_ENCODER':
                specimenList = Specimen.findAllByStatus(SpecimenStatus.SUBMITTED, SpecimenStatus.SAMPLE_REJECTED, SpecimenStatus.RESULT_ACCEPTED, SpecimenStatus.RESULT_REJECTED)
                break
            case 'ROLE_MT':
                specimenList = Specimen.findAllByStatusInList([SpecimenStatus.SUBMITTED, SpecimenStatus.FOR_PROCESSING, SpecimenStatus.FOR_VERIFICATION_MT1, SpecimenStatus.FOR_VERIFICATION_MT2])
                break
            case 'ROLE_SUP':
                specimenList = Specimen.findAllByStatusInList([SpecimenStatus.SUBMITTED, SpecimenStatus.FOR_PROCESSING, SpecimenStatus.FOR_VERIFICATION_MT1, SpecimenStatus.FOR_VERIFICATION_MT2])
                break
            case 'ROLE_QA':
                specimenList = Specimen.findAllByStatusInList([SpecimenStatus.SUBMITTED, SpecimenStatus.FOR_PROCESSING, SpecimenStatus.FOR_VERIFICATION_QA])
                break
            case 'ROLE_MB':
                specimenList = Specimen.findAllByStatusInList([SpecimenStatus.SUBMITTED, SpecimenStatus.FOR_PROCESSING, SpecimenStatus.FOR_VERIFICATION_MB])
                break
            case 'ROLE_PATH':
                specimenList = Specimen.findAllByStatusInList([SpecimenStatus.SUBMITTED, SpecimenStatus.FOR_PROCESSING, SpecimenStatus.FOR_VERIFICATION_PATH, SpecimenStatus.SAMPLE_REJECTED, SpecimenStatus.RESULT_ACCEPTED, SpecimenStatus.RESULT_REJECTED])
                break
        }

        specimenList
    }

    static def getByDate(Date start = null, Date end = null) {
        def specimenList
        if(start && !end) end = start
        else if(!start && end) start = end

        if(!start && !end) {
            specimenList = Specimen.list()
        } else {
            specimenList = Specimen.executeQuery("FROM Specimen WHERE dateCollected BETWEEN :start AND :end", [start: start, end: end])
        }
    }

    public def getOrdinal() {
        def i = patientCase.labTests.findIndexOf{it == this} + 1
        def suffixes = ["th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th"]
        def ordinal
        switch (i % 100) {
        case 11:
        case 12:
        case 13:
            ordinal = i + "th"
        default:
            ordinal = i + suffixes[i % 10]

        }

        ordinal
    }
}
