package ph.edu.upm.nih.covid19lis.info

import ph.edu.upm.nih.covid19lis.patient.PatientCase

class ClinicalInfo {

	Date dateCreated
	Date lastUpdated

	// 12. Clinical Information
	Integer bodyTemp
	String otherSymptoms
	Boolean hasChestRad
	Date dateChestRadTest
	ChestRadResult chestRadResult
	String chestRadOtherResult
	Date dateChestRadResult
	Boolean hasChestCT
	Date dateChestCTTest
	ChestCTResult chestCTResult
	String chestCTOtherResult
	Date dateChestCTResult
	Boolean hasLungUS
	Date dateLungUSTest
	LungUSResult lungUSResult
	String lungUSOtherResult
	Date dateLungUSResult

	static belongsTo = [patientCase: PatientCase]
	// Enum Symptom and Enum Comorbidity
	static hasMany = [symptoms: Symptom]	

    static constraints = { 
    	bodyTemp nullable: true, blank: true
    	otherSymptoms nullable: true, blank: true
    	dateChestRadTest nullable: true, blank: true
    	chestRadResult nullable: true, blank: true
		chestRadOtherResult nullable: true, blank: true
		dateChestRadResult nullable: true, blank: true
		dateChestCTTest nullable: true, blank: true
		chestCTResult nullable: true, blank: true
		chestCTOtherResult nullable: true, blank: true
		dateChestCTResult nullable: true, blank: true
		dateLungUSTest nullable: true, blank: true
		lungUSResult nullable: true, blank: true
		lungUSOtherResult nullable: true, blank: true
		dateLungUSResult nullable: true, blank: true
		
		patientCase nullable: false
		symptoms nullable: true
    }

    def getAllSymptoms() {
    	def s = ""
    	symptoms.each {
    		s += it.toString() + ', '
    	}

    	if(otherSymptoms) s += otherSymptoms
    	
    	s
    }

    def getCorrectChestRadResult() {
    	def result = chestRadResult == ChestRadResult.OTHER ? chestRadOtherResult : chestRadResult

    	result
    }

    def getCorrectChestCTResult() {
    	def result = chestCTResult == ChestCTResult.OTHER ? chestCTOtherResult : chestCTResult

    	result
    }

    def getCorrectLungUSResult() {
    	def result = lungUSResult == LungUSResult.OTHER ? lungUSOtherResult : lungUSResult

    	result
    }
}
