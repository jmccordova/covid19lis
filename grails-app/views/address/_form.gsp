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
				    </label>
				    <% def patientNum = addressInstance ? addressInstance?.patient.id : params.long('patient') %>
				    <g:select name="patient.id" id="patient.id" class="form-control select2" value="${patientNum}" from="${ph.edu.upm.nih.covid19lis.patient.Patient.list()}" optionKey="id" optionValue="fullName"  noSelection="['':'Select Patient']" required="${patientNum == null}"/>
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
		        	<label for="addressType">
						What address is this for?
						<span class="required-indicator">*</span>
					</label>
					<g:select name="addressType" id="addressType" class="form-control" value="${addressInstance?.addressType}" from="${ph.edu.upm.nih.AddressType}"optionKey="key" noSelection="['':'Select Type of Address']" required=""/>
		        </div>
		        <div class="row">
		        	<div class="col-sm-2">
				        <div class="form-group">
				        	<label for="houseNum">
								House No.
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="houseNum" id="houseNum" class="form-control" value="${addressInstance?.houseNum}" required="" />
				        </div>
				    </div>
				    <div class="col-sm-5">
				        <div class="form-group">
				        	<label for="streetName">
								Street
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="streetName" id="streetName" class="form-control" value="${addressInstance?.streetName}" required="" />
				        </div>
				    </div>
				    <div class="col-sm-5">
				        <div class="form-group">
				        	<label for="barangay">
								Barangay
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="barangay" id="barangay" class="form-control" value="${addressInstance?.barangay}" required="" />
				        </div>
				    </div>
				</div>
				<div class="row">
				    <div class="col-sm-6">
				        <label for="municipality">
							Municipality or City
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="municipality" id="municipality" class="form-control" value="${addressInstance?.municipality}" required="" />
				    </div>
				    <div class="col-sm-6">
				        <label for="province">
							Province
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="province" id="province" class="form-control" value="${addressInstance?.province}" required="" />
				    </div>
				</div>
				<div class="row">
		        	<div class="col-sm-3">
				        <div class="form-group">
				        	<label for="phoneNumber">
								Phone Number
							</label>
							<g:textField name="phoneNumber" id="phoneNumber" class="form-control" value="${addressInstance?.phoneNumber}"/>
				        </div>
				    </div>
				    <div class="col-sm-3">
				        <div class="form-group">
				        	<label for="cellNumber">
								Cellphone Number
								<span class="required-indicator">*</span>
							</label>
							<input type="text" name="cellNumber" id="cellNumber" class="form-control" value="${addressInstance?.cellNumber}" required="" pattern="^(0|63)\d{10}$" />
				        </div>
				    </div>
				    <div class="col-sm-6">
				        <div class="form-group">
				        	<label for="emailAddress">
								E-mail Address
								<span class="required-indicator">*</span>
							</label>
							<g:field type="email" name="emailAddress" id="emailAddress" class="form-control" value="${addressInstance?.emailAddress}" required="" />
				        </div>
				    </div>
				</div>
		    </div>
		</div>
	</div>
</div>