package ph.edu.upm.nih.covid19lis.patient

public enum TestCategory {

    A("Individuals with severe/critical symptoms and relevant history of travel and/or contact"),
    B("Individuals with mild symptoms and relevant history of travel and/or contact, and considered vulnerable"),
    C("Individuals with mild symptoms, and relevant history of travel and/or contact"),
    D("ndividuals with no symptoms but with relevant history of travel and/or contact or high risk of exposure"),
    E("Frontliners indirectly involved in health care provision in the response against COVID-19"),
    F("Other vulnerable patients and those living in confined spaces"),
    G("Residents, occupants or workers in a localized area with an active COVID-19 cluster"),
    H("Frontliners in tourist zones"),
    I("All workers and employees of manufacturing companies and public service providers registered in economic zones located in Special Concern Areas"),
    J("Economy Workers")

    final String value

	TestCategory (String value) {
		this.value = value
	}

	String toString() {
		value
	}

	String getKey() { 
		name() 
	}

}