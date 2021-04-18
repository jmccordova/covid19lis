package ph.edu.upm.nih.covid19lis.patient

import ph.edu.upm.nih.covid19lis.info.ClinicalInfo
import ph.edu.upm.nih.covid19lis.info.LaboratoryInfo

class PatientCase {
	
	Date dateCreated
	Date lastUpdated

	// Part 1. Patient Information
	// 1. Testing category
	TestCategory testCategory
	// 5. Consultation and Admission Information
	Date prevConsultation				// Make this available if answer is yes
	String prevConsultationFacility		// Make this available if answer is yes
	Date prevAdmission 					// Make this available if answer is yes
	String prevAdmissionFacility		// Make this available if answer is yes
	String provinceRegionFacility		// Make this available if answer is yes

	// Disposition at Time of Report
	DispositionType dispositionType  	// admitted in hospital, admitted in isolation, in-home isolation, discharged, others
	Date dateDisposition				// name should change depending on disposition type
	String dispositionFacility

	// 7. Health Status at Consult
	HealthStatus healthStatus
	// 8. Case Classification
	CaseClassification caseClassification

	// Part 2. Case Investigation
	// 9. Special Population
	Boolean isHealthWorker
	Boolean isOFW
	Boolean isForeigner
	Boolean isLocallyStranded
	Boolean isClosedSetting
	String placeOrigin

	// 10-11 part of addresses in Patient
	// 12 ClinicalInfo
	// 13 LaboratoryInfo
	Date datePrevLabTest
	String prevLabTestName
	Integer totalPrevLabTest

	// Part 3. Contact Tracing
	// 15. Exposure History
	String closeContact = ['YES', 'NO', 'UNKNOWN']
	Date dateLastContact
	String riskPlaces = ['YES', 'NO', 'UNKNOWN']
	Date dateAttended
	String riskLocation
	// Vidits are handled by Address placesVisited

	// 16. History of Travel
	Boolean hasIntlTravel
	String originIntl
	TranspoType transpoIntl
	String transpoIDIntl
	Date dateDeptIntl
	Date dateArvlIntl
	Boolean hasDomTravel
	String originDom
	TranspoType transpoDom
	String transpoIDDom
	Date dateDeptDom
	Date dateArvlDom

	static hasOne = [clinicalTest: ClinicalInfo]
	static hasMany = [labTests: LaboratoryInfo, placesVisited: Address/*, contacts: Person*/]
    static constraints = {
    }
}
