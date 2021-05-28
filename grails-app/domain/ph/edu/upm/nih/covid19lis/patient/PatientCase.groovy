package ph.edu.upm.nih.covid19lis.patient

import ph.edu.upm.nih.covid19lis.info.ClinicalInfo
import ph.edu.upm.nih.covid19lis.info.Specimen
import ph.edu.upm.nih.Address
import ph.edu.upm.nih.Person
class PatientCase {
	
	Date dateCreated
	Date lastUpdated
	String caseNum
	
	// Part 1. Patient Information
	// 1. Testing category
	Date dateInterviewed
	String diseaseReportingUnit
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
	static hasMany = [labTests: Specimen, placesVisited: Address, contacts: Person]
    
    static constraints = {
    	patient nullable: false

    	dateInterviewed nullable: false, blank: false
    	diseaseReportingUnit nullable: false, blank: false
    	caseNum nullable: true, blank: true, unique: true		// Temporary. A case number shall be auto generated.
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

    public static def getFacilities() {
    	def facilities = PatientCase.executeQuery("SELECT diseaseReportingUnit FROM PatientCase GROUP BY diseaseReportingUnit ORDER BY diseaseReportingUnit ASC")

    	facilities
    }

    public static def getByDateAndFacility(Date start = null, Date end = null, String facility) {
        def patientCaseList
        if(start && !end) end = start
        else if(!start && end) start = end

        if(!start && !end && !facility) {
            patientCaseList = PatientCase.list()
        } else if (!start && !end && facility) { 
        	patientCaseList = PatientCase.executeQuery("FROM PatientCase WHERE diseaseReportingUnit = :facility", [facility: facility])
        } else if(start && end && !facility) {
            patientCaseList = PatientCase.executeQuery("FROM PatientCase WHERE dateInterviewed BETWEEN :start AND :end", [start: start, end: end])
        } else {
        	patientCaseList = PatientCase.executeQuery("FROM PatientCase WHERE diseaseReportingUnit = :facility AND dateInterviewed BETWEEN :start AND :end", [facility: facility, start: start, end: end])
        }

        patientCaseList
    }

    public def getLatestResult() {
    	this.labTests?.last()?.labResult
    }

    public def getLatestStatus() {
    	this.labTests?.last()?.status
    }

    public def getOrdinal() {
        def i = patient.patientCase.findIndexOf{it == this} + 1
        def suffixes = ["th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th"]
        def ordinal
        switch (i % 100) {
        case 11:
        case 12:
        case 13:
            ordinal = i + "th"
        default:
            ordinal = i + suffixes[i % 10]

        }

        ordinal
    }
}
