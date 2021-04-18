package ph.edu.upm.nih

public enum FacilityType {
	HEALTH_FACILITY ("Health Facility"),
	CLOSED_SETTING ("Closed Setting (e.g. Jail)"),
	MARKET ("Market"),
	HOME ("Home"),
	INTL_TRAVEL ("International Travel"),
	SCHOOL ("School"),
	TRANSPO ("Transportation"),
	WORK ("Workplace"),
	LOC_TRAVEL ("Local Travel"),
	SOCIAL ("Social Gathering"),
	OTHERS ("Others")

	final String value

	FacilityType (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}