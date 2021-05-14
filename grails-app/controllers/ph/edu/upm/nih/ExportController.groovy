package ph.edu.upm.nih

import org.springframework.security.access.annotation.Secured
import org.docx4j.openpackaging.packages.WordprocessingMLPackage
import org.docx4j.model.datastorage.migration.VariablePrepare


@Secured(['IS_AUTHENTICATED_FULLY'])
class ExportController {

    public static String FORM_A_TEMPLATE = "Form A.docx"

    /*
    * Sources:
    *   https://rieckpil.de/howto-generate-documents-from-word-templates-with-docx4j-on-wildfly-14/
    *   http://blogs.bytecode.com.au/glen/2010/11/04/creating-word-docx-documents-dynamically-from-grails-or-java.html
    *
    */
    def generateFormA() {
        def templateInputStream = getClass().getResources('/templates/' + FORM_A_TEMPLATE)
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

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
