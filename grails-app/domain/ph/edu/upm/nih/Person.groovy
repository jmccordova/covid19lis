package ph.edu.upm.nih

import ph.edu.upm.nih.FacilityType
import ph.edu.upm.nih.covid19lis.patient.PatientCase

class Person {

	Date dateCreated
	Date lastUpdated

	String lastName
	String firstName
	String middleName

	String contactNumber
	String emailAddress
	FacilityType exposureSetting
    PatientCase patientCase

    static constraints = {
    	lastName nullable: false, blank: false
    	firstName nullable: false, blank: false
    	middleName nullable: true, blank: true

    	contactNumber nullable: false, blank: false
    	emailAddress nullable: true, blank: true, unique: true
    	exposureSetting nullable: true
        patientCase nullable: true
    }

    public def getFullName(Boolean alt = false) {
    	def fullName

    	if(!alt) {
    		fullName = firstName + " "
	        if(middleName) fullName += splitName(middleName) + ". "
	        fullName += lastName
    	} else {
    		fullName = lastName + ", " + firstName + " "
        	if(middleName) fullName += splitName(middleName) + "."
    	}

    	fullName 
    }

    private String splitName(String name) {
        if(!name) return false

        def parts = name.split(' ')
        def initials = ''

        parts.each {
            initials += it[0]
        }

        initials?.toUpperCase()
    }
}
