package ph.edu.upm.nih.covid19lis.patient

class Patient extends Person {

	String patientId
	String philhealtNum			// XX-XXXXXXXXX-X

	// CIF Part 1: Patient Information
	
	// 2. Patient Profile
	Date birthday
	String sex = ['M', 'F']
	CivilStatus civilStatus
	String nationality
	String occupation
	// 3. Current Address handled by addresses
	// 4. Current Workplace Address and Contact Info handled by addresses

	// 5-8 handled by Case
	


	static hasMany = [addresses: Address, cases: Case]
    static constraints = {
    }

    def getAge() {

    }
}
