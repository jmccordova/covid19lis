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
                            <g:if test="${patientCaseInstance?.placesVisited}">
                                <table class="table table-responsive">
                                    <thead>
                                        <th>Date</th>
                                        <th>Type</th>
                                        <th>Name</th>
                                        <th>With community transmission?</th>
                                    </thead>
                                    <tbody>
                                        <g:each in="${patientCaseInstance?.placesVisited}">
                                            <tr>
                                                <td><g:formatDate format="MMMM d, YYYY" date="${it?.dateVisitedFrom}"/> - <g:formatDate format="MMMM d, YYYY" date="${it?.dateVisitedTo}"/></td>
                                                <td>${it?.facilityType}</td>
                                                <td>${it?.placeName}</td>
                                                <td>${it?.commTransmission ? 'Yes' : 'No'}</td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </g:if>
                            <g:link controller="address" action="createVisit" class="btn btn-sm btn-info" params="[patientCase: patientCaseInstance?.id]">Add</g:link>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Close Contacts</strong>
                        </div>
                        <div class="card-body">
                            <g:if test="${!patientCaseInstance?.contacts?.isEmpty()}">
                                <table class="table table-responsive">
                                    <thead>
                                        <th>Name</th>
                                        <th>Phone No.</th>
                                        <th>Exposure</th>
                                    </thead>
                                    <tbody>
                                        <g:each in="${patientCaseInstance?.contacts}">
                                            <tr>
                                                <td>${it?.fullName}</td>
                                                <td>${it?.contactNumber}</td>
                                                <td>${it?.exposureSetting}</td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </g:if>
                            <g:link controller="person" action="create" class="btn btn-sm btn-info" params="[patientCase: patientCaseInstance?.id]">Add</g:link>
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
                                <table class="table table-responsive">
                                    <tr>
                                        <td>Symptoms</td>
                                        <td>
                                            <g:if test="${patientCaseInstance?.isAsymptomatic}">
                                                None
                                            </g:if>
                                            <g:else>
                                                ${patientCaseInstance?.clinicalTest?.allSymptoms}
                                            </g:else>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Chest Radiology Result</td>
                                        <td>
                                            <g:if test="${!patientCaseInstance?.clinicalTest?.hasChestRad}">
                                                Not tested yet
                                            </g:if>
                                            <g:else>
                                                ${patientCaseInstance?.clinicalTest?.chestRadResult}
                                                <small>Tested last: <g:formatDate format="MMMM d, YYYY" date="${patientCaseInstance?.clinicalTest?.dateChestRadResult}"/></small>
                                            </g:else>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Chest CT Result</td>
                                        <td>
                                            <g:if test="${!patientCaseInstance?.clinicalTest?.hasChestCT}">
                                                Not tested yet
                                            </g:if>
                                            <g:else>
                                                ${patientCaseInstance?.clinicalTest?.chestCTResult}
                                                <small>Tested last: <g:formatDate format="MMMM d, YYYY" date="${patientCaseInstance?.clinicalTest?.dateChestCTResult}"/></small>
                                            </g:else>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Lung Ultrasound Result</td>
                                        <td>
                                            <g:if test="${!patientCaseInstance?.clinicalTest?.hasLungUS}">
                                                Not tested yet
                                            </g:if>
                                            <g:else>
                                                ${patientCaseInstance?.clinicalTest?.lungUSResult}
                                                <small>Tested last: <g:formatDate format="MMMM d, YYYY" date="${patientCaseInstance?.clinicalTest?.dateLungUSResult}"/></small>
                                            </g:else>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <g:link controller="clinicalInfo" action="edit" class="btn btn-sm btn-info" id="${patientCaseInstance?.clinicalTest?.id}">Update</g:link>
                                        </td>
                                    </tr>
                                </table>
                            </g:if>
                            <g:else>
                                <g:link controller="clinicalInfo" action="create" class="btn btn-sm btn-info" params="[patientCase: patientCaseInstance?.id]">Add</g:link>
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
                                <table class="table table-responsive">
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
                                                <td><g:formatDate format="MMMM d, YYYY" date="${it?.dateCollected}"/></td>
                                                <td>${it?.specimenNum}</td>
                                                <td>${it?.status}</td>
                                                <td>${it?.labResult} <small>Released: <g:formatDate format="MMMM d, YYYY" date="${it?.dateReleased}"/></small></td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </g:if>
                            <g:else>
                                <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_ENCODER">
                                    <g:link controller="specimen" action="create" class="btn btn-sm btn-info" params="[patientCase: patientCaseInstance?.id]">Add</g:link>
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
