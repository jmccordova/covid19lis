<div class="row">
    <div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Patient Information</strong>
		    </div>
		    <div class="card-body">
		        <div class="form-group">	
				    <label for="patient.id">
				        Patient				        
						<span class="required-indicator">*</span>
				    </label>
				    <% def patientNum = vaccineInstance ? vaccineInstance?.patient.id : params.long('patient') %>
				    <g:select name="patient.id" id="patient.id" class="form-control select2" value="${patientNum}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" required=""/>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col">
		<div class="card">
		    <div class="card-header">
		        <strong>Vaccine Information</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
				    <label for="jabCount">
						Jab Count
						<span class="required-indicator">*</span>
					</label>
					<g:select name="jabCount" id="jabCount" class="form-control" value="${vaccineInstance?.jabCount}" from="${ph.edu.upm.nih.covid19lis.info.JabCount}" optionKey="key" noSelection="['':'Select Count']" required=""/>
				</div>
				<div class="form-group">
					<label for="productName">
						Product Name
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="productName" id="productName" class="form-control" value="${vaccineInstance?.productName}" required="" />
				</div>
				<div class="row">
				    <div class="col-sm-6">
				    	<div class="form-group">
					    	<label for="manufacturer">
								Manufacturer
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="manufacturer" id="manufacturer" class="form-control" value="${vaccineInstance?.manufacturer}" required="" />
				    	</div>
				    </div>
				    <div class="col-sm-6">
				    	<div class="form-group">
					    	<label for="lotNum">
								Lot Number
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="lotNum" id="lotNum" class="form-control" value="${vaccineInstance?.lotNum}" required="" />
				    	</div>
				    </div>
				</div>
				<div class="row">
				    <div class="col-sm-6">
						<div class="form-group">
							<label for="dateAdministered">
								Date Administered
								<span class="required-indicator">*</span>
							</label>
							<g:datePicker name="dateAdministered" id="dateAdministered" class="form-control" value="${vaccineInstance?.dateAdministered}" precision="day" />
						</div>
				    </div>
				    <div class="col-sm-6">
				    	<div class="form-group">
					    	<label for="personAdministered">
								Healthcare Professional or Clinical Site
							</label>
							<g:textField name="personAdministered" id="personAdministered" class="form-control" value="${vaccineInstance?.personAdministered}" />
				    	</div>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>