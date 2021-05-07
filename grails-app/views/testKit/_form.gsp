<div class="form-group">
	<label for="dateReceived">
		Date Received
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateReceived" id="dateReceived" value="${testKitInstance?.dateReceived}" precision="day" required="" />
</div>

<div class="form-group">
	<label for="brand">
		Brand
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="brand" id="brand" value="${testKitInstance?.brand}" required=""/>
</div>

<div class="form-group">
	<label for="lotNum">
		Lot Number
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lotNum" id="lotNum" value="${testKitInstance?.lotNum}" required=""/>
</div>

<div class="form-group">
	<label for="testKitType">
		Test Kit Type
		<span class="required-indicator">*</span>
	</label>
	<g:select name="testKitType" id="testKitType" class="validate" value="${testKitInstance?.testKitType}" from="${ph.edu.upm.nih.covid19lis.info.TestKitType}" optionKey="key" noSelection="['':'Select Type']" required=""/>
</div>

<div class="form-group">
	<label for="totalReceived">
		Total Received
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="totalReceived" id="totalReceived" value="${testKitInstance?.totalReceived}" min="0" required=""/>
</div>