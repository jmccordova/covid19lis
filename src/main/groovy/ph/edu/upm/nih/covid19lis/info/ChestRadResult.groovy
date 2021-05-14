package ph.edu.upm.nih.covid19lis.info

public enum ChestRadResult {
	NORMAL ("Normal"),
	PENDING ("Pending"),
	HAZY ("Hazy opacities, often rounded in morphology, with peripheral and lower lung distribution"),
	OTHER ("Other findings")

	final String value

	ChestRadResult (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}