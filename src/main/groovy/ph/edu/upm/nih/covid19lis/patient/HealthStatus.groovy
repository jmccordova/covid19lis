package ph.edu.upm.nih.covid19lis.patient

public enum HealthStatus {
	ASYMPTOMATIC ("Asymptomatic"),
	MILD ("Mild"),
	MODERATE ("Moderate"),
	SEVERE ("Severe"),
	CRITICAL ("Critical")

	final String value

	HealthStatus (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}