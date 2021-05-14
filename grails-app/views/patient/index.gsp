<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-patient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-patient" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table id="patientList" class="table export-table">
                <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>PhilHealth No.</th>
                    <th>Current Case</th>
                    <th>Result</th>
                    <th class="not-for-export"></th>
                </thead>
                <tbody>
                    <g:each in="${patientList}">
                        <tr>
                            <td>${it?.patientNum}</td>
                            <td>${it?.getFullName(true)}</td>
                            <td>${it?.philHealthNum}</td>
                            <td>
                                <% def patientCaseInstance = !it?.cases?.isEmpty() ? it?.cases?.last() : null %>
                                <g:link controller="patientCase" action="show" id="${patientCaseInstance?.id}">
                                    ${patientCaseInstance?.caseNum}
                                </g:link>
                                <g:if test="${patientCaseInstance}">
                                    <small>Added <g:formatDate format="MMMM dd, YYYY" date="${patientCaseInstance?.dateCreated}"/></small>
                                </g:if>
                            </td>
                            <td>
                                <% def laboratoryInfoInstance = !patientCaseInstance?.labTests?.isEmpty() ? patientCaseInstance?.labTests?.last() : null %>    
                                <g:if test="${laboratoryInfoInstance}">
                                    ${laboratoryInfoInstance?.labResult}
                                </g:if>
                            </td>
                            <td>
                                <g:link action="show" id="${it?.id}">View</g:link>
                                <g:link action="edit" id="${it?.id}">Edit</g:link>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </body>
</html>