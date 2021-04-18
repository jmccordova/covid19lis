package ph.edu.upm.nih

public enum Office {
	SAMPLE ("Sample Office")

	final String value

	Office (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}