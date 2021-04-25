<div class="fieldcontain required">
    <label for="patientCase.id">
        Case
    </label>
    <% 
    	def patientCaseInstance = specimenInstance ? specimenInstance?.patientCase : ph.edu.upm.nih.covid19lis.patient.PatientCase.findById(params.long('patientCase'))
    %>
    <g:select name="patientCase.id" id="patientCase.id" class="validate" value="${patientCaseInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.PatientCase.list()}" optionKey="id" optionValue="patientCaseNum"  noSelection="['':'Select Case No.']" required="" />
</div>

%{-- Make the values change depending on the patientCase --}%
<div class="fieldcontain required">
    <label for="patient.id">
        Patient
    </label>
    <% def patientID = patientCaseInstance ? patientCaseInstance?.patient.id : params.long('patient') %>
    <g:select name="patient.id" id="patient.id" class="validate" value="${patientID}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" disabled=""/>
</div>

<div class="fieldcontain required">
	<label for="dateCollected">
		Date Collected
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateCollected" id="dateCollected" value="${specimenInstance?.dateCollected}" precision="day" required="" />
</div>

<div class="fieldcontain required">
	<label for="labTest">
		Laboratory Test Type
		<span class="required-indicator">*</span>
	</label>
	<g:select name="labTest" id="labTest" class="validate" value="${specimenInstance?.labTest}" from="${ph.edu.upm.nih.covid19lis.info.LabTest}" optionKey="key" noSelection="['':'Select Test']" required=""/>
</div>

<div class="fieldcontain required">
	<label for="testKit">
		Test Kit Used
		<span class="required-indicator">*</span>
	</label>
	<g:select name="testKit" id="testKit" class="validate" value="${specimenInstance?.testKit}" from="${ph.edu.upm.nih.covid19lis.info.TestKit.list()}" optionKey="id" optionValue="lotNum" noSelection="['':'Select Kit']" required=""/>
</div>

<div class="fieldcontain required">
	<label for="specimenRemarks">
		Remarks
	</label>
	<g:textArea name="specimenRemarks" id="specimenRemarks" value="${specimenInstance?.specimenRemarks}" rows="5" cols="40" />
</div>

%{-- Show only when specimen are accepted --}%
<g:if test="${specimenInstance?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_PROCESSING}">
<h2>Result</h2>
<div class="fieldcontain required">
	<label for="labResult">
		Result
	</label>
	<g:select name="labResult" id="labResult" class="validate" value="${specimenInstance?.labResult}" from="${ph.edu.upm.nih.covid19lis.info.LabResult}" optionKey="key" noSelection="['':'Select Result']" disabled="${specimenInstance?.labResult != null}"/>
</div>

<div class="fieldcontain required">
	<label for="resultRemarks">
		Remarks
	</label>
	<g:textArea name="resultRemarks" id="resultRemarks" value="${specimenInstance?.resultRemarks}" rows="5" cols="40"/>
</div>
</g:if>