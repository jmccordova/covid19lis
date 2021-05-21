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
				    <% def patientCaseInstance = specimenInstance ? specimenInstance?.patientCase : ph.edu.upm.nih.covid19lis.patient.PatientCase.findById(params.long('patientCase')) %>
				    <g:select name="patientCase.id" id="patientCase.id" class="form-control select2" class="form-control" value="${patientCaseInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.PatientCase.list()}" optionKey="id" optionValue="caseNum"  noSelection="['':'Select Case No.']" required=""/>
				</div>

				%{-- Make the values change depending on the patientCase --}%
				<div class="form-group">
				    <label for="patient.id">
				        Patient
						<span class="required-indicator">*</span>
				    </label>
				    <% def patientInstance = patientCaseInstance ? patientCaseInstance?.patient : ph.edu.upm.nih.covid19lis.patient.Patient.findById(params.long('patient')) %>
				    <g:select name="patient.id" id="patient.id" class="form-control select2" class="form-control" value="${patientInstance?.id}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" disabled="" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Lab Test</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		        <div class="form-group">
		        	<label for="healthFacilityName">
						Health Facility
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="healthFacilityName" id="healthFacilityName" class="form-control" value="${specimenInstance?.healthFacilityName}" required="" />
		        </div>
		    	<div class="form-group">
					<label for="ziplockNum">
						Ziplock Number
						<span class="required-indicator">*</span>
					</label>
					<g:field type="number" min="${0}" name="ziplockNum" id="ziplockNum" class="form-control" value="${specimenInstance?.ziplockNum}" required="" />
				</div>
				<div class="form-group">
					<label for="dateCollected">
						Date Collected
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="dateCollected" id="dateCollected" class="form-control" value="${specimenInstance?.dateCollected}" precision="day" required="" />
				</div>

				<div class="form-group">
					<label for="labTest">
						Laboratory Test Type
						<span class="required-indicator">*</span>
					</label>
					<g:select name="labTest" id="labTest" class="validate" class="form-control" value="${specimenInstance?.labTest}" from="${ph.edu.upm.nih.covid19lis.info.LabTest}" optionKey="key" noSelection="['':'Select Test']" required=""/>
				</div>

				<div class="form-group">
					<label for="extractionKit.id">
						Extraction Kit Used
						<span class="required-indicator">*</span>
					</label>
					<g:select name="extractionKit.id" id="extractionKit.id" class="validate select2" class="form-control" value="${specimenInstance?.extractionKit?.id}" from="${ph.edu.upm.nih.covid19lis.info.TestKit.findByTestKitType(ph.edu.upm.nih.covid19lis.info.TestKitType.EXTRACT)}" optionKey="id" optionValue="${{it.brand + ' (' + it.lotNum + ')'}}" noSelection="['':'Select Kit']" required=""/>
				</div>

				<div class="form-group">
					<label for="specimenRemarks">
						Remarks
					</label>
					<g:textArea name="specimenRemarks" id="specimenRemarks" class="form-control" value="${specimenInstance?.specimenRemarks}" rows="5" cols="40" />
				</div>
			</div>
		</div>
	</div>
</div>