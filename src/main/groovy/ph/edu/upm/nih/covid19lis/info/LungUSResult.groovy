package ph.edu.upm.nih.covid19lis.info

public enum LungUSResult {
	NORMAL ("Normal"),
	PENDING ("Pending"),
	THICK ("Thickened pleural lines, B lines (multifocal, discrete, or confluent), consolidative patterns with or without air bronchograms."),
	OTHER ("Other findings")

	final String value

	LungUSResult (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}