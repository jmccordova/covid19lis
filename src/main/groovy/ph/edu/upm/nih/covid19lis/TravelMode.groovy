package ph.edu.upm.nih.covid19lis

public enum TravelMode {
	LOC ("Domestic"),
	INTL ("International")

	final String value

	TravelMode (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}