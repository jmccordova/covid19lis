<div class="fieldcontain required">
	<label for="dateReleased">
		Result Released Date
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateReleased" id="dateReleased" value="${specimenInstance?.dateReleased}" precision="day" required="" />
</div>

<div class="fieldcontain required">
	<label for="labResult">
		Result
		<span class="required-indicator">*</span>
	</label>
	<g:select name="labResult" id="labResult" class="validate" value="${specimenInstance?.labResult}" from="${Arrays.asList(ph.edu.upm.nih.covid19lis.info.LabResult.values()) - [ph.edu.upm.nih.covid19lis.info.LabResult.PENDING, ph.edu.upm.nih.covid19lis.info.LabResult.REJECT]}" optionKey="key" noSelection="['':'Select Result']" required=""/>
</div>

<div class="fieldcontain required">
	<label for="resultRemarks">
		Remarks
	</label>
	<g:textArea name="resultRemarks" id="resultRemarks" value="${specimenInstance?.resultRemarks}" rows="5" cols="40" /></div>