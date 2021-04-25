package ph.edu.upm.nih.covid19lis.patient

import ph.edu.upm.nih.Sex
import ph.edu.upm.nih.CivilStatus
import ph.edu.upm.nih.Person
import ph.edu.upm.nih.Address
import ph.edu.upm.nih.FacilityType
import ph.edu.upm.nih.covid19lis.info.Comorbidity
class Patient extends Person {

	String patientId
	String philHealthNum			// XX-XXXXXXXXX-X

	// CIF Part 1: Patient Information
	
	// 2. Patient Profile
	Date birthday
	Sex sex
	CivilStatus civilStatus
	String nationality
	String occupation
	// 3. Current Address handled by addresses
	// 4. Current Workplace Address and Contact Info handled by addresses

	// 5-8 handled by Case

	// Originally in Part 2 of CIF v7. Moved here in CIF v9
	// 9. Special Population
	Boolean isHealthWorker = false
	String hwOrigin					// Enabled if isHealthWorker is true
	Boolean isReturningFil = false
	Boolean isOFW = false			// Enabled if isReturningFil is true
	String ofCountryOrigin			// Enabled if isReturningFil is true
	Boolean isForeigner = false
	String forCountryOrigin			// Enabled if isForeigner is true
	Boolean isLocallyStranded = false
	Boolean isAPOR = false			// Enabled if isLocallyStranded is true
	String lsOrigin					// Enabled if isLocallyStranded is true
	Boolean isClosedSetting = false
	FacilityType institutionType	// Enabled if isClosedSetting is true
	String institutionName			// Enabled if isClosedSetting is true
	Boolean isIndigenous = false
	String groupName				// Enabled if isIndigenous is true

	static hasMany = [addresses: Address, cases: PatientCase, comorbidities: Comorbidity]
    static constraints = {
    	patientId nullable: true, blank: true, unique: true
    	philHealthNum nullable: true, blank: true, unique: true
    	birthday nullable: false, blank: false
    	sex nullable: false, blank: false
    	civilStatus nullable: false, blank: false
    	nationality nullable: false, blank: false
    	occupation nullable: false, blank: false

    	hwOrigin nullable: true, blank: true
		ofCountryOrigin nullable: true, blank: true
		forCountryOrigin nullable: true, blank: true
		lsOrigin nullable: true, blank: true
		institutionType nullable: true, blank: true
		institutionName nullable: true, blank: true
		groupName nullable: true, blank: true

    	addresses nullable: true
    	cases nullable: true
		comorbidities nullable: true
    }

    public def getAge() {
    	return new Date() - birthday
    }
}
