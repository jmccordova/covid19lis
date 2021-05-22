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
				    <% def patientCaseInstance = personInstance ? personInstance?.patientCase : ph.edu.upm.nih.covid19lis.patient.PatientCase.findById(params.long('patientCase')) %>
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
		        <strong>Close Contact</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		        <div class="form-group">
					<label for="lastName">
						Last Name
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="lastName" id="lastName" class="form-control" value="${personInstance?.lastName}" required="" />
				</div>

				<div class="form-group">
					<label for="firstName">
						First Name
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="firstName" id="firstName" class="form-control" value="${personInstance?.firstName}" required="" />
				</div>

				<div class="form-group">
					<label for="middleName">
						Middle Name
					</label>
					<g:textField name="middleName" id="middleName" class="form-control" value="${personInstance?.middleName}" />
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="contactNumber">
								Contact Number
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="contactNumber" id="contactNumber" class="form-control" value="${personInstance?.contactNumber}" required="" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="emailAddress">
								E-mail Address
								<span class="required-indicator">*</span>
							</label>
							<g:field type="email" name="emailAddress" id="emailAddress" class="form-control" value="${personInstance?.emailAddress}" required="" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="exposureSetting">
						Exposure
						<span class="required-indicator">*</span>
					</label>
					<g:select name="exposureSetting" id="exposureSetting" class="validate" class="form-control" value="${personInstance?.exposureSetting}" from="${ph.edu.upm.nih.FacilityType}" optionKey="key" noSelection="['':'Select Type']" />
				</div>
		    </div>
		</div>
	</div>
</div>