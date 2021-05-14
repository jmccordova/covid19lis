package ph.edu.upm.nih.covid19lis.patient

public enum ClientType {
	COVID_CASE ("Covid-19 Case (Suspect, Probable, or Confirmed)"),
	CLOSE ("Close Contact"),
	NON_COVID ("For RT-PCR Testing (Not a Case of Close Contact)")

	final String value

	ClientType (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}