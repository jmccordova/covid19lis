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
				    <% def patientCaseInstance = addressInstance ? addressInstance?.patientCase : ph.edu.upm.nih.covid19lis.patient.PatientCase.findById(params.long('patientCase')) %>
				    <g:select name="patientCase.id" id="patientCase.id" class="form-control select2" class="form-control" value="${patientCaseInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.PatientCase.list()}" optionKey="id" optionValue="caseNum"  noSelection="['':'Select Case No.']" required=""/>
				</div>

				%{-- Make the values change depending on the patientCase --}%
				<div class="form-group">
				    <label for="patient.id">
				        Patient
						<span class="required-indicator">*</span>
				    </label>
				    <% def patientInstance = patientCaseInstance ? patientCaseInstance?.patient : ph.edu.upm.nih.covid19lis.patient.Patient.findById(params.long('patient')) %>
				    <g:select name="patient.id" id="patient.id" class="form-control select2" class="form-control" value="${patientInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" required="" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Address</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
	        	<div class="form-group">
		        	<label for="facilityType">
						Facility
						<span class="required-indicator">*</span>
					</label>
					<g:select name="facilityType" id="facilityType" class="form-control" value="${addressInstance?.facilityType}" from="${ph.edu.upm.nih.FacilityType}"optionKey="key" noSelection="['':'Select Type']" required=""/>
		        </div>
		        <div class="form-group">
		        	<label for="placeName">
						Name of Place
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="placeName" id="placeName" class="form-control" value="${addressInstance?.placeName}" required="" />
			    </div>
			    <div class="row">
			    	<div class="col-sm-6">
					    <div class="form-group">
					        <label for="dateVisitedFrom">
								From
								<span class="required-indicator">*</span>
							</label>
							<g:datePicker name="dateVisitedFrom" id="dateVisitedFrom" class="form-control" value="${addressInstance?.dateVisitedFrom}" precision="day" required="" />
					    </div>
					</div>
					<div class="col-sm-6">
					    <div class="form-group">
					        <label for="dateVisitedTo">
								To
								<span class="required-indicator">*</span>
							</label>
							<g:datePicker name="dateVisitedTo" id="dateVisitedTo" class="form-control" value="${addressInstance?.dateVisitedTo}" precision="day" required="" />
					    </div>
					</div>
				</div>

			    <div class="form-check checkbox">
					<g:checkBox name="commTransmission" class="form-check-input" id="commTransmission" checked="${clinicalInfoInstance?.commTransmission}" />
					<label for="commTransmission" class="form-check-label">
						Is there a community transmission here?
						<span class="required-indicator">*</span>
					</label>					
				</div>
	        </div>
		</div>
	</div>
</div>