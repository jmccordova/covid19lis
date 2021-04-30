<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'staff.label', default: 'Staff')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-staff" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-staff" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            
            <table id="staffList" class="table data-table">
                <thead>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Active?</th>
                    <th>Locked?</th>
                    <th class="not-for-export"></th>
                </thead>
                <tbody>
                    <g:each in="${staffList}">
                        <tr>
                            <td>${it?.username}</td>
                            <td>${it?.getFullName(true)}</td>
                            <td>${it?.authorities?.first()?.name}</td>
                            <td>${it?.enabled ? 'Yes' : 'No'}</td>
                            <td>${it?.accountLocked ? 'Yes' : 'No'}</td>
                            <td>
                                <g:link action="show" id="${it?.id}">View</g:link>
                                <g:link action="edit" id="${it?.id}">Edit</g:link>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </body>
</html>