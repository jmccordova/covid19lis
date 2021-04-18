package ph.edu.upm.nih.covid19lis.info

public enum Symptom {
	ASYMPTOMATIC ("Asymptomatic"),
	FEVER ("Fever"),
	COUGH ("Cough"),
	WEAKNESS ("General Weakness"),
	FATIGUE ("Fatigue"),
	HEADACHE ("Headache"),
	MYALGIA ("Myalgia"),
	SORE_THROAT ("Sore Throat"),
	CORYZA ("Coryza"),
	DYSPNEA ("Dyspnea"),
	ANOREXIA ("Anorexia"),
	NAUSEA ("Nausea"),
	VOMIT ("Vomiting"),
	DIARRHEA ("Diarrhea"),
	MENTAL ("Altered Mental Status"),
	ANOSMIA ("Anosmia (Loss of smell)"),
	AGEUSIA ("Ageusia (Loss of taste)"),
	OTHERS ("Others")

	final String value

	Symptom (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}