<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'specimen.label', default: 'Specimen')}" />
        <title>Add Result</title>
    </head>
    <body>
        <a href="#addResult-specimen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="addResult-specimen" class="content scaffold-addResult" role="main">
            <h1>Add Result</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${this.specimenInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.specimenInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <g:form resource="${this.specimenInstance}" method="POST">
                <fieldset class="form view-only">
                    <h2>Lab Test</h2>
                    <g:render template="form" />
                </fieldset>
                <fieldset class="form">
                    <h2>Lab Result</h2>
                    <g:hiddenField name="status" value="${ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_MT1?.key}" />
                    <g:render template="result_form" />
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
