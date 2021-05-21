<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'testKit.label', default: 'TestKit')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-testKit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-testKit" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <table id="testKitList" class="table export-table">
                <thead>
                    <th>Date Received</th>
                    <th>Brand</th>
                    <th>Lot No.</th>
                    <th>Test Kit Type</th>
                    <th>Current Count</th>
                    <th>Expiration Date</th>
                    <th></th>
                </thead>
                <tbody>
                    <g:each in="${testKitList}">
                        <tr>
                            <td><g:formatDate format="MMMM dd, YYYY" date="${it?.dateReceived}"/></td>
                            <td>${it?.brand}</td>
                            <td>${it?.lotNum}</td>
                            <td>${it?.testKitType}</td>
                            <td><span class="${it?.needsReorder() ? 'danger' : ''}">${it?.currentCount}<small>/${it?.totalReceived}</small></span></td>
                            <td><g:formatDate format="MMMM dd, YYYY" date="${it?.dateExpiration}"/></td>
                            <td>
                                <g:link class="btn btn-small btn-info" action="show" id="${it?.id}">View</g:link>
                                <g:link class="btn btn-small btn-info" action="edit" id="${it?.id}">Edit</g:link>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>


            <div class="pagination">
                <g:paginate total="${testKitCount ?: 0}" />
            </div>
        </div>
    </body>
</html>