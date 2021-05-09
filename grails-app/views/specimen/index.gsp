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
            
            <g:form action="batchAction" method="POST">
                <g:hiddenField name="specimens" value="" />
                %{-- <a class="btn btn-primary" id="selectAll" href="#">Select All</a> --}%
                <g:submitButton class="btn btn-success" name="accept" value="Accept Selected" />
                <g:submitButton class="btn btn-danger" name="reject" value="Reject Selected" />
            </g:form>

            <table id="specimenList" class="table export-table">
                <thead>
                    <th class="not-clickable"><input type="checkbox" id="specimenAll" /></th>
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
                            <td><input type="checkbox" class="specimens" id="specimen-${it?.id}" value="${it?.id}" /></td>
                            <td>${it?.specimenNum}</td>
                            <td><g:formatDate format="MMMM dd, YYYY" date="${it?.lastUpdated}"/></td>
                            <td>${it?.patientCase?.caseNum}</td>
                            <td>${it?.labTest}</td>
                            <td>${it?.status}</td>
                            <td>${it?.labResult}</td>
                            <td></td>
                            <td>
                                <g:form method="POST" action="decide" id="${it?.id}">
                                    <g:link action="show" class="btn btn-sm btn-info" id="${it?.id}">View</g:link>
                                    <g:if test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.SUBMITTED}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_ENCODER">
                                            <g:link action="edit" class="btn btn-sm btn-info" id="${it?.id}">Edit</g:link>
                                        </sec:ifAnyGranted>
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT, ROLE_QA, ROLE_MB, ROLE_PATH">
                                            <button class="btn btn-sm btn-success" name="decision" value="acceptSample">Accept</button>
                                            <button class="btn btn-sm btn-danger" name="decision" value="rejectSample" onclick="return confirm('Reject this sample?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:if>
                                    <g:if test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_PROCESSING}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT, ROLE_QA, ROLE_MB, ROLE_PATH">
                                            <g:link action="addResult" class="btn btn-sm btn-primary" id="${it?.id}">Add Result</g:link>
                                        </sec:ifAnyGranted>
                                    </g:if>
                                    <g:elseif test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_MT1 && it?.approverMT1 != springSecurityService?.currentUser}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT">
                                            <button class="btn btn-sm btn-success" name="decision" value="acceptMT1">Accept</button>
                                            <button class="btn btn-sm btn-danger" name="decision" value="rejectResult" onclick="return confirm('Reject the results?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:elseif>
                                    <g:elseif test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_MT2 && it?.approverMT2 != springSecurityService?.currentUser}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MT">
                                            <button class="btn btn-sm btn-success" name="decision" value="acceptMT2">Accept</button>
                                            <button class="btn btn-sm btn-danger" name="decision" value="rejectResult" onclick="return confirm('Reject the results?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:elseif>
                                    <g:elseif test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_QA}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_QA">
                                            <button class="btn btn-sm btn-success" name="decision" value="acceptQA">Accept</button>
                                            <button class="btn btn-sm btn-danger" name="decision" value="rejectResult" onclick="return confirm('Reject the results?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:elseif>
                                    <g:elseif test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_MB}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_MB">
                                            <button class="btn btn-sm btn-success" name="decision" value="acceptMB">Accept</button>
                                            <button class="btn btn-sm btn-danger" name="decision" value="rejectResult" onclick="return confirm('Reject the results?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:elseif>
                                    <g:elseif test="${it?.status == ph.edu.upm.nih.covid19lis.info.SpecimenStatus.FOR_VERIFICATION_PATH}">
                                        <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_PATH">
                                            <button class="btn btn-sm btn-success" name="decision" value="acceptPATH">Accept</button>
                                            <button class="btn btn-sm btn-danger" name="decision" value="rejectResult" onclick="return confirm('Reject the results?');">Reject</button>
                                        </sec:ifAnyGranted>
                                    </g:elseif>
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

        <script type="text/javascript">
            $(document).ready(function() {
                $("#specimenAll").click(function() {
                    var on = $(this).is(":checked")
                    $(".specimens").prop('checked', !on)
                    $(".specimens").click()
                });

                $(".specimens").on('click', function() {
                    var specimens = []

                    $(".specimens:checked").each(function() {
                        specimens.push($(this).val())
                    })
                    
                    $("[name='specimens']").val(JSON.stringify(specimens))
                })
            });
        </script>
    </body>
</html>