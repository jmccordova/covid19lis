<div class="fieldcontain required">
    <label for="patient.id">
        Patient
    </label>
    <% def patientNum = patientCaseInstance ? patientCaseInstance?.patient.id : params.long('patient') %>
    <g:select name="patient.id" id="patient.id" class="validate select2" value="${patientNum}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" required="${patientNum == null}"/>
</div>

<h2>Preliminary</h2>
<div class="fieldcontain required">
	<label for="dateInterviewed">
		Date of Interview
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateInterviewed" id="dateInterviewed" value="${patientCaseInstance?.dateInterviewed}" precision="day" required="" />
</div>

<div class="fieldcontain required">
	<label for="clientType">
		Type of Client
		<span class="required-indicator">*</span>
	</label>
	<g:select name="clientType" id="clientType" class="validate" value="${patientCaseInstance?.clientType}" from="${ph.edu.upm.nih.covid19lis.patient.ClientType}" optionKey="key" noSelection="['':'Select Type of Client']" required=""/>
</div>

<div class="fieldcontain required">
	<label for="testCategory">
		Testing Category
		<span class="required-indicator">*</span>
	</label>
	<g:select name="testCategory" id="testCategory" class="validate select2" value="${patientCaseInstance?.testCategory}" from="${ph.edu.upm.nih.covid19lis.patient.TestCategory}" optionKey="key" noSelection="['':'Select Category']" required=""/>
</div>

<h2>Consultation and Admission</h2>
<div class="fieldcontain required">
	<label for="hasPrevConsultation">
		Have previous COVID-19 related consultation?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="hasPrevConsultation" id="hasPrevConsultation" checked="${patientCaseInstance?.prevConsultation != null}" />
</div>

<div class="fieldcontain required">
	<label for="prevConsultation">
		Date of First Consult
	</label>
	<g:datePicker name="prevConsultation" id="prevConsultation" value="${patientCaseInstance?.prevConsultation}" precision="day" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="prevConsultationFacility">
		Name of facility where first consult was done
	</label>
	<g:textField name="prevConsultationFacility" id="prevConsultationFacility" value="${patientCaseInstance?.prevConsultationFacility}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="hasPrevAdmission">
		Was the case admitted in a health facility?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="hasPrevAdmission" id="hasPrevAdmission" checked="${patientCaseInstance?.prevAdmission != null}" />
</div>

<div class="fieldcontain required">
	<label for="prevAdmission">
		Date of First Admission
	</label>
	<g:datePicker name="prevAdmission" id="prevAdmission" value="${patientCaseInstance?.prevAdmission}" precision="day" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="prevAdmissionFacility">
		Name and address of facility where first consult was done
	</label>
	<g:textField name="prevAdmissionFacility" id="prevAdmissionFacility" value="${patientCaseInstance?.prevAdmissionFacility}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="dispositionType">
		Disposition at Time of Report
		<span class="required-indicator">*</span>
	</label>
	<g:select name="dispositionType" id="dispositionType" class="validate" value="${patientCaseInstance?.dispositionType}" from="${ph.edu.upm.nih.covid19lis.patient.DispositionType}" optionKey="key" noSelection="['':'Select Disposition']" required="" />
</div>

<div class="fieldcontain required">
	<label for="datetimeDisposition">
		Date and Time of Disposition
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="datetimeDisposition" id="datetimeDisposition" value="${patientCaseInstance?.datetimeDisposition}" precision="minute" required=""/>
</div>

<div class="fieldcontain required">
	<label for="dispositionFacility">
		Name of facility
	</label>
	<g:textField name="dispositionFacility" id="dispositionFacility" value="${patientCaseInstance?.dispositionFacility}" />
</div>

<h2>Health Status</h2>
<div class="fieldcontain required">
	<label for="healthStatus">
		Health Status at Consult
		<span class="required-indicator">*</span>
	</label>
	<g:select name="healthStatus" id="healthStatus" class="validate" value="${patientCaseInstance?.healthStatus}" from="${ph.edu.upm.nih.covid19lis.patient.HealthStatus}" optionKey="key" noSelection="['':'Select Health Status']" required=""/>
</div>

<h2>Case Classification</h2>
<div class="fieldcontain required">
	<label for="caseClassification">
		Case Classification
		<span class="required-indicator">*</span>
	</label>
	<g:select name="caseClassification" id="caseClassification" class="validate" value="${patientCaseInstance?.caseClassification}" from="${ph.edu.upm.nih.covid19lis.patient.CaseClassification}" optionKey="key" noSelection="['':'Select Classification']" required=""/>
</div>

<h2>Case Investigation</h2>
<h3>Clinical Information</h3>
<div class="fieldcontain required">
	<label for="dateIllnessOnset">
		Date of Onset of Illness
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateIllnessOnset" id="dateIllnessOnset" value="${patientCaseInstance?.dateIllnessOnset}" precision="day" required=""/>
</div>

<div class="fieldcontain required">
	<label for="isAsymptomatic">
		Asymptomatic?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="isAsymptomatic" id="isAsymptomatic" checked="${patientCaseInstance?.isAsymptomatic}" />
</div>

<g:if test="${patientCaseInstance?.patient?.sex == ph.edu.upm.nih.Sex.FEMALE}">
	<div class="fieldcontain required">
		<label for="isPregnant">
			Are you pregnant?
			<span class="required-indicator">*</span>
		</label>
		
		<g:checkBox name="isPregnant" id="isPregnant" checked="${patientCaseInstance?.isPregnant}" />
	</div>

	<div class="fieldcontain required">
		<label for="dateLMP">
			Date of Last Menstrual Period
		</label>
		<g:datePicker name="dateLMP" id="dateLMP" value="${patientCaseInstance?.dateLMP}" precision="day" disabled="" />
	</div>

	<div class="fieldcontain required">
		<label for="isHighRiskPregnancy">
			High risk pregnancy?
			<span class="required-indicator">*</span>
		</label>
		
		<g:checkBox name="isHighRiskPregnancy" id="isHighRiskPregnancy" checked="${patientCaseInstance?.isHighRiskPregnancy}" disabled=""/>
	</div>
</g:if>

<div class="fieldcontain required">
	<label for="hasSARI">
		Were you diagnosed to have Severe Acute Respiratory Illness?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="hasSARI" id="hasSARI" checked="${patientCaseInstance?.hasSARI}" />
</div>

<h3>Laboratory Information</h3>
<div class="fieldcontain required">
	<label for="hasPrevTest">
		Have you ever tested positive using RT-PCR before?
		<span class="required-indicator">*</span>
	</label>
	
	<g:checkBox name="hasPrevTest" id="hasPrevTest" checked="${patientCaseInstance?.datePrevLabTest != null}" />
</div>

<div class="fieldcontain required">
	<label for="datePrevLabTest">
		Date of Specimen Collection
	</label>
	<g:datePicker name="datePrevLabTest" id="datePrevLabTest" value="${patientCaseInstance?.datePrevLabTest}" precision="day" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="prevLabTestName">
		Name of laboratory
	</label>
	<g:textField name="prevLabTestName" id="prevLabTestName" value="${patientCaseInstance?.prevLabTestName}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="totalPrevLabTest">
		Number of previous RT-PCR swabs done
	</label>
	<g:field type="number" name="totalPrevLabTest" id="totalPrevLabTest" value="${patientCaseInstance?.totalPrevLabTest}" disabled="" min="0"/>
</div>



<h2>Contact Tracing</h2>
<div class="fieldcontain required">
	<label for="closeContact">
		History of exposure to known probable and/or confirmed COVID-19 case 14 days before the onset of signs and symptoms? OR If Asymptomatic, 14 days before swabbing or specimen collection?
		<span class="required-indicator">*</span>
	</label>
	<g:select name="closeContact" id="closeContact" class="validate" value="${patientCaseInstance?.closeContact}" from="${['YES', 'NO', 'UNKNOWN']}" noSelection="['':'Select Answer']" required="" />
</div>

<div class="fieldcontain required">
	<label for="dateLastContact">
		Date of Last Contact
	</label>
	<g:datePicker name="dateLastContact" id="dateLastContact" value="${patientCaseInstance?.dateLastContact}" precision="day" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="highRiskPlace">
		Have you been in a place with a known COVID-19 community transmission 14 days before the onset of signs and symptoms? OR If Asymptomatic, 14 days before swabbing or specimen collection?
		<span class="required-indicator">*</span>
	</label>
	<g:select name="highRiskPlace" id="highRiskPlace" class="validate" value="${patientCaseInstance?.highRiskPlace}" from="${['YES', 'NO', 'UNKNOWN']}" noSelection="['':'Select Answer']" required="" />
</div>

<h3>History of Travel</h3>
<div class="fieldcontain required">
	<label for="hasIntlTravel">
		History of travel/visit/work in other countries with a known COVID-19 transmission 14 days before the onset of signs and symptoms
		<span class="required-indicator">*</span>
	</label>
	<g:checkBox name="hasIntlTravel" id="hasIntlTravel" checked="${patientCaseInstance?.hasIntlTravel}" />
</div>

<div class="fieldcontain required">
	<label for="originIntl">
		Country of exit
	</label>
	<g:textField name="originIntl" id="originIntl" value="${patientCaseInstance?.originIntl}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="transpoIntl">
		Transportation
	</label>
	<g:select name="transpoIntl" id="transpoIntl" class="validate" value="${patientCaseInstance?.transpoIntl}" from="${ph.edu.upm.nih.covid19lis.patient.TranspoType}" optionKey="key" noSelection="['':'Select Transportation']" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="transpoIDIntl">
		Flight/Vessel Number
	</label>
	<g:textField name="transpoIDIntl" id="transpoIDIntl" value="${patientCaseInstance?.transpoIDIntl}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="dateDeptIntl">
		Date of Departure
	</label>
	<g:datePicker name="dateDeptIntl" id="dateDeptIntl" value="${patientCaseInstance?.dateDeptIntl}" precision="day" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="dateArvlIntl">
		Date of Arrival
	</label>
	<g:datePicker name="dateArvlIntl" id="dateArvlIntl" value="${patientCaseInstance?.dateArvlIntl}" precision="day" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="hasDomTravel">
		History of travel/visit/work in other local place with a known COVID-19 transmission 14 days before the onset of signs and symptoms
		<span class="required-indicator">*</span>
	</label>
	<g:checkBox name="hasDomTravel" id="hasDomTravel" checked="${patientCaseInstance?.hasDomTravel}" />
</div>

<div class="fieldcontain required">
	<label for="originDom">
		Country of exit
	</label>
	<g:textField name="originDom" id="originDom" value="${patientCaseInstance?.originDom}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="transpoDom">
		Transportation
	</label>
	<g:select name="transpoDom" id="transpoDom" class="validate" value="${patientCaseInstance?.transpoDom}" from="${ph.edu.upm.nih.covid19lis.patient.TranspoType}" optionKey="key" noSelection="['':'Select Transportation']" disabled=""/>
</div>

<div class="fieldcontain required">
	<label for="transpoIDDom">
		Flight/Vessel Number
	</label>
	<g:textField name="transpoIDDom" id="transpoIDDom" value="${patientCaseInstance?.transpoIDDom}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="dateDeptDom">
		Date of Departure
	</label>
	<g:datePicker name="dateDeptDom" id="dateDeptDom" value="${patientCaseInstance?.dateDeptDom}" precision="day" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="dateArvlDom">
		Date of Arrival
	</label>
	<g:datePicker name="dateArvlDom" id="dateArvlDom" value="${patientCaseInstance?.dateArvlDom}" precision="day" disabled="" />
</div>

<g:javascript>
	$(document).ready(function(){
		$("[name='prevConsultation'], [name*='prevConsultation_']").prop('disabled', !$("#hasPrevConsultation").is(":checked"))
		$("[name='prevAdmission'], [name*='prevAdmission_']").prop('disabled', !$("#hasPrevAdmission").is(":checked"))
		$("[name='datePrevLabTest'], [name*='datePrevLabTest_']").prop('disabled', !$("#hasPrevTest").is(":checked"))
		$("[name='dateLastContact'], [name*='dateLastContact_']").prop('disabled', !$("#closeContact").is(":checked"))
		$("[name*='dateArvlIntl'], [name*='dateDeptIntl']").prop('disabled', !$("#hasIntlTravel").is(":checked"))
		$("[name*='dateArvlDom'], [name*='dateDeptDom']").prop('disabled', !$("#hasDomTravel").is(":checked"))

		$("#hasPrevConsultation").click(function(){
			var on = $(this).is(':checked')
			$("[name='prevConsultation'], [name*='prevConsultation_'], #prevConsultationFacility").prop('disabled', !on).prop('required', on)
		})
		
		$("#hasPrevAdmission").click(function(){
			var on = $(this).is(':checked')
			$("[name='prevAdmission'], [name*='prevAdmission_'], #prevAdmissionFacility").prop('disabled', !on).prop('required', on)
		})

		$("#dispositionType").change(function() {
			var on = $("#dispositionType").val().indexOf('ADMIT') > -1
			$("#dispositionFacility").prop('disabled', !on).prop('required', on)
		})

		$("#hasPrevTest").click(function(){
			var on = $(this).is(':checked')
			$("[name*='datePrevLabTest'], #prevLabTestName, #totalPrevLabTest").prop('disabled', !on).prop('required', on)
		})

		$("#closeContact").click(function(){
			var on = $(this).val() == 'YES'
			$("[name*='dateLastContact']").prop('disabled', !on).prop('required', on)
		})

		$("#hasIntlTravel").click(function(){
			var on = $(this).is(':checked')
			$("#originIntl, #transpoIntl, #transpoIDIntl, [name*='dateDeptIntl'], [name*='dateArvlIntl']").prop('disabled', !on).prop('required', on)
		})

		$("#hasDomTravel").click(function(){
			var on = $(this).is(':checked')
			$("#originDom, #transpoDom, #transpoIDDom, [name*='dateDeptDom'], [name*='dateArvlDom']").prop('disabled', !on).prop('required', on)
		})

		$("#healthStatus").change(function() {
			var data = $(this).val()
			$("#isAsymptomatic").prop("checked", data == 'ASYMPTOMATIC')
		})
	})
</g:javascript>