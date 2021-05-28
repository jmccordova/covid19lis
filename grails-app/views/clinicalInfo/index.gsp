<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'clinicalInfo.label', default: 'ClinicalInfo')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-clinicalInfo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-clinicalInfo" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <table id="clinicalInfoList" class="table export-table">
                <thead>
                    <th>Case No.</th>
                    <th>Patient</th>
                    <th>Symptoms</th>
                    <th>Chest Radiology</th>
                    <th>Chest CT Scan</th>
                    <th>Lung Ultrasound</th>
                    <th class="not-for-export"></th>
                </thead>
                <tbody>
                    <g:each in="${clinicalInfoList}">
                        <tr>
                            <td>${it?.patientCase?.caseNum}</td>
                            <td>${it?.patientCase?.patient?.fullName}</td>
                            <td>${it?.allSymptoms}</td>
                            <td>
                                <g:if test="${it?.hasChestRad}">
                                    ${it?.correctChestRadResult} <small>Tested: <g:formatDate format="MMMM d, YYYY" date="${it?.dateChestRadTest}"/></small>
                                </g:if>
                                <g:else>
                                    Not yet tested
                                </g:else>
                            </td>
                            <td>
                                <g:if test="${it?.hasChestCT}">
                                    ${it?.correctChestCTResult} <small>Tested: <g:formatDate format="MMMM d, YYYY" date="${it?.dateChestCTTest}"/></small>
                                </g:if>
                                <g:else>
                                    Not yet tested
                                </g:else>
                            </td>
                            <td>
                                <g:if test="${it?.hasLungUS}">
                                    ${it?.correctLungUSResult} <small>Tested: <g:formatDate format="MMMM d, YYYY" date="${it?.dateLungUSTest}"/></small>
                                </g:if>
                                <g:else>
                                    Not yet tested
                                </g:else>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${clinicalInfoCount ?: 0}" />
            </div>
        </div>
    </body>
</html>