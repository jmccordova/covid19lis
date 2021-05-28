package ph.edu.upm.nih.covid19lis

import grails.gorm.transactions.Transactional
import ph.edu.upm.nih.covid19lis.info.LabResult
import ph.edu.upm.nih.covid19lis.info.Specimen

@Transactional
class StatisticsService {

    private def getResultCount(LabResult result, Date date, String facility) {
        def query = "SELECT COUNT(id) AS total FROM Specimen WHERE dateReleased = :dateReleased AND labResult = :labResult AND patientCase.diseaseReportingUnit = :diseaseReportingUnit"
        def paramMap = [dateReleased: date, labResult: result, diseaseReportingUnit: facility]

        def stats = Specimen.executeQuery(query, paramMap)
        
        stats?.first()
    }

    private def getResultCount(LabResult result, String facility) {
        def query = "SELECT COUNT(id) AS total FROM Specimen WHERE labResult = :labResult AND patientCase.diseaseReportingUnit = :diseaseReportingUnit"
        def paramMap = [labResult: result, diseaseReportingUnit: facility]

        def stats = Specimen.executeQuery(query, paramMap)
        
        stats?.first()
    }

    private def getResultCount(LabResult result, Date date) {
        def query = "SELECT COUNT(id) AS total FROM Specimen WHERE dateReleased = :dateReleased AND labResult = :labResult"
        def paramMap = [dateReleased: date, labResult: result]

        def stats = Specimen.executeQuery(query, paramMap)
        
        stats?.first()
    }

    private def getResultCount(LabResult result) {
        def query = "SELECT COUNT(id) AS total FROM Specimen WHERE labResult = :labResult"
        def paramMap = [labResult: result]

        def stats = Specimen.executeQuery(query, paramMap)
        
        stats?.first()
    }

    private def getAllStats(Date date) {
        def stat = ["positive": this.getResultCount(LabResult.POSITIVE, date), 
                    "negative": this.getResultCount(LabResult.NEGATIVE, date), 
                    "equivocal": this.getResultCount(LabResult.EQUIVOCAL, date),
                    "invalid": this.getResultCount(LabResult.REJECT, date),
                    "pending": this.getResultCount(LabResult.PENDING, date)  
                    ]

        stat
    }

    private def getAllStats(Date date, String facility) {
        def stat = ["positive": this.getResultCount(LabResult.POSITIVE, date, facility), 
                    "negative": this.getResultCount(LabResult.NEGATIVE, date, facility), 
                    "equivocal": this.getResultCount(LabResult.EQUIVOCAL, date, facility),
                    "invalid": this.getResultCount(LabResult.REJECT, date, facility),
                    "pending": this.getResultCount(LabResult.PENDING, date, facility)  
                    ]

        stat
    }

    private def getAllStats(String facility) {
        def stat = ["positive": this.getResultCount(LabResult.POSITIVE, facility), 
                    "negative": this.getResultCount(LabResult.NEGATIVE, facility), 
                    "equivocal": this.getResultCount(LabResult.EQUIVOCAL, facility),
                    "invalid": this.getResultCount(LabResult.REJECT, facility),
                    "pending": this.getResultCount(LabResult.PENDING, facility)  
                    ]

        stat
    }

    private def getAllStats() {
        def stat = ["positive": this.getResultCount(LabResult.POSITIVE), 
                    "negative": this.getResultCount(LabResult.NEGATIVE), 
                    "equivocal": this.getResultCount(LabResult.EQUIVOCAL),
                    "invalid": this.getResultCount(LabResult.REJECT),
                    "pending": this.getResultCount(LabResult.PENDING)  
                    ]

        stat
    }

    public def getSpecimenResults(Date start, Date end, String facility) {
        def stats = []
        start = Date.parse("yyyy-MM-dd", start?.format("yyyy-MM-dd"))
        end = Date.parse("yyyy-MM-dd", end?.format("yyyy-MM-dd"))
        for(date in start..end) {
            stats += [date: date?.format('MMMM d, yyyy'), stats: this.getAllStats(date, facility)]
        }

        stats
    }

    public def getSpecimenResults(Date date, String facility) {
    	date = Date.parse("yyyy-MM-dd", date?.format("yyyy-MM-dd"))
        def stats = [date: date?.format('MMMM d, yyyy'), stats: this.getAllStats(date, facility)]

        stats
    }

    public def getSpecimenResults(String facility) {
    	def now = new Date()
        def oldSpecimen = Specimen.executeQuery("SELECT dateCreated FROM Specimen ORDER BY dateCreated ASC", [max: 1])
    	def start = oldSpecimen?.isEmpty() ? new Date() : oldSpecimen?.first() 
    	def newSpecimen = Specimen.executeQuery("SELECT dateCreated FROM Specimen ORDER BY dateCreated DESC", [max: 1])
    	def end = newSpecimen?.isEmpty() ? new Date() : (newSpecimen?.first() >= now ? newSpecimen?.first() : now)

    	start = Date.parse("yyyy-MM-dd", start?.format("yyyy-MM-dd"))
        end = Date.parse("yyyy-MM-dd", end?.format("yyyy-MM-dd"))

        def stats = []
        for(date in start..end) {
            stats += [date: date?.format('MMMM d, yyyy'), stats: this.getAllStats(date, facility)]
        }

        stats
    }

    public def getSpecimenResults() {
    	def now = new Date()
    	def oldSpecimen = Specimen.executeQuery("SELECT dateCreated FROM Specimen ORDER BY dateCreated ASC", [max: 1])
    	def start = oldSpecimen?.isEmpty() ? new Date() : oldSpecimen?.first() 
    	def newSpecimen = Specimen.executeQuery("SELECT dateCreated FROM Specimen ORDER BY dateCreated DESC", [max: 1])
    	def end = newSpecimen?.isEmpty() ? new Date() : (newSpecimen?.first() >= now ? newSpecimen?.first() : now)
        
        start = Date.parse("yyyy-MM-dd", start?.format("yyyy-MM-dd"))
        end = Date.parse("yyyy-MM-dd", end?.format("yyyy-MM-dd"))

        def stats = []
        for(date in start..end) {
            stats += [date: date?.format('MMMM d, yyyy'), stats: this.getAllStats(date)]
        }

        stats
    }

    public def getGlobalSpecimenResults() {
    	def stats = this.getAllStats()

    	stats
    }
}
