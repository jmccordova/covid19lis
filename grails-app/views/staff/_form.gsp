<div class="fieldcontain required">
	<label for="lastName">
		Last Name
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" id="lastName" value="${staffInstance?.lastName}" required="" />
</div>

<div class="fieldcontain required">
	<label for="firstName">
		First Name
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" id="firstName" value="${staffInstance?.firstName}" required="" />
</div>

<div class="fieldcontain required">
	<label for="middleName">
		Middle Name
	</label>
	<g:textField name="middleName" id="middleName" value="${staffInstance?.middleName}" />
</div>

<div class="fieldcontain required">
	<label for="contactNumber">
		Contact Number
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contactNumber" id="contactNumber" value="${staffInstance?.contactNumber}" required="" />
</div>

<div class="fieldcontain required">
	<label for="emailAddress">
		E-mail Address
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="emailAddress" id="emailAddress" value="${staffInstance?.emailAddress}" required="" />
</div>

<div class="fieldcontain required">
    <label for="role.id">
        Role
		<span class="required-indicator">*</span>
    </label>
    <% def roleInstance = staffInstance ? staffInstance?.authorities?.first() : null %>
    <g:select name="role.id" id="role.id" class="validate" value="${roleInstance?.id}" from="${ph.edu.upm.nih.Role.list()}" optionKey="id" optionValue="name"  noSelection="['':'Select Role']" required=""/>
</div>

<div class="fieldcontain required">
	<label for="username">
		Username
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" id="username" value="${staffInstance?.username}" required="" />
</div>

<g:if test="${staffInstance != null}">
<div class="fieldcontain required">
	<label for="changePassword">
		Change Password?
	</label>
	
	<g:checkBox name="changePassword" id="changePassword" />
</div>
</g:if>

<div class="fieldcontain required">
	<label for="password">
		Password
		<g:if test="${staffInstance == null}">
			<span class="required-indicator">*</span>
		</g:if>
	</label>
	<g:field type="password" name="password" id="password" value="" disabled="${staffInstance != null}" required="${staffInstance == null}"/>
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