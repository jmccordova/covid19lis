<div class="row">
    <div class="col-sm-6">
		<div class="card">
		    <div class="card-header">
		        <strong>Staff Information</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
		    	<div class="form-group">
		    		<label for="lastName">
						Last Name
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="lastName" id="lastName" class="form-control" value="${staffInstance?.lastName}" required="" />
				</div>
				<div class="form-group">
					<label for="firstName">
						First Name
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="firstName" id="firstName" class="form-control" value="${staffInstance?.firstName}" required="" />
				</div>
				<div class="form-group">
					<label for="middleName">
						Middle Name
					</label>
					<g:textField name="middleName" id="middleName" class="form-control" value="${staffInstance?.middleName}" />
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
					<label for="prcNum">
						PRC License Number
					</label>
					<g:textField name="prcNum" id="prcNum" class="form-control" value="${staffInstance?.prcNum}" />
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="card">
			<div class="card-header">
		        <strong>Account Details</strong>
		        <small>Form</small>
		    </div>
		    <div class="card-body">
				<div class="form-group">
				    <label for="role.id">
				        Role
						<span class="required-indicator">*</span>
				    </label>
				    <% def roleInstance = staffInstance ? staffInstance?.authorities?.first() : null %>
				    <g:select name="role.id" id="role.id" class="form-control" value="${roleInstance?.id}" from="${ph.edu.upm.nih.Role.list()}" optionKey="id" optionValue="name"  noSelection="['':'Select Role']" required=""/>
				</div>

				<div class="form-group">
					<label for="username">
						Username
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="username" id="username" class="form-control" value="${staffInstance?.username}" required="" />
				</div>

				<g:if test="${staffInstance != null}">
				<div class="form-group">
					<label for="changePassword">
						Change Password?
					</label>
					
					<g:checkBox name="changePassword" id="changePassword" />
				</div>
				</g:if>

				<div class="form-group">
					<label for="password">
						Password
						<g:if test="${staffInstance == null}">
							<span class="required-indicator">*</span>
						</g:if>
					</label>
					<g:field type="password" name="password" id="password" class="form-control" value="" disabled="${staffInstance != null}" required="${staffInstance == null}"/>
				</div>
		    </div>
		</div>
	</div>
</div>

<g:javascript>
	$(document).ready(function() {
		$("#emailAddress").on('keyup', function(e) {
			var val = $(this).val()
			$("#username").val(val)

		})

		$("#changePassword").click(function() {
			var on = $(this).is(':checked')
			$("#password").prop('disabled', !on).prop('required', on)
		})
	});
</g:javascript>