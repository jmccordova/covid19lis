package ph.edu.upm.nih.covid19lis.info

public enum JabCount {
	FIRST ("1st Covid-19 Dose"),
	SECOND ("2nd Covid-19 Dose"),
	OTHER ("Other")

	final String value

	JabCount (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}
}