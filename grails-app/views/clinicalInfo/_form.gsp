<div class="fieldcontain required">
    <label for="patientCase.id">
        Case
    </label>
    <% 
    	def patientCaseInstance = clinicalInfoInstance ? clinicalInfoInstance?.patientCase : ph.edu.upm.nih.covid19lis.patient.PatientCase.findById(params.long('patientCase'))
    %>
    <g:select name="patientCase.id" id="patientCase.id" class="validate" value="${patientCaseInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.PatientCase.list()}" optionKey="id" optionValue="patientCaseNum"  noSelection="['':'Select Case No.']" disabled="${patientCaseInstance != null}" />
</div>

%{-- Make the values change depending on the patientCase --}%
<div class="fieldcontain required">
    <label for="patient.id">
        Patient
    </label>
    <% def patientID = patientCaseInstance ? patientCaseInstance?.patient.id : params.long('patient') %>
    <g:select name="patient.id" id="patient.id" class="validate" value="${patientID}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" disabled="${patientID != null}" />
</div>

<g:if test="${!patientCaseInstance?.isAsymptomatic && patientCaseInstance?.healthStatus != ph.edu.upm.nih.covid19lis.patient.HealthStatus.ASYMPTOMATIC}">
<div class="fieldcontain required">
	<label for="symptoms">
		Symptoms
		<span class="required-indicator">*</span>
	</label>
	<g:select name="symptoms" id="symptoms" class="validate" value="${clinicalInfoInstance?.symptoms}" from="${ph.edu.upm.nih.covid19lis.info.Symptom}" optionKey="key" multiple="" required=""/>
</div>

<div class="fieldcontain required">
	<label for="bodyTemp">
		Body Temperature
	</label>
	<g:field type="number" name="bodyTemp" id="bodyTemp" value="${clinicalInfoInstance?.bodyTemp}" step="0.01" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="otherSymptoms">
		Other symptoms
	</label>
	<g:textField name="otherSymptoms" id="otherSymptoms" value="${clinicalInfoInstance?.otherSymptoms}" disabled="" />
</div>
</g:if>

<div class="fieldcontain required">
	<label for="hasChestRad">
		Has Chest Radiography test?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="hasChestRad" id="hasChestRad" checked="${clinicalInfoInstance?.hasChestRad}" />
</div>

<div class="fieldcontain required">
	<label for="dateChestRadTest">
		Date Tested
	</label>
	<g:datePicker name="dateChestRadTest" id="dateChestRadTest" value="${clinicalInfoInstance?.dateChestRadTest}" precision="day" disabled="${!clinicalInfoInstance?.hasChestRad}" />
</div>

<div class="fieldcontain required">
	<label for="chestRadResult">
		Chest Radiography Result
	</label>
	<g:select name="chestRadResult" id="chestRadResult" class="validate" value="${clinicalInfoInstance?.chestRadResult}" from="${ph.edu.upm.nih.covid19lis.info.ChestRadResult}" optionKey="key" noSelection="['':'Select Result']" disabled="${!clinicalInfoInstance?.hasChestRad}"/>
</div>

<div class="fieldcontain required">
	<label for="chestRadOtherResult">
		Other findings
	</label>
	<g:textField name="chestRadOtherResult" id="chestRadOtherResult" value="${clinicalInfoInstance?.chestRadOtherResult}" disabled="${clinicalInfoInstance?.chestRadResult != ph.edu.upm.nih.covid19lis.info.ChestRadResult.OTHER}" />
</div>

<div class="fieldcontain required">
	<label for="dateChestRadResult">
		Release Date of Result
	</label>
	<g:datePicker name="dateChestRadResult" id="dateChestRadTest" value="${clinicalInfoInstance?.dateChestRadResult}" precision="day" disabled="${!clinicalInfoInstance?.hasChestRad}" />
</div>

<div class="fieldcontain required">
	<label for="hasChestCT">
		Has Chest CT test?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="hasChestCT" id="hasChestCT" checked="${clinicalInfoInstance?.hasChestCT}" />
</div>

<div class="fieldcontain required">
	<label for="dateChestCTTest">
		Date Tested
	</label>
	<g:datePicker name="dateChestCTTest" id="dateChestCTTest" value="${clinicalInfoInstance?.dateChestCTTest}" precision="day" disabled="${!clinicalInfoInstance?.hasChestCT}" />
</div>

<div class="fieldcontain required">
	<label for="chestCTResult">
		Chest CT
	</label>
	<g:select name="chestCTResult" id="chestCTResult" class="validate" value="${clinicalInfoInstance?.chestCTResult}" from="${ph.edu.upm.nih.covid19lis.info.ChestCTResult}" optionKey="key" noSelection="['':'Select Result']" disabled="${!clinicalInfoInstance?.hasChestCT}"/>
</div>

<div class="fieldcontain required">
	<label for="chestRadOtherResult">
		Other findings
	</label>
	<g:textField name="chestRadOtherResult" id="chestRadOtherResult" value="${clinicalInfoInstance?.chestRadOtherResult}" disabled="${clinicalInfoInstance?.chestCTResult != ph.edu.upm.nih.covid19lis.info.ChestCTResult.OTHER}" />
</div>

<div class="fieldcontain required">
	<label for="dateChestCTResult">
		Release Date of Result
	</label>
	<g:datePicker name="dateChestCTResult" id="dateChestCTTest" value="${clinicalInfoInstance?.dateChestCTResult}" precision="day" disabled="${!clinicalInfoInstance?.hasChestCT}" />
</div>

<div class="fieldcontain required">
	<label for="hasLungUS">
		Has Lung Ultrasound test?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="hasLungUS" id="hasLungUS" checked="${clinicalInfoInstance?.hasLungUS}" />
</div>

<div class="fieldcontain required">
	<label for="dateLungUSTest">
		Date Tested
	</label>
	<g:datePicker name="dateLungUSTest" id="dateLungUSTest" value="${clinicalInfoInstance?.dateLungUSTest}" precision="day" disabled="${!clinicalInfoInstance?.hasLungUS}" />
</div>

<div class="fieldcontain required">
	<label for="lungUSResult">
		Chest CT
	</label>
	<g:select name="lungUSResult" id="lungUSResult" class="validate" value="${clinicalInfoInstance?.lungUSResult}" from="${ph.edu.upm.nih.covid19lis.info.LungUSResult}" optionKey="key" noSelection="['':'Select Result']" disabled="${!clinicalInfoInstance?.hasLungUS}"/>
</div>

<div class="fieldcontain required">
	<label for="lungUSOtherResult">
		Other findings
	</label>
	<g:textField name="lungUSOtherResult" id="lungUSOtherResult" value="${clinicalInfoInstance?.lungUSOtherResult}" disabled="${clinicalInfoInstance?.lungUSResult != ph.edu.upm.nih.covid19lis.info.LungUSResult.OTHER}" />
</div>

<div class="fieldcontain required">
	<label for="dateLungUSResult">
		Release Date of Result
	</label>
	<g:datePicker name="dateLungUSResult" id="dateLungUSResult" value="${clinicalInfoInstance?.dateLungUSResult}" precision="day" disabled="${!clinicalInfoInstance?.hasLungUS}" />
</div>

<g:javascript>
	$(document).ready(function() {
		$("[name*='dateChestRad']").prop('disabled', !$("#hasChestRad").is(':checked'))
		$("[name*='dateChestCT']").prop('disabled', !$("#hasChestCT").is(':checked'))
		$("[name*='dateLungUS']").prop('disabled', !$("#hasLungUS").is(':checked'))

		$("#symptoms").change(function() {
			var on = ($(this).val().indexOf('FEVER') > -1)
			$("#bodyTemp").prop('disabled', !on).prop('required', on)
		})

		$("#hasChestRad").change(function() {
			var on = $(this).is(':checked')
			$("#chestRadResult, [name*='dateChestRad']").prop('disabled', !on).prop('required', on)
			$("#chestRadResult").change(function() {
				var isOthers = $(this).val() == 'OTHER'
				$("#chestRadOtherResult").prop('disabled', !isOthers).prop('required', isOthers)
			})
		})

		$("#hasChestCT").change(function() {
			var on = $(this).is(':checked')
			$("#chestCTResult, [name*='dateChestCT']").prop('disabled', !on).prop('required', on)
			$("#chestCTResult").change(function() {
				var isOthers = $(this).val() == 'OTHER'
				$("#chestCTOtherResult").prop('disabled', !isOthers).prop('required', isOthers)
			})
		})

		$("#hasLungUS").change(function() {
			var on = $(this).is(':checked')
			$("#lungUSResult, [name*='dateLungUS']").prop('disabled', !on).prop('required', on)
			$("#lungUSResult").change(function() {
				var isOthers = $(this).val() == 'OTHER'
				$("#lungUSOtherResult").prop('disabled', !isOthers).prop('required', isOthers)
			})
		})
	})
</g:javascript>