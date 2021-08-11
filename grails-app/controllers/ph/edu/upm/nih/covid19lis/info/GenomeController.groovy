package ph.edu.upm.nih.covid19lis.info

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.springframework.security.access.annotation.Secured
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest.StandardMultipartFile

@Secured(['ROLE_SUPERADMIN', 'ROLE_ENCODER', 'ROLE_PGC'])
class GenomeController {

    GenomeService genomeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render view: 'index', model: [genomeList: genomeService.list()]
    }

    def show(Long id) {
        render view: 'show', model: [genomeInstance: genomeService.get(id)]
    }

    def create() {
        respond new Genome(params)
    }

    def save(Genome genome) {
        if (genome == null) {
            notFound()
            return
        }

        genome.clearErrors()

        try {

            if(params.genomeFile) {
                def genomeFile = params.genomeFile
                if(!genomeFile.empty) {
                    deleteFile(genome.genomeFile)
                    genome.genomeFile = this.upload(genomeFile, genome?.specimen?.specimenNum)
                }
            }
            
            genome.validate()
            genomeService.save(genome)
        } catch (ValidationException e) {
            println e
            respond genome.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'genome.label', default: 'Genome'), genome.id])
                redirect genome
            }
            '*' { respond genome, [status: CREATED] }
        }
    }

    def edit(Long id) {
        render view: 'edit', model: [genomeInstance: genomeService.get(id)]
    }

    def update(Genome genome) {
        if (genome == null) {
            notFound()
            return
        }

        try {
            genomeService.save(genome)
        } catch (ValidationException e) {
            respond genome.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'genome.label', default: 'Genome'), genome.id])
                redirect genome
            }
            '*'{ respond genome, [status: OK] }
        }
    }

    private def upload(StandardMultipartFile f, String specimenNum) {
        try {
            def webroot = servletContext.getRealPath("/")
            def uploadPath

            if(System.properties["os.name"].indexOf('Lin') > -1)
                uploadPath = webroot + "uploads/genome/";
            else if(System.properties["os.name"].indexOf('Win') > -1)
                uploadPath = webroot + "uploads\\genome\\";

            File directory = new File(uploadPath)
            directory.mkdirs()

            if(directory.exists()) {
                def fileExtension = f.originalFilename.replace(".", ";").split(";")
                fileExtension = fileExtension[fileExtension.length - 1]

                def filePath = uploadPath + specimenNum + "." + fileExtension
                def file = new File(filePath)

                f.transferTo(file)
                return filePath
            } else {
                return false
            }
        } catch (Exception e) {
            log.error "Error: ${e.message}"
        }
    }

    private def deleteFile(String fileName) {
        if(!fileName) return false

        File file = new File(fileName)
        file.delete()
    }

    public def download(Genome genomeInstance) {
        if(!genomeInstance) {
            notFound()
            return
        }

        def file = new File(genomeInstance?.genomeFile)

        if (file.exists()) {
           response.setContentType("application/octet-stream")
           response.setHeader("Content-disposition", "filename=${file.name}")
           response.outputStream << file.bytes
        } else {
            notFound()
        }
        
        return
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        genomeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'genome.label', default: 'Genome'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'genome.label', default: 'Genome'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
