package ph.edu.upm.nih.covid19lis.info

import ph.edu.upm.nih.Office
import ph.edu.upm.nih.covid19lis.patient.PatientCase
class LaboratoryInfo {

	Date dateCreated
	Date lastUpdated

	// 13. Laboratory Information
	Date dateCollected
	LabTest labTest 		// Enum: RT-PCR, Antigen, Antibody, Others
	String otherSpecimen
	Office laboratory
	LabResult labResult = LabResult.PENDING
	String otherLabTest
	String otherLabResult
	Date dateReleased

	static belongsTo = [patientCase: PatientCase]
    static constraints = {
    	dateCollected nullable: false, blank: false
    	labTest nullable: false, blank: false
    	otherSpecimen nullable: true, blank: true
    	laboratory nullable: false, blank: true
    	labResult nullable: false, blank: false
    	otherLabTest nullable: false, blank: false
    	otherLabResult nullable: false, blank: false
    	dateReleased nullable: true, blank: true
    }

    public def getAppropLabTest() {
    	(labTest == LabTest.OTHERS) ? otherLabResult : labTest
    }

    public def getAppropLabResult() {
    	(labTest == LabTest.OTHERS) ? otherLabResult : labResult
    }
}