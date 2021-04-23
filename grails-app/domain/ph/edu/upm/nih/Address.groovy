package ph.edu.upm.nih

import ph.edu.upm.nih.covid19lis.patient.Patient
import ph.edu.upm.nih.covid19lis.patient.PatientCase
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

	static belongsTo = [patient: Patient, patientCase: PatientCase]
    static constraints = {
    	addressType nullable: true, blank: true
    	houseNum nullable: true, blank: true
    	streetName nullable: true, blank: true
    	barangay nullable: true, blank: true
    	municipality nullable: true, blank: true
    	province nullable: true, blank: true
    	phoneNumber nullable: true, blank: true
    	cellNumber nullable: true, blank: true
    	emailAddress nullable: true, blank: true
    	facilityType nullable: true, blank: true
    	dateVisited nullable: true, blank: true

        patient nullable: true, blank: true
        patientCase nullable: true, blank: true
    }

    public def getFullAddress() {
        return "#" + houseNum + " " + streetName + " St., " + barangay + ", " + municipality + ", " + province
    }
}
