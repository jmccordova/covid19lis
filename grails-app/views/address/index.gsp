<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Address List</title>
    </head>
    <body>
        <div id="list-address" class="content scaffold-list" role="main">
            <h1>Address List</h1>
            <g:render template="/layouts/flash" />

            <table id="addressList" class="table export-table">
                <thead>
                    <th>Patient</th>
                    <th>Address</th>
                    <th>Contact No.</th>
                    <th>E-mail</th>
                    <th class="not-for-export"></th>
                </thead>
                <tbody>
                    <g:each in="${addressList}">
                        <tr>
                            <td>
                                <g:if test="${it?.patient}">${it?.patient?.fullName}</g:if>
                                <g:elseif test="${it?.patientCase}">${it?.patientCase?.patient?.fullName}</g:elseif>
                            </td>
                            <td>
                                <g:if test="${it?.addressType}">
                                    ${it?.addressType}: ${it?.fullAddress}
                                </g:if>
                                <g:elseif test="${it?.facilityType}">
                                    ${it?.facilityType}: ${it?.placeName}
                                </g:elseif>
                            </td>
                            <td>
                                <g:if test="${it?.phoneNumber}">
                                    ${it?.phoneNumber} <br />
                                </g:if>
                                <g:if test="${it?.cellNumber}">
                                    ${it?.cellNumber}
                                </g:if>
                            </td>
                            <td>${it?.emailAddress}</td>
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