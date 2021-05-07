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
            
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Places Visited</strong>
                        </div>
                        <div class="card-body">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <th>Date</th>
                                    <th>Type</th>
                                    <th>Address</th>
                                    <th>With community transmission?</th>
                                </thead>
                                <tbody>
                                    <g:each in="${patientCaseInstance?.placesVisited}">
                                        <tr>
                                            <td>${it?.dateVisitedFrom} - ${it?.dateVisitedTo}</td>
                                            <td>${it?.facilityType}</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Close Contacts</strong>
                        </div>
                        <div class="card-body">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <th>Name</th>
                                    <th>Phone No.</th>
                                </thead>
                                <tbody>
                                    <g:each in="${patientCaseInstance?.contacts}">
                                        <tr>
                                            <td>${it?.fullName}</td>
                                            <td>${it?.contactNumber}</td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <h2>Tests</h2>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Clinical Test</strong>
                        </div>
                        <div class="card-body">
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
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Laboratory Tests</strong>
                        </div>
                        <div class="card-body">
                            <g:if test="${patientCaseInstance?.labTests}">
                                <table>
                                    <thead>
                                        <th>Type</th>
                                        <th>Date Collected</th>
                                        <th>Sample ID</th>
                                        <th>Status</th>
                                        <th>Result</th>
                                    </thead>
                                    <tbody>
                                        <g:each in="${patientCaseInstance?.labTests}">
                                            <tr>
                                                <td>${it?.labTest}</td>
                                                <td><g:formatDate format="MMMM dd, YYYY" date="${it?.dateCollected}"/></td>
                                                <td>${it?.specimenNum}</td>
                                                <td>${it?.status}</td>
                                                <td>${it?.labResult} <small>Released: <g:formatDate format="MMMM dd, YYYY" date="${it?.dateReleased}"/></small></td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </g:if>
                            <g:else>
                                <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_ENCODER">
                                    <g:link controller="specimen" action="create" params="[patientCase: patientCaseInstance?.id]">Add</g:link>
                                </sec:ifAnyGranted>
                            </g:else>
                        </div>
                    </div>
                </div>
            </div>

            <g:form resource="${this.patientCaseInstance}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-small btn-primary" action="edit" resource="${this.patientCaseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="btn btn-small btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
