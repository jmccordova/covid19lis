package ph.edu.upm.nih.covid19lis.info

import ph.edu.upm.nih.covid19lis.patient.PatientCase
class ClinicalInfo {

	Date dateCreated
	Date lastUpdated

	// 12. Clinical Information
	Date dateIllnessOnset
	Boolean isAsymptomatic
	Integer bodyTemp
	String otherSymptoms
	Boolean isPregnant
	String lmp							// Last Menstrual Period. Available if isPregnant is true
	Boolean isHighRiskPregnancy			// Available if isPregnant is true
	Boolean hasSARI						// Sever Acute Respiratory Illness
	Boolean hasChestRad
	ChestRadResult chestRadResult
	String chestRadOtherResult
	Boolean hasChestCT
	ChestCTResult chestCTResult
	String chestCTOtherResult
	Boolean hasLungUS
	LungUSResult lungUSResult
	String lungUSOtherResult

	static belongsTo = [patientCase: PatientCase]
	// Enum Symptom and Enum Comorbidity
	static hasMany = [symptoms: Symptom, comorbidities: Comorbidity]	

    static constraints = {
    }
}
