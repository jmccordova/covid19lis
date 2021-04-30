<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'patientCase.label', default: 'PatientCase')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-patientCase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-patientCase" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <span>*Tentative <strike>Rejected</strike></span>
            <table id="patientCaseList" class="table export-table">
                <thead>
                    <th>ID</th>
                    <th>Date Added</th>
                    <th>Patient Name</th>
                    <th>Current Status</th>
                    <th class="not-for-export"></th>
                </thead>
                <tbody>
                    <g:each in="${patientCaseList}">
                        <tr>
                            <td>${it?.caseNum}</td>
                            <td><g:formatDate format="MMMM dd, YYYY" date="${it?.dateCreated}"/></td>
                            <td>${it?.patient?.getFullName(true)}</td>
                            <td>
                                <% def laboratoryInfoInstance = it?.labTests?.isEmpty() ? null : it?.labTests?.last() %>
                                
                                <g:if test="${ laboratoryInfoInstance?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.RESULT_REJECTED}">
                                    <strike>
                                </g:if>

                                ${laboratoryInfoInstance?.labResult}
                                <g:if test="${laboratoryInfoInstance?.status != ph.edu.upm.nih.covid19lis.info.SpecimenStatus.RESULT_ACCEPTED || laboratoryInfoInstance?.status != ph.edu.upm.nih.covid19lis.info.SpecimenStatus.RESULT_REJECTED}">
                                    <strong>*</strong>
                                </g:if>

                                <g:if test="${ laboratoryInfoInstance?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.RESULT_REJECTED}">
                                    </strike>
                                </g:if>
                            </td>
                            <td></td>
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