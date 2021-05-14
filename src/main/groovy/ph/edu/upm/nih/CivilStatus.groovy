package ph.edu.upm.nih

public enum CivilStatus {
	SINGLE ("Single"),
	MARRIED ("Married"),
	DIVORCED ("Divorced"),
	WIDOWED ("Widowed")

	final String value

	CivilStatus (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}