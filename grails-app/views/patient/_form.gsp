<div class="fieldcontain required">
	<label for="lastName">
		Last Name
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" id="lastName" value="${patientInstance?.lastName}" required="" />
</div>

<div class="fieldcontain required">
	<label for="firstName">
		First Name
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" id="firstName" value="${patientInstance?.firstName}" required="" />
</div>

<div class="fieldcontain required">
	<label for="middleName">
		Middle Name
	</label>
	<g:textField name="middleName" id="middleName" value="${patientInstance?.middleName}" />
</div>

<div class="fieldcontain required">
	<label for="contactNumber">
		Contact Number
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNumber" id="contactNumber" value="${patientInstance?.contactNumber}" required="" />
</div>

<div class="fieldcontain required">
	<label for="emailAddress">
		E-mail Address
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailAddress" id="emailAddress" value="${patientInstance?.emailAddress}" required="" />
</div>

<div class="fieldcontain required">
	<label for="birthday">
		Birthday
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" id="birthday" value="${patientInstance?.birthday}" precision="day" required="" />
</div>

<div class="fieldcontain required">
	<label for="sex">
		Sex
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sex" id="sex" class="validate" value="${patientInstance?.sex}" from="${ph.edu.upm.nih.Sex}"optionKey="key" noSelection="['':'Select Sex']" />
</div>

<div class="fieldcontain required">
	<label for="civilStatus">
		Civil Status
		<span class="required-indicator">*</span>
	</label>
	<g:select name="civilStatus" id="civilStatus" class="validate" value="${patientInstance?.civilStatus}" from="${ph.edu.upm.nih.CivilStatus}"optionKey="key" noSelection="['':'Select Civil Status']" />
</div>

<div class="fieldcontain required">
	<label for="nationality">
		Nationality
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nationality" id="nationality" value="${patientInstance?.nationality}" required="" />
</div>

<div class="fieldcontain required">
	<label for="occupation">
		Occupation
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="occupation" id="occupation" value="${patientInstance?.occupation}" required="" />
</div>

<div class="fieldcontain required">
	<label for="philHealthNum">
		PhilHealth Number
	</label>
	<g:textField name="philHealthNum" id="philHealthNum" value="${patientInstance?.philHealthNum}" />
</div>

<h2>Special Population</h2>
<div class="fieldcontain required">
	<label for="isHealthWorker">
		Health Worker
	</label>
	
	<g:checkBox name="isHealthWorker" id="isHealthWorker" value="${patientInstance?.isHealthWorker}" />
</div>

<div class="fieldcontain required">
	<label for="hwOrigin">
		Name and location of health facility
	</label>
	<g:textField name="hwOrigin" id="hwOrigin" value="${patientInstance?.hwOrigin}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="isReturningFil">
		Returning Overseas Filipino
	</label>
	
	<g:checkBox name="isReturningFil" id="isReturningFil" value="${patientInstance?.isReturningFil}" />
</div>

<div class="fieldcontain required">
	<label for="isOFW">
		Are you an Overseas Filipino Worker?
	</label>
	
	<g:checkBox name="isOFW" id="isOFW" value="${patientInstance?.isOFW}" disabled=""/>
</div>

<div class="fieldcontain required">
	<label for="ofCountryOrigin">
		Country of Origin
	</label>
	<g:textField name="ofCountryOrigin" id="ofCountryOrigin" value="${patientInstance?.ofCountryOrigin}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="isForeigner">
		Foreign National Traveler
	</label>
	
	<g:checkBox name="isForeigner" id="isForeigner" value="${patientInstance?.isForeigner}" />
</div>

<div class="fieldcontain required">
	<label for="forCountryOrigin">
		Country of Origin
	</label>
	<g:textField name="forCountryOrigin" id="forCountryOrigin" value="${patientInstance?.forCountryOrigin}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="isLocallyStranded">
		Locally Stranded Individual
	</label>
	
	<g:checkBox name="isLocallyStranded" id="isLocallyStranded" value="${patientInstance?.isLocallyStranded}" />
</div>

<div class="fieldcontain required">
	<label for="isAPOR">
		Are you an Authorized Person Outside Residence / Local Traveler?
	</label>
	
	<g:checkBox name="isAPOR" id="isAPOR" value="${patientInstance?.isAPOR}" disabled=""/>
</div>

<div class="fieldcontain required">
	<label for="lsOrigin">
		City, Munipality, and Province of Origin
	</label>
	<g:textField name="lsOrigin" id="lsOrigin" value="${patientInstance?.lsOrigin}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="isClosedSetting">
		Lives in Closed Setting
	</label>
	
	<g:checkBox name="isClosedSetting" id="isClosedSetting" value="${patientInstance?.isClosedSetting}" />
</div>

<div class="fieldcontain required">
	<label for="institutionType">
		Type of Institution
	</label>
	<g:select name="institutionType" id="institutionType" class="validate" value="${patientInstance?.institutionType}" from="${ph.edu.upm.nih.FacilityType}"optionKey="key" noSelection="['':'Select Type of Institution']" disabled=""/>
</div>

<div class="fieldcontain required">
	<label for="institutionName">
		Name of institution
	</label>
	<g:textField name="institutionName" id="institutionName" value="${patientInstance?.institutionName}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="isIndigenous">
		Indigenous Person
	</label>
	
	<g:checkBox name="isIndigenous" id="isIndigenous" value="${patientInstance?.isIndigenous}" />
</div>

<div class="fieldcontain required">
	<label for="groupName">
		Group
	</label>
	<g:textField name="groupName" id="groupName" value="${patientInstance?.groupName}" disabled="" />
</div>

<div class="fieldcontain required">
	<label for="comorbidities">
		Commorbidities
	</label>
	<g:select name="comorbidities" id="comorbidities" class="validate select2" value="${patientInstance?.comorbidities}" from="${ph.edu.upm.nih.covid19lis.info.Comorbidity}" optionKey="key" multiple="" />
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