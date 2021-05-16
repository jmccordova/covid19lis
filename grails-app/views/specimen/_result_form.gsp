<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Lab Result</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
				<div class="form-group">
					<label for="dateReleased">
						Result Released Date
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="dateReleased" id="dateReleased" class="form-control" value="${specimenInstance?.dateReleased}" precision="day" required="" />
				</div>

				<div class="form-group">
					<label for="labResult">
						Result
						<span class="required-indicator">*</span>
					</label>
					<g:select name="labResult" id="labResult" class="form-control" value="${specimenInstance?.labResult}" from="${Arrays.asList(ph.edu.upm.nih.covid19lis.info.LabResult.values()) - [ph.edu.upm.nih.covid19lis.info.LabResult.PENDING, ph.edu.upm.nih.covid19lis.info.LabResult.REJECT]}" optionKey="key" noSelection="['':'Select Result']" required=""/>
				</div>

				<div class="form-group">
					<label for="resultRemarks">
						Remarks
					</label>
					<g:textArea name="resultRemarks" id="resultRemarks" class="form-control" value="${specimenInstance?.resultRemarks}" rows="5" cols="40" />
				</div>
			</div>
		</div>
	</div>
</div>