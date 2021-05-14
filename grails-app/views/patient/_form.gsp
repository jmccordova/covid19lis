<div class="row">
    <div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>Patient Information</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		        <div class="form-group">
					<label for="lastName">
						Last Name
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="lastName" id="lastName" class="form-control" value="${patientInstance?.lastName}" required="" />
				</div>

				<div class="form-group">
					<label for="firstName">
						First Name
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="firstName" id="firstName" class="form-control" value="${patientInstance?.firstName}" required="" />
				</div>

				<div class="form-group">
					<label for="middleName">
						Middle Name
					</label>
					<g:textField name="middleName" id="middleName" class="form-control" value="${patientInstance?.middleName}" />
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="contactNumber">
								Contact Number
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="contactNumber" id="contactNumber" class="form-control" value="${patientInstance?.contactNumber}" required="" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="emailAddress">
								E-mail Address
								<span class="required-indicator">*</span>
							</label>
							<g:field type="email" name="emailAddress" id="emailAddress" class="form-control" value="${patientInstance?.emailAddress}" required="" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="birthday">
						Birthday
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="birthday" id="birthday" class="form-control" value="${patientInstance?.birthday}" precision="day" required="" />
				</div>

				<div class="row">
    				<div class="col-sm-3">
						<div class="form-group">
							<label for="sex">
								Sex
								<span class="required-indicator">*</span>
							</label>
							<g:select name="sex" id="sex" class="validate" class="form-control" value="${patientInstance?.sex}" from="${ph.edu.upm.nih.Sex}"optionKey="key" noSelection="['':'Select Sex']" />
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-group">
							<label for="civilStatus">
								Civil Status
								<span class="required-indicator">*</span>
							</label>
							<g:select name="civilStatus" id="civilStatus" class="validate" class="form-control" value="${patientInstance?.civilStatus}" from="${ph.edu.upm.nih.CivilStatus}" optionKey="key" noSelection="['':'Select Civil Status']" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="nationality">
								Nationality
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="nationality" id="nationality" class="form-control" value="${patientInstance?.nationality}" required="" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="occupation">
						Occupation
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="occupation" id="occupation" class="form-control" value="${patientInstance?.occupation}" required="" />
				</div>

				<div class="form-group">
					<label for="philHealthNum">
						PhilHealth Number
					</label>
					<g:textField name="philHealthNum" id="philHealthNum" class="form-control" value="${patientInstance?.philHealthNum}" />
				</div>
		    </div>
		</div>
	</div>
    <div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>Special Population</strong>
		    </div>
		    <div class="card-body">
		    	<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="isHealthWorker" id="isHealthWorker" class="form-check-input" value="${patientInstance?.isHealthWorker}" />
							<label for="isHealthWorker" class="form-check-label">
								Health Worker
							</label>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="form-group">
							<label for="hwOrigin" class="form-check-label">
								Name and location of health facility
							</label>
							<g:textField name="hwOrigin" id="hwOrigin" class="form-control" value="${patientInstance?.hwOrigin}" disabled="" />
						</div>
					</div>
				</div>

				<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="isReturningFil" id="isReturningFil" class="form-check-input" value="${patientInstance?.isReturningFil}" />
							<label for="isReturningFil" class="form-check-label">
								Returning Overseas Filipino
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="isOFW" id="isOFW" class="form-check-input" value="${patientInstance?.isOFW}" disabled=""/>
							<label for="isOFW" class="form-check-label">
								Are you an Overseas Filipino Worker?
							</label>
						</div>
					</div>
					<div class="col-sm-6">
						<label for="ofCountryOrigin" class="form-check-label">
							Country of Origin
						</label>
						<g:textField name="ofCountryOrigin" id="ofCountryOrigin" class="form-control" value="${patientInstance?.ofCountryOrigin}" disabled="" />
					</div>
				</div>

				<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="isForeigner" id="isForeigner" class="form-check-input" value="${patientInstance?.isForeigner}" />
							<label for="isForeigner" class="form-check-label">
								Foreign National Traveler
							</label>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="form-group">
							<label for="forCountryOrigin">
								Country of Origin
							</label>
							<g:textField name="forCountryOrigin" id="forCountryOrigin" class="form-control" value="${patientInstance?.forCountryOrigin}" disabled="" />
						</div>
					</div>
				</div>

				<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="isLocallyStranded" id="isLocallyStranded" class="form-check-input" value="${patientInstance?.isLocallyStranded}" />
							<label for="isLocallyStranded" class="form-check-label">
								Locally Stranded Individual
							</label>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="isAPOR" id="isAPOR" class="form-check-input" value="${patientInstance?.isAPOR}" disabled=""/>
							<label for="isAPOR" class="form-check-label">
								Are you an Authorized Person Outside Residence / Local Traveler?
							</label>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="lsOrigin">
								City, Munipality, and Province of Origin
							</label>
							<g:textField name="lsOrigin" id="lsOrigin" class="form-control" value="${patientInstance?.lsOrigin}" disabled="" />
						</div>
					</div>
				</div>

				<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">							
							<g:checkBox name="isClosedSetting" id="isClosedSetting" class="form-check-input" value="${patientInstance?.isClosedSetting}" />
							<label for="isClosedSetting" class="form-check-label">
								Lives in Closed Setting
							</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label for="institutionType">
								Type of Institution
							</label>
							<g:select name="institutionType" id="institutionType" class="validate" class="form-control" value="${patientInstance?.institutionType}" from="${ph.edu.upm.nih.FacilityType}"optionKey="key" noSelection="['':'Select Type of Institution']" disabled=""/>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="form-group">
							<label for="institutionName">
								Name of institution
							</label>
							<g:textField name="institutionName" id="institutionName" class="form-control" value="${patientInstance?.institutionName}" disabled="" />
						</div>
					</div>
				</div>

				<div class="row">
    				<div class="col-sm-3">
						<div class="form-check checkbox">								
							<g:checkBox name="isIndigenous" id="isIndigenous" class="form-check-input" value="${patientInstance?.isIndigenous}" />
							<label for="isIndigenous" class="form-check-label">
								Indigenous Person
							</label>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="form-group">
							<label for="groupName">
								Group
							</label>
							<g:textField name="groupName" id="groupName" class="form-control" value="${patientInstance?.groupName}" disabled="" />
						</div>
					</div>
				</div>
		    </div>
		</div>
	</div>
</div>
<div class="row">
    <div class="col-sm-12">
    	<div class="card">
		    <div class="card-header">
		        <strong>Health Data</strong>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
					<label for="comorbidities">
						Commorbidities
					</label>
					<g:select name="comorbidities" id="comorbidities" class="form-control select2" value="${patientInstance?.comorbidities}" from="${ph.edu.upm.nih.covid19lis.info.Comorbidity}" optionKey="key" multiple="" />
				</div>
			</div>
		</div>
	</div>
</div>


<g:javascript>
	$(document).ready(function(){
		$("#isHealthWorker").click(function(){
			var on = $(this).is(':checked')
			$("#hwOrigin").prop('disabled', !on).prop('required', on)
		})

		$("#isReturningFil").click(function(){
			var on = $(this).is(':checked')
			$("#isOFW, #ofCountryOrigin").prop('disabled', !on).prop('required', on)
		})

		$("#isForeigner").click(function(){
			var on = $(this).is(':checked')
			$("#forCountryOrigin").prop('disabled', !on).prop('required', on)
		})

		$("#isLocallyStranded").click(function(){
			var on = $(this).is(':checked')
			$("#isAPOR, #lsOrigin").prop('disabled', !on).prop('required', on)
		})

		$("#isClosedSetting").click(function(){
			var on = $(this).is(':checked')
			$("#institutionType, #institutionName").prop('disabled', !on).prop('required', on)
		})

		$("#isIndigenous").click(function(){
			var on = $(this).is(':checked')
			$("#groupName").prop('disabled', !on).prop('required', on)
		})
	})
</g:javascript>