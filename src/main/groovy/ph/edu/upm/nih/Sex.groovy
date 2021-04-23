package ph.edu.upm.nih

public enum Sex {
	MALE ("Male"),
	FEMALE ("Female")

	final String value

	Sex (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}