<div class="fieldcontain required">
	<label for="addressType">
		What address is this for?
		<span class="required-indicator">*</span>
	</label>
	<g:select name="addressType" id="addressType" class="validate" value="${addressInstance?.addressType}" from="${ph.edu.upm.nih.AddressType}"optionKey="key" noSelection="['':'Select Type of Address']" />
</div>

<div class="fieldcontain required">
	<label for="houseNum">
		House No.
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="houseNum" id="houseNum" value="${addressInstance?.houseNum}" required="" />
</div>

<div class="fieldcontain required">
	<label for="streetName">
		Street
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="streetName" id="streetName" value="${addressInstance?.streetName}" required="" />
</div>

<div class="fieldcontain required">
	<label for="barangay">
		Barangay
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barangay" id="barangay" value="${addressInstance?.barangay}" required="" />
</div>

<div class="fieldcontain required">
	<label for="municipality">
		Municipality
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="municipality" id="municipality" value="${addressInstance?.municipality}" required="" />
</div>

<div class="fieldcontain required">
	<label for="province">
		Province
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="province" id="province" value="${addressInstance?.province}" required="" />
</div>

<div class="fieldcontain required">
	<label for="phoneNumber">
		Phone Number
	</label>
	<g:textField name="phoneNumber" id="phoneNumber" value="${addressInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain required">
	<label for="cellNumber">
		Cellphone Number
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cellNumber" id="cellNumber" value="${addressInstance?.cellNumber}" required="" />
</div>

<div class="fieldcontain required">
	<label for="emailAddress">
		E-mail Address
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="emailAddress" id="emailAddress" value="${addressInstance?.emailAddress}" required="" />
</div>