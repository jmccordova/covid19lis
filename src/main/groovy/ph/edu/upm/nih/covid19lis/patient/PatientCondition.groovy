package ph.edu.upm.nih.covid19lis.patient

public enum PatientCondition {
	ACTIVE ("Active"),
	RECOVERED ("Recovered"),
	EXPIRED ("Expired")

	final String value

	PatientCondition (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}