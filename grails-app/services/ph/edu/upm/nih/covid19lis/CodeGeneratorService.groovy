package ph.edu.upm.nih.covid19lis

import grails.gorm.transactions.Transactional
import java.text.SimpleDateFormat

import ph.edu.upm.nih.covid19lis.patient.PatientCase
import ph.edu.upm.nih.covid19lis.patient.Patient
import ph.edu.upm.nih.covid19lis.info.Specimen

@Transactional
class CodeGeneratorService {

	/**
	*	Format: NIHC19-XX-XXXX
	*	XX = number of total cases divided by ten thousand
	*	XXXX = remainder of previous
	*/
    public def getCaseNum() {
    	def total = PatientCase.count()
        def caseNum = "NIHC19-"
        def quotient = (total / 10000).intValue()
        caseNum += String.format("%02d", quotient) + "-"
        def currentSerial = (total % 10000) + 1
        caseNum += String.format("%04d", currentSerial)

        caseNum
    }

    public def getPatientNum() {
    	def now = new Date()
        def year = new SimpleDateFormat('yyyy').format(now)
        def month = new SimpleDateFormat('MM').format(now)
    	def patientNum = "P-" + year + "-" + month + "-"

    	def total = Patient.countByPatientNumLike("P-" + year + "-%")
    	patientNum += String.format("%05d", total + 1)

    	patientNum
    }

    /**
    *   Format YYYY-XX-XXXX
    *   XX = number of total specimen divided by ten thousand
    *   XXXX = remainder of previous
    */
    public def getSpecimenNum() {
        def specimenNum = new SimpleDateFormat('yyyy').format(new Date()).toString() + "-"
        def total = Specimen.countBySpecimenNumLike(specimenNum + '%')
        def quotient = (total / 10000).intValue()
        specimenNum += String.format("%02d", quotient) + "-"
        def currentSerial = (total % 10000) + 1
        specimenNum += String.format("%04d", currentSerial)

    	specimenNum
    }
}
