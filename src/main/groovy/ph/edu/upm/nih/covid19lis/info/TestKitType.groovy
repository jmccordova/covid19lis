package ph.edu.upm.nih.covid19lis.info

public enum TestKitType {
	EXTRACT ("Extraction Kit"),
	PCR ("PCR Kit"),
	RTK ("Rapid Antibody Test Kit"),
	IMMUNOASSAY ("Immunoassay Test Kit"),
	ANTIGEN ("Antigen Test Kit"),
	OTHER ("Other FDA-approved Test Kit")

	final String value

	TestKitType (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}