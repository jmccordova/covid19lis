<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'genome.label', default: 'Genome')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-genome" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <sec:ifAnyGranted roles="ROLE_SUPERADMIN, ROLE_ENCODER">
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </sec:ifAnyGranted>
            </ul>
        </div>
        <div id="list-genome" class="content scaffold-list" role="main">
            <h1>Genome List</h1>
            <g:render template="/layouts/flash" />

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Genomic Data</strong>
                        </div>
                        <div class="card-body">
                            <table id="genomeList" class="table table-responsive-sm table-bordered table-striped table-sm export-table" style="width: 100%;">
                                <thead>
                                    <th>Specimen</th>
                                    <th>Date Sequenced</th>
                                    <th>Case No.</th>
                                    <th>Variant</th>
                                    <th class="not-for-export"></th>
                                </thead>
                                <tbody>
                                    <g:each in="${genomeList}">
                                        <tr>
                                            <td><g:link controller="specimen" action="show" id="${it?.specimen?.id}">${it?.specimen?.specimenNum}</g:link></td>
                                            <td><g:formatDate format="MMMM d, YYYY" date="${it?.dateSequenced}"/></td>
                                            <td>${it?.specimen?.patientCase?.caseNum}</td>
                                            <td>${it?.strain}</td>
                                            <td>
                                                <g:link action="show" class="btn btn-sm btn-info" id="${it?.id}">View</g:link>
                                                <g:if test="${!it?.dateSequenced}">
                                                    <g:link action="addStrain" class="btn btn-sm btn-info" id="${it?.id}">Add details</g:link>
                                                </g:if>
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
    </body>
</html>