package ph.edu.upm.nih.covid19lis

import ph.edu.upm.nih.Address
import ph.edu.upm.nih.covid19lis.patient.PatientCase
class Transportation {

	TravelMode travelMode
	String origin
	TranspoType transportationType
	String transportationID
	Date dateDeparture
	String destination
	Date dateArrival

	static belongsTo = [address: Address]

    static constraints = {
    	travelMode nullable: false, blank: false
		origin nullable: false, blank: false
		transportationType nullable: false, blank: false
		transportationID nullable: false, blank: false
		dateDeparture nullable: false, blank: false
		destination nullable: false, blank: false
		dateArrival nullable: false, blank: false
		address nullable: false, blank: false
    }
}
