package ph.edu.upm.nih.covid19lis.info

public enum Comorbidity {
	HYPERTENSION ("Hypertension"),
	DIABETES ("Diabetes"),
	HEART ("Heart Disease"),
	LUNG ("Lung Disease"),
	GASTRO ("Gastrointestinal"),
	URINARY ("Genito-urinary"),
	NEURO ("Neurological Disease"),
	CANCER ("Cancer"),
	OTHERS ("Others")

	final String value

	Comorbidity (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}