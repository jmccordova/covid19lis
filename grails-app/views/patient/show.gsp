<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'patient.label', default: 'Patient')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-patient" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-patient" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <h2>Patient Details</h2>
            <fieldset class="form view-only">
                <g:render template="form" model="[patientInstance: patientInstance]"/>
            </fieldset>
            
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Addresses</strong>
                        </div>
                        <div class="card-body">
                            <table class="table table-responsive-sm table-bordered">
                                <thead>
                                    <th>Address Type</th>
                                    <th>Address</th>
                                    <th>Phone Number</th>
                                    <th>Cell Number</th>
                                    <th>E-mail Address</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <g:each in="${patientInstance?.addresses}">
                                        <tr>
                                            <td>${it?.addressType?.toString()}</td>
                                            <td>${it?.fullAddress}</td>
                                            <td>${it?.phoneNumber}</td>
                                            <td>${it?.cellNumber}</td>
                                            <td>${it?.emailAddress}</td>
                                            <td>
                                                <g:link class="btn btn-small btn-info" controller="address" action="show" id="${it?.id}">View</g:link>
                                                <g:link class="btn btn-small btn-info" controller="address" action="edit" id="${it?.id}">Edit</g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5">
                                            <g:link class="btn btn-small btn-primary" controller="address" action="create" params="[patient: patientInstance?.id]">Add</g:link>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Cases</strong>
                        </div>
                        <div class="card-body">
                            <table class="table table-responsive-sm table-bordered">
                                <thead>
                                    <th>Date Interviewed</th>
                                    <th>Test Category</th>
                                    <th>Disposition</th>
                                    <th>Health Status</th>
                                    <th>Case Classification</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <g:each in="${patientInstance?.cases}">
                                        <tr>
                                            <td><g:formatDate format="MMMM d, YYYY" date="${it?.dateInterviewed}"/></td>
                                            <td>${it?.testCategory?.toString()}</td>
                                            <td>
                                                ${it?.dispositionType?.toString()} <br />
                                                ${it?.dispositionFacility}
                                            </td>
                                            <td>${it?.healthStatus?.toString()}</td>
                                            <td>${it?.caseClassification?.toString()}</td>
                                            <td>
                                                <g:link class="btn btn-small btn-info" controller="patientCase" action="show" id="${it?.id}">View</g:link>
                                                <g:link class="btn btn-small btn-info" controller="patientCase" action="edit" id="${it?.id}">Edit</g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="6">
                                            <g:link class="btn btn-small btn-primary" controller="patientCase" action="create" params="[patient: patientInstance?.id]">Add</g:link>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row align-items-center">
                <div class="col-12">
                    <g:form resource="${this.patientInstance}" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="btn btn-primary" action="edit" resource="${this.patientInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <input class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>
