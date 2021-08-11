package ph.edu.upm.nih.covid19lis.info

class Genome {

    Date dateSequenced
    String strain
    String findings
    String genomeFile

    static belongsTo = [specimen: Specimen]

    static constraints = {    	
        dateSequenced nullable: false, blank: false
        strain nullable: false, blank: false
        findings nullable: true, blank: true
        genomeFile nullable: true, blank: true
        specimen nullable: false
    }

}
