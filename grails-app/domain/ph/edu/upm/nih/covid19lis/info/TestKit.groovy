package ph.edu.upm.nih.covid19lis.info

class TestKit {

	Date dateCreated
	Date lastUpdated

	Date dateReceived
	String brand
	String lotNum
	Date dateExpiration
	TestKitType testKitType
	Integer totalReceived

	static constraints = {
		dateReceived nullable: false, blank: false
		brand nullable: false, blank: false
		lotNum nullable: false, blank: false, unique: true
		dateExpiration nullable: false, blank: false
		testKitType nullable: false, blank: false
		totalReceived nullable: false, blank: false, min: 1
	}

	public def getCurrentCount() {
		def count = Specimen.executeQuery("SELECT COUNT(id) FROM Specimen WHERE extractionKit = :testKit OR pcrKit = :testKit", [testKit: this])
		
		count?.first()
	}

	// True if 90% of received items are used; or
	// True if there's at least only one item left
	public def needsReorder() {
		(totalReceived * 0.9 <= this.getCurrentCount()) || (totalReceived - this.getCurrentCount() <= 1)
	}
}
