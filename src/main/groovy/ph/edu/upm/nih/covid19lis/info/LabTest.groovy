package ph.edu.upm.nih.covid19lis.info

public enum LabTest {
	PCR_O ("RT-PCR (OPS)"),
	PCR_N ("RT-PCR (NPS)"),
	PCR_ON ("RT-PCR (OPS and NPS)"),
	PCR_OTHER ("RT-PCR (Other specimen)"),
	ANTIGEN ("Antigen Test"),
	ANTIBODY ("Antibody Test"),
	OTHERS ("Others")

	final String value

	LabTest (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}