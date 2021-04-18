package ph.edu.upm.nih.covid19lis.info

import ph.edu.upm.nih.Office

class LaboratoryInfo {

	Date dateCreated
	Date lastUpdated

	// 13. Laboratory Information
	Date dateCollected
	LabTest labTest 		// Enum: RT-PCR, Antigen, Antibody, Others
	String otherSpecimen
	Office laboratory
	LabResult result
	String otherLabTest
	String otherLabResult
	Date dateReleased

	static belongsTo = [case: Case]
    static constraints = {
    	result nullable: false, blank: false, default: LabResult.PENDING
    }
}
