package ph.edu.upm.nih.covid19lis.patient

public enum CaseClassification {
	SUSPECT ("Suspect"),
	PROBABLE ("Probable"),
	CONFIRMED ("Confirmed"),
	NON_COVID ("Non-Covid 19 Case")

	final String value

	CaseClassification (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}