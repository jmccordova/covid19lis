<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'specimen.label', default: 'Specimen')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-specimen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-specimen" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <fieldset class="form view-only">
                <g:render template="form" />
                <g:if test="${this.specimenInstance?.status != ph.edu.upm.nih.covid19lis.info.SpecimenStatus.SUBMITTED && this.specimenInstance?.status != ph.edu.upm.nih.covid19lis.info.SpecimenStatus.SAMPLE_REJECTED && this.specimenInstance?.status != ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_PROCESSING}">
                    <g:render template="result_form" />
                </g:if>
            </fieldset>

            <g:form resource="${this.specimenInstance}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-info" action="edit" resource="${this.specimenInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
