package ph.edu.upm.nih.covid19lis.info

public enum ChestCTResult {
	NORMAL ("Normal"),
	PENDING ("Pending"),
	GLASSY (" Multiple bilateral ground glass opacities, often rounded in morphology, with peripheral and lower lung distribution"),
	OTHER ("Other findings")

	final String value

	ChestCTResult (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}