package ph.edu.upm.nih.covid19lis.patient

import ph.edu.upm.nih.AddressType
import ph.edu.upm.nih.FacilityType
class Address {

	AddressType addressType 	// current, permanent, employer
	String houseNum
	String streetName
	String barangay
	String municipality
	String province
	String phoneNumber
	String cellNumber
	String emailAddress
	FacilityType facilityType 	// health facility, closed setting, market, home, international travel, school, transpo, workplace, local travel, social gathering, others
	Date dateVisited

	static belongsTo = [case: Case]
    static constraints = {
    }
}
