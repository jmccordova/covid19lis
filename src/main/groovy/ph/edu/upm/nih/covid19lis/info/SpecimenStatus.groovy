package ph.edu.upm.nih.covid19lis.info

public enum SpecimenStatus {
	SUBMITTED ("Submitted to NIH"),
	SAMPLE_REJECTED ("Sample rejected"),
	FOR_PROCESSING ("For processing"),
	FOR_VERIFICATION_MT1 ("For verification of 1st Medical Technician"),
	FOR_VERIFICATION_MT2 ("For verification of 2nd Medical Technician"),
	FOR_VERIFICATION_QA ("For verification of Quality Assurance"),
	FOR_VERIFICATION_MB ("For verification of Molecular Biologist"),
	FOR_VERIFICATION_PATH ("For verification of Supervisor/Pathologist"),
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