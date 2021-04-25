package ph.edu.upm.nih.covid19lis.info

import ph.edu.upm.nih.Staff
import ph.edu.upm.nih.covid19lis.patient.PatientCase
class Specimen {

	Date dateCreated
	Date lastUpdated

	// 13. Laboratory Information
	Date dateCollected
	LabTest labTest 		// Enum: RT-PCR, Antigen, Antibody
    String specimenID
	SpecimenStatus status = SpecimenStatus.SUBMITTED
	String specimenRemarks
	TestKit testKit
	LabResult labResult = LabResult.PENDING
	Date dateReleased
    String resultRemarks
    Staff approverMT1
    Staff approverMT2
    Staff approverQA
    Staff approverMB
    Staff approverP

    static belongsTo = [patientCase: PatientCase]

    static constraints = {
    	dateCollected nullable: false, blank: false
        testKit nullable: false, blank: false
        specimenID nullable: false, blank: false, unique: true
        status nullable: false, blank: false
        specimenRemarks nullable: true, blank: true
        labTest nullable: false, blank: false
    	labResult nullable: false, blank: false
    	dateReleased nullable: true, blank: true
        resultRemarks nullable: true, blank: true
		approverMT1 nullable: true, blank: true
		approverMT2 nullable: true, blank: true
		approverQA nullable: true, blank: true
		approverMB nullable: true, blank: true
		approverP nullable: true, blank: true
    }
}
