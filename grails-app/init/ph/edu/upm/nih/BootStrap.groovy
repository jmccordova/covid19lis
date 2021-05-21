package ph.edu.upm.nih

import ph.edu.upm.nih.covid19lis.info.TestKit
import ph.edu.upm.nih.covid19lis.info.TestKitType
import ph.edu.upm.nih.covid19lis.patient.Patient

import ph.edu.upm.nih.Sex
import ph.edu.upm.nih.CivilStatus

import ph.edu.upm.nih.Role
import ph.edu.upm.nih.Staff
import ph.edu.upm.nih.StaffRole

class BootStrap {

	def codeGeneratorService
	
    def init = { servletContext ->
        if(!TestKit.findByLotNumInList(["EXTRACT1", "ABC123AB1", "ABC123AB2"])) {
            new TestKit(dateReceived: new Date(), brand: "Sample Extraction Kit 1", lotNum: "EXTRACT1", dateExpiration: "2025-12-22T20:19:52Z", testKitType: TestKitType.EXTRACT, totalReceived: 50).save(failOnError: true)
            new TestKit(dateReceived: new Date(), brand: "Sample PCR Kit 1", lotNum: "ABC123AB1", dateExpiration: "2025-12-22T20:19:52Z", testKitType: TestKitType.PCR, totalReceived: 50).save(failOnError: true)
            new TestKit(dateReceived: new Date(), brand: "Sample PCR Kit 1", lotNum: "ABC123AB2", dateExpiration: "2022-01-01T20:19:52Z", testKitType: TestKitType.PCR, totalReceived: 50).save(failOnError: true)
        }
    	
        if(!Patient.findByEmailAddressInList(["mjudron0@amazon.co.jp", "rdurante1@storify.com", "adevonald2@google.cn"])) {
        	new Patient(patientNum: codeGeneratorService.getPatientNum(), firstName: "Mathe", middleName: "Gough", lastName: "Judron", contactNumber: "3794388208", emailAddress: "mjudron0@amazon.co.jp", birthday: "2011-12-22T20:19:52Z", philHealthNum: '12341234123', sex: Sex.MALE, civilStatus: CivilStatus.SINGLE, nationality: "France", occupation: "Registered Nurse").save(failOnError: true)
        	new Patient(patientNum: codeGeneratorService.getPatientNum(), firstName: "Rachael", middleName: "Roddell", lastName: "Durante", contactNumber: "4181841451", emailAddress: "rdurante1@storify.com", birthday: "2020-10-23T16:17:15Z", philHealthNum: '12342343421', sex: Sex.FEMALE, civilStatus: CivilStatus.MARRIED, nationality: "Brazil", occupation: "Assistant Media Planner").save(failOnError: true)
        	new Patient(patientNum: codeGeneratorService.getPatientNum(), firstName: "Ardene", middleName: "Poon", lastName: "Devonald", contactNumber: "7143792760", emailAddress: "adevonald2@google.cn", birthday: "1938-02-07T21:03:34Z",philHealthNum: '', sex: Sex.FEMALE, civilStatus: CivilStatus.WIDOWED, nationality: "United States", occupation: "Product Engineer").save(failOnError: true)
        }
        
        if(!Role.findByAuthorityInList(["ROLE_MT", "ROLE_QA", "ROLE_MB", "ROLE_SUP", "ROLE_PATH"])) {
            new Role(authority: "ROLE_MT", name: "Medical Technician").save(failOnError: true)
            new Role(authority: "ROLE_QA", name: "Quality Assurance").save(failOnError: true)
            new Role(authority: "ROLE_MB", name: "Molecular Biologist").save(failOnError: true)
            new Role(authority: "ROLE_SUP", name: "Supervisor").save(failOnError: true)
            new Role(authority: "ROLE_PATH", name: "Supervisor/Pathologist").save(failOnError: true)

            StaffRole.withTransaction { status -> 
                StaffRole.create(new Staff(username: 'sample', prcNum: 'No license', password: 'password', firstName: "Super", lastName: "Admin", contactNumber: "00011011010", emailAddress: "sample@sample.com").save(failOnError: true), new Role(authority: "ROLE_SUPERADMIN", name: "Superadmin").save(failOnError: true), true)
                StaffRole.create(new Staff(username: 'encoder', prcNum: '1283719', password: 'password', firstName: "Encoder", lastName: "Sample", contactNumber: "00011012010", emailAddress: "encoder1@sample.com").save(failOnError: true), new Role(authority: "ROLE_ENCODER", name: "Encoder").save(failOnError: true), true)
            }
        }
    }

    def destroy = {
    }
}
