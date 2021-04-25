package ph.edu.upm.nih.covid19lis.patient

import ph.edu.upm.nih.covid19lis.info.ClinicalInfo
import ph.edu.upm.nih.covid19lis.info.Specimen
import ph.edu.upm.nih.Address
class PatientCase {
	
	Date dateCreated
	Date lastUpdated
	String patientCaseNum
	
	// Part 1. Patient Information
	// 1. Testing category
	Date dateInterviewed
	ClientType clientType
	TestCategory testCategory
	// 5. Consultation and Admission Information
	Date prevConsultation				// Make this available if answer is yes
	String prevConsultationFacility		// Make this available if answer is yes
	Date prevAdmission 					// Make this available if answer is yes
	String prevAdmissionFacility		// Make this available if answer is yes

	// Disposition at Time of Report
	DispositionType dispositionType  	// admitted in hospital, admitted in isolation, in-home isolation, discharged, others
	Date datetimeDisposition				// name should change depending on disposition type
	String dispositionFacility

	// 7. Health Status at Consult
	HealthStatus healthStatus
	// 8. Case Classification
	CaseClassification caseClassification

	// Part 2. Case Investigation
	// 10-11 part of addresses in Patient
	// 12 ClinicalInfo
	Date dateIllnessOnset
	Boolean isAsymptomatic = false
	Boolean isPregnant = false
	Date dateLMP							// Last Menstrual Period. Available if isPregnant is true
	Boolean isHighRiskPregnancy	= false		// Available if isPregnant is true
	Boolean hasSARI = false						// Sever Acute Respiratory Illness
	// 13 LaboratoryInfo
	Date datePrevLabTest
	String prevLabTestName
	Integer totalPrevLabTest

	// Part 3. Contact Tracing
	// 15. Exposure History
	String closeContact
	Date dateLastContact
	String highRiskPlace
	// Visits are handled by Address placesVisited

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
	

	static belongsTo = [patient: Patient]
	static hasOne = [clinicalTest: ClinicalInfo]
	static hasMany = [labTests: Specimen, placesVisited: Address/*, contacts: Person*/]
    
    static constraints = {
    	patient nullable: false

    	dateInterviewed nullable: false, blank: false
    	patientCaseNum nullable: true, blank: true, unique: true		// Temporary. A case number shall be auto generated.
    	clientType nullable: false
    	testCategory nullable: false

    	prevConsultation nullable: true, blank: true
    	prevConsultationFacility nullable: true, blank: true
    	prevAdmission nullable: true, blank: true
    	prevAdmissionFacility nullable: true, blank: true

    	dispositionType nullable: false
    	datetimeDisposition nullable: true, blank: true
    	dispositionFacility nullable: true, blank: true

    	healthStatus nullable: false, blank: false
    	caseClassification nullable: false, blank: false

    	dateIllnessOnset nullable: false, blank: false
    	dateLMP nullable: true, blank: true

    	datePrevLabTest nullable: true, blank: true
    	prevLabTestName nullable: true, blank: true
    	totalPrevLabTest nullable: true, blank: true

    	closeContact nullable: false, blank: false
    	dateLastContact nullable: true, blank: true

    	originIntl nullable: true, blank: true
		transpoIntl nullable: true
		transpoIDIntl nullable: true, blank: true
		dateDeptIntl nullable: true, blank: true
		dateArvlIntl nullable: true, blank: true
		originDom nullable: true, blank: true
		transpoDom nullable: true
		transpoIDDom nullable: true, blank: true
		dateDeptDom nullable: true, blank: true
		dateArvlDom nullable: true, blank: true

    	clinicalTest nullable: true
    	labTests nullable: true
    	placesVisited nullable: true
    	// contacts nullable: true
    }
}
