<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'specimen.label', default: 'Specimen')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-specimen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_ENCODER">
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </sec:ifAnyGranted>
            </ul>
        </div>
        <div id="list-specimen" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <g:set var="springSecurityService" bean="springSecurityService"/>
            <table id="specimenList" class="table export-table">
                <thead>
                    <th></th>
                    <th>ID</th>
                    <th>Date Updated</th>
                    <th>Case No.</th>
                    <th>Type</th>
                    <th>Current Status</th>
                    <th>Result</th>
                    <th></th>
                    <th class="not-for-export"></th>
                </thead>
                <tbody>
                    <g:each in="${specimenList}">
                        <tr>
                            <td><g:checkBox name="specimens" id="specimen-${it?.id}" value="${it?.id}" checked="${false}"/></td>
                            <td>${it?.specimenNum}</td>
                            <td><g:formatDate format="MMMM dd, YYYY" date="${it?.lastUpdated}"/></td>
                            <td>${it?.patientCase?.caseNum}</td>
                            <td>${it?.labTest}</td>
                            <td>${it?.status}</td>
                            <td>${it?.labResult}</td>
                            <td></td>
                            <td>
                                <g:form method="POST" action="decide" id="${it?.id}">
                                    <g:link action="show" id="${it?.id}">View</g:link>
                                    <g:if test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.SUBMITTED}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_ENCODER">
                                            <g:link action="edit" id="${it?.id}">Edit</g:link>
                                        </sec:ifAnyGranted>
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT, ROLE_QA, ROLE_MB, ROLE_PATH">
                                            <button class="button" name="decision" value="acceptSample">Accept</button>
                                            <button class="button" name="decision" value="rejectSample" onclick="return confirm('Reject this sample?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:if>
                                    <g:if test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_PROCESSING}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT, ROLE_QA, ROLE_MB, ROLE_PATH">
                                            <g:link action="addResult" id="${it?.id}">Add Result</g:link>
                                        </sec:ifAnyGranted>
                                    </g:if>
                                    <g:if test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_MT1 && it?.approverMT1 != springSecurityService?.currentUser}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT">
                                            <button class="button" name="decision" value="acceptMT1">Accept</button>
                                            <button class="button" name="decision" value="rejectResult" onclick="return confirm('Reject the results?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:if>
                                    <g:if test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_MT2 && it?.approverMT2 != springSecurityService?.currentUser}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT">
                                            <button class="button" name="decision" value="acceptMT2">Accept</button>
                                            <button class="button" name="decision" value="rejectResult" onclick="return confirm('Reject the results?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:if>
                                </g:form>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${specimenCount ?: 0}" />
            </div>
        </div>
    </body>
</html>