package ph.edu.upm.nih.covid19lis.info

public enum SpecimenStatus {
	SUBMITTED ("Submitted to NIH"),
	SAMPLE_REJECTED ("Sample rejected"),
	FOR_PROCESSING ("For processing"),
	FOR_VERIFICATION_MT1 ("For verification of Med Tech"),
	FOR_VERIFICATION_MT2 ("For verification of Med Tech"),
	FOR_VERIFICATION_QA ("For verification of QA"),
	FOR_VERIFICATION_MB ("For verification of Mol Bio"),
	FOR_VERIFICATION_P ("For verification of Patho"),
	RESULT_REJECTED ("Result rejected"),
	RESULT_ACCEPTED ("Result accepted")

	final String value

	SpecimenStatus (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}