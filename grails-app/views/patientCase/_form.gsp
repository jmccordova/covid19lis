<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Patient Information</strong>
		    </div>
		    <div class="card-body">
		        <div class="form-group">	
				    <label for="patient.id">
				        Patient				        
						<span class="required-indicator">*</span>
				    </label>
				    <% def patientNum = patientCaseInstance ? patientCaseInstance?.patient.id : params.long('patient') %>
				    <g:select name="patient.id" id="patient.id" class="form-control select2" value="${patientNum}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" required=""/>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Preliminary</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
					<label for="diseaseReportingUnit">
						Disease Reporting Unit
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="diseaseReportingUnit" id="diseaseReportingUnit" class="form-control" value="${patientCaseInstance?.diseaseReportingUnit}" required="" />
				</div>
		    	<div class="form-group">
			        <label for="dateInterviewed">
						Date of Interview
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="dateInterviewed" id="dateInterviewed" class="form-control" value="${patientCaseInstance?.dateInterviewed}" precision="day" required="" />
			    </div>
		    	<div class="row">
				    <div class="col-sm-4">
				        <label for="clientType">
							Type of Client
							<span class="required-indicator">*</span>
						</label>
						<g:select name="clientType" id="clientType" class="form-control" value="${patientCaseInstance?.clientType}" from="${ph.edu.upm.nih.covid19lis.patient.ClientType}" optionKey="key" noSelection="['':'Select Type of Client']" required=""/>
				    </div>
				    <div class="col-sm-8">
				        <label for="testCategory">
							Testing Category
							<span class="required-indicator">*</span>
						</label>
						<g:select name="testCategory" id="testCategory" class="form-control select2" value="${patientCaseInstance?.testCategory}" from="${ph.edu.upm.nih.covid19lis.patient.TestCategory}" optionKey="key" noSelection="['':'Select Category']" required=""/>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>

<h2>Health</h2>

<div class="row">
    <div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>Consultation and Admission</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="hasPrevConsultation" id="hasPrevConsultation" class="form-check-input" checked="${patientCaseInstance?.prevConsultation != null}" />
							<label for="hasPrevConsultation">
								Have previous COVID-19 related consultation?
								<span class="required-indicator">*</span>
							</label>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="form-group">
							<label for="prevConsultation">
								Date of First Consult
							</label>
							<g:datePicker name="prevConsultation" id="prevConsultation" class="form-control" value="${patientCaseInstance?.prevConsultation}" precision="day" disabled="" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="prevConsultationFacility">
						Name of facility where first consult was done
					</label>
					<g:textField name="prevConsultationFacility" id="prevConsultationFacility" class="form-control" value="${patientCaseInstance?.prevConsultationFacility}" disabled="" />
				</div>

				<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="hasPrevAdmission" id="hasPrevAdmission" class="form-check-input" checked="${patientCaseInstance?.prevAdmission != null}" />
							<label for="hasPrevAdmission">
								Was the case admitted in a health facility?
								<span class="required-indicator">*</span>
							</label>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="form-group">
							<label for="prevAdmission">
								Date of First Admission
							</label>
							<g:datePicker name="prevAdmission" id="prevAdmission" class="form-control" value="${patientCaseInstance?.prevAdmission}" precision="day" disabled="" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="prevAdmissionFacility">
						Name and address of facility where first consult was done
					</label>
					<g:textField name="prevAdmissionFacility" id="prevAdmissionFacility" class="form-control" value="${patientCaseInstance?.prevAdmissionFacility}" disabled="" />
				</div>

				<div class="form-group">
					<label for="datetimeDisposition">
						Date and Time of Disposition
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="datetimeDisposition" id="datetimeDisposition" class="form-control" value="${patientCaseInstance?.datetimeDisposition}" precision="minute" required=""/>
				</div>

				<div class="row">
    				<div class="col-sm-4">
						<div class="form-group">
							<label for="dispositionType">
								Disposition at Time of Report
								<span class="required-indicator">*</span>
							</label>
							<g:select name="dispositionType" id="dispositionType" class="form-control" value="${patientCaseInstance?.dispositionType}" from="${ph.edu.upm.nih.covid19lis.patient.DispositionType}" optionKey="key" noSelection="['':'Select Disposition']" required="" />
						</div>
					</div>
					<div class="col-sm-8">
						<div class="form-group">
							<label for="dispositionFacility">
								Name of facility
							</label>
							<g:textField name="dispositionFacility" id="dispositionFacility" class="form-control" value="${patientCaseInstance?.dispositionFacility}" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="row">
			<div class="col">
				<div class="card">
				    <div class="card-header">
				        <strong>Health Status</strong>
				        <small>Form</small>
				    </div>
				    <div class="card-body">
				    	<div class="form-group">
							<label for="healthStatus">
								Health Status at Consult
								<span class="required-indicator">*</span>
							</label>
							<g:select name="healthStatus" id="healthStatus" class="form-control" value="${patientCaseInstance?.healthStatus}" from="${ph.edu.upm.nih.covid19lis.patient.HealthStatus}" optionKey="key" noSelection="['':'Select Health Status']" required=""/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="card">
				    <div class="card-header">
				        <strong>Case Classification</strong>
				        <small>Form</small>
				    </div>
				    <div class="card-body">
				    	<div class="form-group">
							<label for="caseClassification">
								Case Classification
								<span class="required-indicator">*</span>
							</label>
							<g:select name="caseClassification" id="caseClassification" class="form-control" value="${patientCaseInstance?.caseClassification}" from="${ph.edu.upm.nih.covid19lis.patient.CaseClassification}" optionKey="key" noSelection="['':'Select Classification']" required=""/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<h2>Case Investigation</h2>

<div class="row">
    <div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>Clinical Information</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
					<label for="dateIllnessOnset">
						Date of Onset of Illness
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="dateIllnessOnset" id="dateIllnessOnset" class="form-control" value="${patientCaseInstance?.dateIllnessOnset}" precision="day" required=""/>
				</div>
				<div class="form-check checkbox">							
					<g:checkBox name="isAsymptomatic" id="isAsymptomatic" class="form-check-input" checked="${patientCaseInstance?.isAsymptomatic}" />
					<label for="isAsymptomatic">
						Asymptomatic?
						<span class="required-indicator">*</span>
					</label>
				</div>
				<g:if test="${patientCaseInstance?.patient?.sex == ph.edu.upm.nih.Sex.FEMALE}">
					<div class="form-check checkbox">
						<g:checkBox name="isPregnant" id="isPregnant" class="form-check-input" checked="${patientCaseInstance?.isPregnant}" />
						<label for="isPregnant">
							Are you pregnant?
							<span class="required-indicator">*</span>
						</label>
					</div>

					<div class="form-group">
						<label for="dateLMP">
							Date of Last Menstrual Period
						</label>
						<g:datePicker name="dateLMP" id="dateLMP" class="form-control" value="${patientCaseInstance?.dateLMP}" precision="day" disabled="" />
					</div>

					<div class="form-check checkbox">
						<g:checkBox name="isHighRiskPregnancy" id="isHighRiskPregnancy" class="form-check-input" checked="${patientCaseInstance?.isHighRiskPregnancy}" disabled=""/>
						<label for="isHighRiskPregnancy">
							High risk pregnancy?
							<span class="required-indicator">*</span>
						</label>
					</div>
				</g:if>

				<div class="form-check checkbox">
					<g:checkBox name="hasSARI" id="hasSARI" class="form-check-input" checked="${patientCaseInstance?.hasSARI}" />
					<label for="hasSARI">
						Were you diagnosed to have Severe Acute Respiratory Illness?
						<span class="required-indicator">*</span>
					</label>
				</div>
		    </div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>Laboratory History</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="row">
		    		<div class="col-sm-4">
						<div class="form-check checkbox">							
							<g:checkBox name="hasPrevTest" id="hasPrevTest" class="form-check-input" checked="${patientCaseInstance?.datePrevLabTest != null}" />
							<label for="hasPrevTest">
								Have you ever tested positive using RT-PCR before?
								<span class="required-indicator">*</span>
							</label>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="form-group">
							<label for="datePrevLabTest">
								Date of Specimen Collection
							</label>
							<g:datePicker name="datePrevLabTest" id="datePrevLabTest" class="form-control" value="${patientCaseInstance?.datePrevLabTest}" precision="day" disabled="" />
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label for="prevLabTestName">
						Name of laboratory
					</label>
					<g:textField name="prevLabTestName" id="prevLabTestName" class="form-control" value="${patientCaseInstance?.prevLabTestName}" disabled="" />
				</div>

				<div class="form-group">
					<label for="totalPrevLabTest">
						Number of previous RT-PCR swabs done
					</label>
					<g:field type="number" name="totalPrevLabTest" id="totalPrevLabTest" class="form-control" value="${patientCaseInstance?.totalPrevLabTest}" disabled="" min="0"/>
				</div>
		    </div>
		</div>
	</div>
</div>

<h2>Contact Tracing</h2>

<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>History of Exposure</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">		    		
					<label for="closeContact">
						History of exposure to known probable and/or confirmed COVID-19 case 14 days before the onset of signs and symptoms? OR If Asymptomatic, 14 days before swabbing or specimen collection?
						<span class="required-indicator">*</span>
					</label>
					<g:select name="closeContact" id="closeContact" class="form-control" value="${patientCaseInstance?.closeContact}" from="${['YES', 'NO', 'UNKNOWN']}" noSelection="['':'Select Answer']" required="" />
				</div>
				<div class="form-group">
					<label for="dateLastContact">
						Date of Last Contact
					</label>
					<g:datePicker name="dateLastContact" id="dateLastContact" class="form-control" value="${patientCaseInstance?.dateLastContact}" precision="day" disabled="" />
				</div>
				<div class="form-group">
					<label for="highRiskPlace">
						Have you been in a place with a known COVID-19 community transmission 14 days before the onset of signs and symptoms? OR If Asymptomatic, 14 days before swabbing or specimen collection?
						<span class="required-indicator">*</span>
					</label>
					<g:select name="highRiskPlace" id="highRiskPlace" class="form-control" value="${patientCaseInstance?.highRiskPlace}" from="${['YES', 'NO', 'UNKNOWN']}" noSelection="['':'Select Answer']" required="" />
				</div>
		    </div>
		</div>
	</div>
</div>

<h3>History of Travel</h3>

<div class="row">
    <div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>International</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-check checkbox">
					<g:checkBox name="hasIntlTravel" id="hasIntlTravel" class="form-check-input" checked="${patientCaseInstance?.hasIntlTravel}" />
					<label for="hasIntlTravel">
						History of travel/visit/work in other countries with a known COVID-19 transmission 14 days before the onset of signs and symptoms
						<span class="required-indicator">*</span>
					</label>
				</div>
				<div class="form-group">
					<label for="originIntl">
						Country of exit
					</label>
					<g:textField name="originIntl" id="originIntl" class="form-control" value="${patientCaseInstance?.originIntl}" disabled="" />
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="transpoIntl">
								Transportation
							</label>
							<g:select name="transpoIntl" id="transpoIntl" class="form-control" value="${patientCaseInstance?.transpoIntl}" from="${ph.edu.upm.nih.covid19lis.patient.TranspoType}" optionKey="key" noSelection="['':'Select Transportation']" disabled="" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="transpoIDIntl">
								Flight/Vessel Number
							</label>
							<g:textField name="transpoIDIntl" id="transpoIDIntl" class="form-control" value="${patientCaseInstance?.transpoIDIntl}" disabled="" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="dateDeptIntl">
								Date of Departure
							</label>
							<g:datePicker name="dateDeptIntl" id="dateDeptIntl" class="form-control" value="${patientCaseInstance?.dateDeptIntl}" precision="day" disabled="" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="dateArvlIntl">
								Date of Arrival
							</label>
							<g:datePicker name="dateArvlIntl" id="dateArvlIntl" class="form-control" value="${patientCaseInstance?.dateArvlIntl}" precision="day" disabled="" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>Domestic</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-check checkbox">
					<g:checkBox name="hasDomTravel" id="hasDomTravel" class="form-check-input" checked="${patientCaseInstance?.hasDomTravel}" />
					<label for="hasDomTravel">
						History of travel/visit/work in other countries with a known COVID-19 transmission 14 days before the onset of signs and symptoms
						<span class="required-indicator">*</span>
					</label>
				</div>
				<div class="form-group">
					<label for="originDom">
						Country of exit
					</label>
					<g:textField name="originDom" id="originDom" class="form-control" value="${patientCaseInstance?.originDom}" disabled="" />
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="transpoDom">
								Transportation
							</label>
							<g:select name="transpoDom" id="transpoDom" class="form-control" value="${patientCaseInstance?.transpoDom}" from="${ph.edu.upm.nih.covid19lis.patient.TranspoType}" optionKey="key" noSelection="['':'Select Transportation']" disabled="" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="transpoIDDom">
								Flight/Vessel Number
							</label>
							<g:textField name="transpoIDDom" id="transpoIDDom" class="form-control" value="${patientCaseInstance?.transpoIDDom}" disabled="" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="dateDeptDom">
								Date of Departure
							</label>
							<g:datePicker name="dateDeptDom" id="dateDeptDom" class="form-control" value="${patientCaseInstance?.dateDeptDom}" precision="day" disabled="" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="dateArvlDom">
								Date of Arrival
							</label>
							<g:datePicker name="dateArvlDom" id="dateArvlDom" class="form-control" value="${patientCaseInstance?.dateArvlDom}" precision="day" disabled="" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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