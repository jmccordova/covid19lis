<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'patientCase.label', default: 'PatientCase')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-patientCase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-patientCase" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <fieldset class="form view-only">
                <g:render template="form" />
            </fieldset>
            
            <fieldset class="form">
            <h2>Clinical Test</h2>
            <g:if test="${patientCaseInstance?.clinicalTest}">
                <div class="fieldcontain required">
                    <label>
                        Symptoms
                    </label>
                    <g:if test="${patientCaseInstance?.isAsymptomatic}">
                        None
                    </g:if>
                    <g:else>
                        ${patientCaseInstance?.clinicalTest?.allSymptoms}
                    </g:else>
                </div>

                <div class="fieldcontain required">
                    <label>
                        Chest Radiology Result
                    </label>
                    <g:if test="${!patientCaseInstance?.clinicalTest?.hasChestRad}">
                        Not tested yet
                    </g:if>
                    <g:else>
                        ${patientCaseInstance?.clinicalTest?.chestRadResult}
                        <small>Tested last: <g:formatDate format="MMMM dd, YYYY" date="${patientCaseInstance?.clinicalTest?.dateChestRadResult}"/></small>
                    </g:else>
                </div>

                <div class="fieldcontain required">
                    <label>
                        Chest CT Result
                    </label>
                    <g:if test="${!patientCaseInstance?.clinicalTest?.hasChestCT}">
                        Not tested yet
                    </g:if>
                    <g:else>
                        ${patientCaseInstance?.clinicalTest?.chestCTResult}
                        <small>Tested last: <g:formatDate format="MMMM dd, YYYY" date="${patientCaseInstance?.clinicalTest?.dateChestCTResult}"/></small>
                    </g:else>
                </div>

                <div class="fieldcontain required">
                    <label>
                        Lung Ultrasound Result
                    </label>
                    <g:if test="${!patientCaseInstance?.clinicalTest?.hasLungUS}">
                        Not tested yet
                    </g:if>
                    <g:else>
                        ${patientCaseInstance?.clinicalTest?.lungUSResult}
                        <small>Tested last: <g:formatDate format="MMMM dd, YYYY" date="${patientCaseInstance?.clinicalTest?.dateLungUSResult}"/></small>
                    </g:else>
                </div>
                <g:link controller="clinicalInfo" action="edit" id="${patientCaseInstance?.clinicalTest?.id}">Update</g:link>
            </g:if>
            <g:else>
                <g:link controller="clinicalInfo" action="create" params="[patientCase: patientCaseInstance?.id]">Add</g:link>
            </g:else>

            <h2>Laboratory Tests</h2>
                <table class="table">
                    <thead>
                        <th>Date Collected</th>
                        <th>Test</th>
                        <th>Current Lab</th>
                        <th>Result</th>
                        <th>Date Released</th>
                        <th></th>
                    </thead>
                    <tbody>
                        <g:each in="${patientCaseInstance?.labTests}">
                            <tr>
                                <td><g:formatDate format="MMMM dd, YYYY" date="${it?.dateCollected}"/></td>
                                <td>${it?.appropLabTest}</td>
                                <td>${it?.laboratory?.toString()}</td>
                                <td>${it?.appropLabResult}</td>
                                <td><g:formatDate format="MMMM dd, YYYY" date="${it?.dateReleased}"/></td>
                                <td></td>
                            </tr>
                        </g:each>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4">
                                <g:link controller="laboratoryInfo" action="create" params="[patientCase: patientCaseInstance?.id]">Add</g:link>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </fieldset>

            <g:form resource="${this.patientCaseInstance}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.patientCaseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
