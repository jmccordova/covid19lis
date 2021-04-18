package ph.edu.upm.nih.covid19lis.patient

import ph.edu.upm.nih.FacilityType
class Person {

	Date dateCreated
	Date lastUpdated

	String lastName
	String firstName
	String middleName

	String contactNumber
	String emailAddress
	FacilityType exposureSetting

    static constraints = {
    }
}
