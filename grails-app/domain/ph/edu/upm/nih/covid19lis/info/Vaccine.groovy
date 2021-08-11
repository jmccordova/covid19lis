package ph.edu.upm.nih.covid19lis.info

import ph.edu.upm.nih.covid19lis.patient.Patient

class Vaccine {

	Date dateCreated
	Date lastUpdated

	JabCount jabCount
	String productName
	String manufacturer
	String lotNum
	Date dateAdministered
	String personAdministered

	static belongsTo = [patient: Patient]

    static constraints = {
    	jabCount nullable: false, blank: false
    	productName nullable: false, blank: false
		manufacturer nullable: false, blank: false
		lotNum nullable: false, blank: false
		dateAdministered nullable: false, blank: false
		personAdministered nullable: true, blank: true
		patient nullable: false
    }
}
