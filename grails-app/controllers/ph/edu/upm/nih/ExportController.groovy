package ph.edu.upm.nih

import ph.edu.upm.nih.covid19lis.info.Specimen
import ph.edu.upm.nih.Address
import ph.edu.upm.nih.AddressType
import ph.edu.upm.nih.covid19lis.info.LabResult

import org.springframework.security.access.annotation.Secured
import org.docx4j.openpackaging.packages.WordprocessingMLPackage
import org.docx4j.model.datastorage.migration.VariablePrepare
import pl.touk.excel.export.WebXlsxExporter
import pl.touk.excel.export.XlsxExporter


@Secured(['IS_AUTHENTICATED_FULLY'])
class ExportController {

    def springSecurityService
    public static String TEMPLATE_URL = '/templates/'
    public static String FORM_A_TEMPLATE = "Form A.docx"
    public static String LINE_LIST_TEMPLATE = "Line List.xlsx"
    public static String SOURCE_FILE_TEMPLATE = "Source File.xlsx"

    /*
    * Sources:
    *   https://rieckpil.de/howto-generate-documents-from-word-templates-with-docx4j-on-wildfly-14/
    *   http://blogs.bytecode.com.au/glen/2010/11/04/creating-word-docx-documents-dynamically-from-grails-or-java.html
    *
    */
    def generateFormA() {
        def templateInputStream = getClass().getResources(TEMPLATE_URL + FORM_A_TEMPLATE)
        def wordMLPackage = WordprocessingMLPackage.load(templateInputStream);
        def documentPart = wordMLPackage.getMainDocumentPart();
        VariablePrepare.prepare(wordMLPackage);
        def variables = [:]
        // foreach in here
        documentPart.variableReplace(variables)
        def file = File.createTempFile("wordexport-", ".docx")
        wordMLPackage.save(file)

        // and send it all back to the browser
        response.setHeader("Content-disposition", "attachment; filename=assets.docx");
        response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
        response.outputStream << file.readBytes()
        file.delete()
    }

    def lineList() {
        render view: 'lineList'
    }

    def generateLineList() {
        def startDate = params.startDate ? params.date('startDate', 'yyyy-MM-dd') : null
        def endDate = params.endDate ? params.date('endDate', 'yyyy-MM-dd') : null
        def specimenList = Specimen.getByDate(startDate, endDate)

        def template = grailsAttributes.getApplicationContext().getResource(TEMPLATE_URL + LINE_LIST_TEMPLATE).getFile().toString()
        def webXlsx = new WebXlsxExporter(template)
        def sheetName = "Line List Template"
        def blankSheet = webXlsx.sheet(sheetName)

        webXlsx.with {
            setResponseHeaders(response)
            def workbook = webXlsx.getWorkbook()
            def currentSheet = sheet(sheetName)

            currentSheet.with {
                def i = 1
                specimenList.each {
                    putCellValue(i, 0, it?.specimenNum)
                    putCellValue(i, 1, it?.patientCase?.patient?.lastName)
                    putCellValue(i, 2, it?.patientCase?.patient?.firstName)
                    putCellValue(i, 3, it?.patientCase?.patient?.middleName)
                    putCellValue(i, 4, it?.patientCase?.patient?.birthday?.format("MMM dd, yyyy"))
                    putCellValue(i, 5, it?.patientCase?.patient?.sex?.toString())
                    def homeAddress = Address.findByPatientAndAddressType(it?.patientCase?.patient, AddressType.CURR_HOME)
                    if(homeAddress) {
                        putCellValue(i, 6, homeAddress?.province)
                        putCellValue(i, 7, homeAddress?.municipality)
                        putCellValue(i, 8, homeAddress?.barangay)                        
                    }
                    putCellValue(i, 9, it?.healthFacilityName)
                    putCellValue(i, 10, it?.patientCase?.dateIllnessOnset?.format("MMM dd, yyyy"))
                    putCellValue(i, 11, it?.dateCollected?.format("MMM dd, yyyy"))
                    putCellValue(i, 12, it?.dateCreated?.format("MMM dd, yyyy"))
                    putCellValue(i, 13, it?.dateReleased ? it?.dateReleased?.format("MMM dd, yyyy") : '')
                    putCellValue(i, 14, it?.labTest?.toString())
                    putCellValue(i, 15, it?.specimenNum)
                    putCellValue(i, 16, it?.labResult.toString())
                    putCellValue(i, 17, it?.resultRemarks ? it?.resultRemarks : '')
                    if(homeAddress) {
                        putCellValue(i, 18, homeAddress?.houseNum)
                        putCellValue(i, 19, homeAddress?.cellNumber + "/" + homeAddress?.phoneNumber)
                    }
                    i++
                }
            }

            response.setContentType('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response.setHeader('Content-Disposition', 'Attachment;Filename="Line List.xlsx"')
            save(response.outputStream)
        }

        redirect action: 'lineList'
    }

    def sourceFile() {
        render view: 'sourceFile'
    }

    def generateSourceFile() {
        def startDate = params.startDate ? params.date('startDate', 'yyyy-MM-dd') : null
        def endDate = params.endDate ? params.date('endDate', 'yyyy-MM-dd') : null
        def specimenList = Specimen.getByDate(startDate, endDate)

        def template = grailsAttributes.getApplicationContext().getResource(TEMPLATE_URL + SOURCE_FILE_TEMPLATE).getFile().toString()
        def webXlsx = new WebXlsxExporter(template)
        def sheetName = "SOURCEFILE"
        def blankSheet = webXlsx.sheet(sheetName)

        webXlsx.with {
            setResponseHeaders(response)
            def workbook = webXlsx.getWorkbook()
            def currentSheet = sheet(sheetName)

            currentSheet.with {
                def i = 1
                def now = new Date().format("MMM dd, yyyy")
                specimenList.each {
                    putCellValue(i, 1, it?.specimenNum)
                    putCellValue(i, 2, it?.dateCollected?.format("MMM dd, yyyy"))
                    putCellValue(i, 3, it?.dateCreated?.format("MMM dd, yyyy"))
                    putCellValue(i, 4, it?.patientCase?.patient?.lastName)
                    putCellValue(i, 5, it?.patientCase?.patient?.firstName)
                    putCellValue(i, 6, it?.patientCase?.patient?.middleName)
                    putCellValue(i, 7, it?.patientCase?.patient?.birthday?.format("MMM dd, yyyy"))
                    putCellValue(i, 8, it?.patientCase?.patient?.age)
                    putCellValue(i, 9, it?.patientCase?.patient?.sex?.toString())
                    putCellValue(i, 10, it?.labTest?.toString())
                    putCellValue(i, 11, it?.patientCase?.diseaseReportingUnit)
                    putCellValue(i, 12, it?.ordinal)    // How many tests done per case per patient or how many case for this patient? 
                    putCellValue(i, 13, it?.approverMT1 ? it?.approverMT1?.fullName : '')
                    putCellValue(i, 14, it?.approverMT1 ? it?.approverMT1?.prcNum : '')
                    putCellValue(i, 15, it?.approverMT2 ? it?.approverMT2?.fullName : '')
                    putCellValue(i, 16, it?.approverMT2 ? it?.approverMT2?.prcNum : '')
                    putCellValue(i, 17, it?.approverMB ? it?.approverMB?.fullName : '')
                    putCellValue(i, 18, it?.approverSUP ? it?.approverSUP?.fullName : '')
                    putCellValue(i, 19, it?.approverSUP ? it?.approverSUP?.prcNum : '')
                    putCellValue(i, 20, it?.approverQA ? it?.approverQA?.fullName : '')
                    putCellValue(i, 21, it?.dateAnalyzed ? it?.dateAnalyzed?.format("MMM dd, yyyy") : '')
                    putCellValue(i, 22, it?.dateReleased ? it?.dateReleased?.format("MMM dd, yyyy") : '')
                    def result
                    if(it?.labResult == LabResult.NEGATIVE) result = 'SARS-CoV-2 viral RNA NOT detected'
                    else if(it?.labResult == LabResult.POSITIVE) result = 'SARS-CoV-2 viral RNA detected'
                    else result = it?.labResult?.toString()
                    putCellValue(i, 23, result)
                    putCellValue(i, 24, it?.labResult?.key + " for SARS-CoV-2 (causative agent)")
                    putCellValue(i, 25, it?.extractionKit.brand)
                    putCellValue(i, 26, it?.extractionKit.lotNum)
                    putCellValue(i, 27, it?.extractionKit.dateExpiration.format("MMM dd, yyyy"))
                    if(it?.pcrKit) {
                        putCellValue(i, 28, it?.pcrKit.brand)
                        putCellValue(i, 29, it?.pcrKit.lotNum)
                        putCellValue(i, 30, it?.pcrKit.dateExpiration.format("MMM dd, yyyy"))                        
                    }
                    putCellValue(i, 31, it?.specimenRemarks ? it?.specimenRemarks : '')
                    def homeAddress = Address.findByPatientAndAddressType(it?.patientCase?.patient, AddressType.CURR_HOME)
                    if(homeAddress) {
                        putCellValue(i, 32, homeAddress?.houseNum)
                        putCellValue(i, 33, homeAddress?.province)
                        putCellValue(i, 34, homeAddress?.municipality)
                        putCellValue(i, 35, homeAddress?.barangay)
                        putCellValue(i, 36, homeAddress?.cellNumber + "/" + homeAddress?.phoneNumber)
                    }
                    putCellValue(i, 37, it?.patientCase?.dateIllnessOnset?.format("MMM dd, yyyy"))
                    putCellValue(i, 38, it?.patientCase?.patient?.philHealthNum ? it?.patientCase?.patient?.philHealthNum : '')
                    putCellValue(i, 39, it?.patientCase?.testCategory?.key)
                    putCellValue(i, 40, it?.resultRemarks ? it?.resultRemarks : '')
                    putCellValue(i, 41, springSecurityService?.currentUser?.fullName)
                    putCellValue(i, 42, now)
                    i++
                }
            }

            response.setContentType('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
            response.setHeader('Content-Disposition', 'Attachment;Filename="Source File.xlsx"')
            save(response.outputStream)
        }

        redirect action: 'sourceFile'
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'export.label', default: 'Export'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
