package ph.edu.upm.nih.covid19lis

public enum TranspoType {
	AIR ("Airline"),
	SEA ("Sea Vessel"),
	BUS ("Busline"),
	TRAIN ("Train")

	final String value

	TranspoType (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}