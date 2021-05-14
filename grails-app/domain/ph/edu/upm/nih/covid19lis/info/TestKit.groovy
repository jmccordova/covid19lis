package ph.edu.upm.nih.covid19lis.info

class TestKit {

	Date dateCreated
	Date lastUpdated

	Date dateReceived
	String brand
	String lotNum
	TestKitType testKitType
	Integer totalReceived

    static constraints = {
    	dateReceived nullable: false, blank: false
    	brand nullable: false, blank: false
		lotNum nullable: false, blank: false, unique: true
		testKitType nullable: false, blank: false
		totalReceived nullable: false, blank: false, min: 0
    }
}
