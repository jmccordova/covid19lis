package ph.edu.upm.nih

public enum AddressType {
	CURR_HOME ("Current Address in the Philippines"),
	CURR_WORK ("Current Workplace Address"),
	PERM_HOME ("Permanent Address"),
	INTL_HOME ("Home Address Outside Philippines"),
	INTL_WORK ("Workplace Address Outside Philippines")

	final String value

	AddressType (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}