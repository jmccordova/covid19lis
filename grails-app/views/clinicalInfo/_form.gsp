<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Patient Information</strong>
		    </div>
		    <div class="card-body">
		        <div class="form-group">
				    <label for="patientCase.id">
				        Case
						<span class="required-indicator">*</span>
				    </label>
				    <% 
				    	def patientCaseInstance = clinicalInfoInstance ? clinicalInfoInstance?.patientCase : ph.edu.upm.nih.covid19lis.patient.PatientCase.findById(params.long('patientCase'))
				    %>
				    <g:select name="patientCase.id" id="patientCase.id" class="form-control select2" value="${patientCaseInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.PatientCase.list()}" optionKey="id" optionValue="caseNum"  noSelection="['':'Select Case No.']" required=""/>
				</div>

				%{-- Make the values change depending on the patientCase --}%
				<div class="form-group">
				    <label for="patient.id">
				        Patient
						<span class="required-indicator">*</span>
				    </label>
				    <% def patientInstance = patientCaseInstance ? patientCaseInstance?.patient : ph.edu.upm.nih.covid19lis.patient.Patient.findById(params.long('patient')) %>
				    <g:select name="patient.id" id="patient.id" class="form-control select2" value="${patientInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" disabled="" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Symptoms</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
				<g:if test="${!patientCaseInstance?.isAsymptomatic && patientCaseInstance?.healthStatus != ph.edu.upm.nih.covid19lis.patient.HealthStatus.ASYMPTOMATIC}">
					<div class="form-group">
						<label for="symptoms">
							Symptoms
							<span class="required-indicator">*</span>
						</label>
						<g:select name="symptoms" id="symptoms" class="form-control select2" value="${clinicalInfoInstance?.symptoms}" from="${ph.edu.upm.nih.covid19lis.info.Symptom}" optionKey="key" multiple="" required=""/>
					</div>

					<div class="form-group">
						<label for="bodyTemp">
							Body Temperature
						</label>
						<g:field type="number" name="bodyTemp" id="bodyTemp" class="form-control" value="${clinicalInfoInstance?.bodyTemp}" step="0.01" disabled="" />
					</div>

					<div class="form-group">
						<label for="otherSymptoms">
							Other symptoms
						</label>
						<g:textField name="otherSymptoms" id="otherSymptoms" class="form-control" value="${clinicalInfoInstance?.otherSymptoms}" disabled="" />
					</div>
				</g:if>
			</div>
		</div>
	</div>
</div>

<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Lung and Chest</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
				<div class="form-check checkbox">
					<g:checkBox name="hasChestRad" class="form-check-input" id="hasChestRad" checked="${clinicalInfoInstance?.hasChestRad}" />
					<label for="hasChestRad" class="form-check-label">
						Has Chest Radiography test?
						<span class="required-indicator">*</span>
					</label>					
				</div>
				<div class="form-group">
					<label for="dateChestRadTest">
						Date Tested
					</label>
					<g:datePicker name="dateChestRadTest" id="dateChestRadTest" class="form-control" value="${clinicalInfoInstance?.dateChestRadTest}" precision="day" disabled="${!clinicalInfoInstance?.hasChestRad}" />
				</div>
		    	<div class="row">
		    		<div class="col-sm-6">
						<div class="form-group">
							<label for="chestRadResult">
								Chest Radiography Result
							</label>
							<g:select name="chestRadResult" id="chestRadResult" class="validate" class="form-control" value="${clinicalInfoInstance?.chestRadResult}" from="${ph.edu.upm.nih.covid19lis.info.ChestRadResult}" optionKey="key" noSelection="['':'Select Result']" disabled="${!clinicalInfoInstance?.hasChestRad}"/>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="chestRadOtherResult">
								Other findings
							</label>
							<g:textField name="chestRadOtherResult" id="chestRadOtherResult" class="form-control" value="${clinicalInfoInstance?.chestRadOtherResult}" disabled="${clinicalInfoInstance?.chestRadResult != ph.edu.upm.nih.covid19lis.info.ChestRadResult.OTHER}" />
						</div>
					</div>
				</div>	
				<div class="form-group">
					<label for="dateChestRadResult">
						Release Date of Result
					</label>
					<g:datePicker name="dateChestRadResult" id="dateChestRadTest" class="form-control" value="${clinicalInfoInstance?.dateChestRadResult}" precision="day" disabled="${!clinicalInfoInstance?.hasChestRad}" />
				</div>

				<div class="form-check checkbox">
					<g:checkBox name="hasChestCT" id="hasChestCT" class="form-check-input" checked="${clinicalInfoInstance?.hasChestCT}" />
					<label for="hasChestCT" class="form-check-label">
						Has Chest CT test?
						<span class="required-indicator">*</span>
					</label>					
				</div>

				<div class="form-group">
					<label for="dateChestCTTest">
						Date Tested
					</label>
					<g:datePicker name="dateChestCTTest" id="dateChestCTTest" class="form-control" value="${clinicalInfoInstance?.dateChestCTTest}" precision="day" disabled="${!clinicalInfoInstance?.hasChestCT}" />
				</div>

				<div class="row">
		    		<div class="col-sm-6">
						<div class="form-group">
							<label for="chestCTResult">
								Chest CT
							</label>
							<g:select name="chestCTResult" id="chestCTResult" class="validate" class="form-control" value="${clinicalInfoInstance?.chestCTResult}" from="${ph.edu.upm.nih.covid19lis.info.ChestCTResult}" optionKey="key" noSelection="['':'Select Result']" disabled="${!clinicalInfoInstance?.hasChestCT}"/>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="chestRadOtherResult">
								Other findings
							</label>
							<g:textField name="chestRadOtherResult" id="chestRadOtherResult" class="form-control" value="${clinicalInfoInstance?.chestRadOtherResult}" disabled="${clinicalInfoInstance?.chestCTResult != ph.edu.upm.nih.covid19lis.info.ChestCTResult.OTHER}" />
						</div>
					</div>
				</div>	

				<div class="form-group">
					<label for="dateChestCTResult">
						Release Date of Result
					</label>
					<g:datePicker name="dateChestCTResult" id="dateChestCTResult" class="form-control" value="${clinicalInfoInstance?.dateChestCTResult}" precision="day" disabled="${!clinicalInfoInstance?.hasChestCT}" />
				</div>

				<div class="form-check checkbox">
					<g:checkBox name="hasLungUS" id="hasLungUS" class="form-check-input" checked="${clinicalInfoInstance?.hasLungUS}" />
					<label for="hasLungUS" class="form-check-label">
						Has Lung Ultrasound test?
						<span class="required-indicator">*</span>
					</label>					
				</div>

				<div class="form-group">
					<label for="dateLungUSTest">
						Date Tested
					</label>
					<g:datePicker name="dateLungUSTest" id="dateLungUSTest" class="form-control" value="${clinicalInfoInstance?.dateLungUSTest}" precision="day" disabled="${!clinicalInfoInstance?.hasLungUS}" />
				</div>

				<div class="row">
		    		<div class="col-sm-6">
						<div class="form-group">
							<label for="lungUSResult">
								Chest CT
							</label>
							<g:select name="lungUSResult" id="lungUSResult" class="validate" class="form-control" value="${clinicalInfoInstance?.lungUSResult}" from="${ph.edu.upm.nih.covid19lis.info.LungUSResult}" optionKey="key" noSelection="['':'Select Result']" disabled="${!clinicalInfoInstance?.hasLungUS}"/>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="lungUSOtherResult">
								Other findings
							</label>
							<g:textField name="lungUSOtherResult" id="lungUSOtherResult" class="form-control" value="${clinicalInfoInstance?.lungUSOtherResult}" disabled="${clinicalInfoInstance?.lungUSResult != ph.edu.upm.nih.covid19lis.info.LungUSResult.OTHER}" />
						</div>
					</div>
				</div>				

				<div class="form-group">
					<label for="dateLungUSResult">
						Release Date of Result
					</label>
					<g:datePicker name="dateLungUSResult" id="dateLungUSResult" class="form-control" value="${clinicalInfoInstance?.dateLungUSResult}" precision="day" disabled="${!clinicalInfoInstance?.hasLungUS}" />
				</div>
			</div>
		</div>
	</div>
</div>

<g:javascript>
	$(document).ready(function() {
		$("[name*='dateChestRad']").prop('disabled', !$("#hasChestRad").is(':checked'))
		$("[name*='dateChestCT']").prop('disabled', !$("#hasChestCT").is(':checked'))
		$("[name*='dateLungUS']").prop('disabled', !$("#hasLungUS").is(':checked'))

		$("#symptoms").change(function() {
			var on = ($(this).val().indexOf('FEVER') > -1)
			$("#bodyTemp").prop('disabled', !on).prop('required', on)

			on = ($(this).val().indexOf('OTHERS') > -1)
			$("#otherSymptoms").prop('disabled', !on).prop('required', on)
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