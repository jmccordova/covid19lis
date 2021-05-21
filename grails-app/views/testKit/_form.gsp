<div class="row">
    <div class="col">
    	<div class="card">
		    <div class="card-header">
		        <strong>Inventory Information</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
				<div class="form-group">
					<label for="dateReceived">
						Date Received
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="dateReceived" id="dateReceived" class="form-control" value="${testKitInstance?.dateReceived}" precision="day" required="" />
				</div>

				<div class="form-group">
					<label for="brand">
						Brand
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="brand" id="brand" class="form-control" value="${testKitInstance?.brand}" required=""/>
				</div>

				<div class="form-group">
					<label for="lotNum">
						Lot Number
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="lotNum" id="lotNum" class="form-control" value="${testKitInstance?.lotNum}" required=""/>
				</div>

				<div class="form-group">
					<label for="dateExpiration">
						Expiry Date
						<span class="required-indicator">*</span>
					</label>
					<g:datePicker name="dateExpiration" id="dateExpiration" class="form-control" value="${testKitInstance?.dateExpiration}" precision="day" required="" />
				</div>

				<div class="form-group">
					<label for="testKitType">
						Test Kit Type
						<span class="required-indicator">*</span>
					</label>
					<g:select name="testKitType" id="testKitType" class="form-control" value="${testKitInstance?.testKitType}" from="${ph.edu.upm.nih.covid19lis.info.TestKitType}" optionKey="key" noSelection="['':'Select Type']" required=""/>
				</div>

				<div class="form-group">
					<label for="totalReceived">
						Total Received
						<span class="required-indicator">*</span>
					</label>
					<g:field type="number" name="totalReceived" id="totalReceived" class="form-control" value="${testKitInstance?.totalReceived}" min="1" required=""/>
				</div>
			</div>
		</div>
	</div>
</div>