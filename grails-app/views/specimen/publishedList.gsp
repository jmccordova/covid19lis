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
            <h1>Published Results</h1>
            <g:render template="/layouts/flash" /> 

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Samples</strong>
                        </div>
                        <div class="card-body">
                            <table id="specimenList" class="table table-responsive-sm table-bordered table-striped table-sm export-table-search" style="width: 100%;">
                                <thead>
                                    <tr>
                                        <th>Last Updated</th>
                                        <th>Patient Name</th>
                                        <th>Disease Reporting Unit</th>
                                        <th>Current Status</th>
                                        <th>Date Received</th>
                                        <th>Results</th>
                                        <th>Date Released</th>
                                        <th class="not-for-export"></th>
                                    </tr>
                                    <tr>
                                        <th>Last Updated</th>
                                        <th>Patient Name</th>
                                        <th>Disease Reporting Unit</th>
                                        <th>Current Status</th>
                                        <th>Date Received</th>
                                        <th>Results</th>
                                        <th>Date Released</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${specimenList}">
                                        <tr>
                                            <td><g:formatDate format="MMMM d, YYYY" date="${it?.lastUpdated}"/></td>
                                            <td><g:link controller="patient" action="show" id="${it?.patientCase?.patient?.id}">${it?.patientCase?.patient?.fullName}</g:link></td>
                                            <td>${it?.patientCase?.diseaseReportingUnit}</td>
                                            <td>${it?.status}</td>
                                            <td><g:formatDate format="MMMM d, YYYY" date="${it?.dateCollected}"/></td>
                                            <td>${it?.labResult}</td>
                                            <td><g:formatDate format="MMMM d, YYYY" date="${it?.dateReleased}"/></td>
                                            <td>
                                                <g:form method="POST" action="sequence" id="${it?.id}">
                                                    <g:link action="show" class="btn btn-sm btn-info" id="${it?.id}">View</g:link>
                                                    <g:link class="btn btn-sm btn-primary" controller="export" action="generateResult" id="${it?.id}">Generate Result</g:link>
                                                </g:form>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>