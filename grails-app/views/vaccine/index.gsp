<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vaccine.label', default: 'Vaccine')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-vaccine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-vaccine" class="content scaffold-list" role="main">
            <h1>Vaccinated Patients</h1>
            <g:render template="/layouts/flash" />

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Patients</strong>
                        </div>
                        <div class="card-body">
                            <table id="vaccineList" class="table table-responsive-sm table-bordered table-striped table-sm export-table" style="width: 100%;">
                                <thead>
                                    <th>Date Administered</th>
                                    <th>Patient Name</th>
                                    <th>Dose</th>
                                    <th>Brand</th>
                                    <th>Manufacturer</th>
                                    <th class="not-for-export"></th>
                                </thead>
                                <tbody>
                                    <g:each in="${vaccineList}">
                                        <tr>
                                            <td><g:formatDate format="MMMM d, YYYY" date="${it?.dateAdministered}"/></td>
                                            <td><g:link controller="patient" action="show" id="${it?.patient?.id}">${it?.patient?.getFullName(true)}</g:link></td>
                                            <td>${it?.jabCount?.toString()}</td>
                                            <td>${it?.productName}</td>
                                            <td>${it?.manufacturer}</td>
                                            <td>
                                                <g:link class="btn btn-sm btn-info" action="show" id="${it?.id}">View</g:link>
                                                <g:link class="btn btn-sm btn-info" action="edit" id="${it?.id}">Edit</g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

            <div class="pagination">
                <g:paginate total="${vaccineCount ?: 0}" />
            </div>
        </div>
    </body>
</html>