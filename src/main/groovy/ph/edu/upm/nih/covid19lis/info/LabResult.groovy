package ph.edu.upm.nih.covid19lis.info

public enum LabResult {
	PENDING ("Pending"),
	POSITIVE ("Positive"),
	NEGATIVE ("Negative"),
	EQUIVOCAL ("Equivocal"),
	MP_GN ("IgM (+) IgG (-)"),
	MN_GP ("IgM (-) IgG (+)"),
	MP_GP ("IgM (+) IgG (+)"),
	MN_GN ("IgM (-) IgG (-)"),
	REJECT ("Rejected")

	final String value

	LabResult (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}