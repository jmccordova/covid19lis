package ph.edu.upm.nih.covid19lis.patient

public enum DispositionType {
	ADMIT_HOSP ("Admitted in hospital"),
	ADMIT_ISOL ("Admitted in isolation/quarantine facility"),
	HOME_ISOL ("Home isolation"),
	DISC ("Discharged to home")

	final String value

	DispositionType (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}