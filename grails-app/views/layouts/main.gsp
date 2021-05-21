<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="jquery-3.3.1.min.js" />
    <asset:javascript src="spinner.js"/>
    <g:layoutHead/>
</head>
<g:set var="springSecurityService" bean="springSecurityService"/>
<body class="c-app">
    <div id="spinner" class="spinner">
        <div class="container">
            <div id="spinner-container" class="row">
                <div class="col">
                    <div class="progress">
                        <div class="indeterminate"></div>
                    </div>
                    <h3 class="flow-text">Loading...</h3>
                </div>
            </div>
        </div>
    </div>
    <sec:ifLoggedIn>
        <div class="c-sidebar c-sidebar-dark c-sidebar-fixed c-sidebar-lg-show" id="sidebar">
            <div class="c-sidebar-brand d-lg-down-none">
                <div class="c-sidebar-brand-full"></div>
                <div class="c-sidebar-brand-minimized"></div>
            </div>
            <ul class="c-sidebar-nav">
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" uri="/">
                        <span class="c-sidebar-nav-icon cil-home"></span>
                        Dashboard
                    </g:link>
                </li>
                <li class="c-sidebar-nav-title">Contact Tracing</li>
                <li class="c-sidebar-nav-item c-sidebar-nav-dropdown">
                    <g:link class="c-sidebar-nav-link c-sidebar-nav-dropdown-toggle" uri="#">
                        <span class="c-sidebar-nav-icon cil-group"></span> Patient
                    </g:link>
                    <ul class="c-sidebar-nav-dropdown-items">
                        <li class="c-sidebar-nav-item">
                            <g:link class="c-sidebar-nav-link" controller="patient" action="index">
                                <span class="c-sidebar-nav-icon cil-list"></span>
                                List
                            </g:link>
                        </li>
                        <li class="c-sidebar-nav-item">
                            <g:link class="c-sidebar-nav-link" controller="patientCase" action="index">
                                <span class="c-sidebar-nav-icon cil-notes"></span>
                                Cases
                            </g:link>
                        </li>
                    </ul>
                    
                </li>
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" controller="address" action="index">
                        <span class="c-sidebar-nav-icon cil-location-pin"></span>
                        Address
                    </g:link>
                </li>
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" controller="person" action="index">
                        <span class="c-sidebar-nav-icon cil-contact"></span>
                        Close Contacts
                    </g:link>
                </li>
                <li class="c-sidebar-nav-title">Laboratory</li>
                <li class="c-sidebar-nav-item c-sidebar-nav-dropdown">
                    <g:link class="c-sidebar-nav-link c-sidebar-nav-dropdown-toggle" uri="#">
                        <span class="c-sidebar-nav-icon cil-share"></span> Export
                    </g:link>
                    <ul class="c-sidebar-nav-dropdown-items">
                        <li class="c-sidebar-nav-item">
                            <g:link class="c-sidebar-nav-link" controller="export" action="lineList">
                                <span class="c-sidebar-nav-icon cil-"></span> Line List
                            </g:link>
                        </li>
                        <li class="c-sidebar-nav-item">
                            <g:link class="c-sidebar-nav-link" controller="export" action="sourceFile">
                                <span class="c-sidebar-nav-icon cil-"></span> Source File
                            </g:link>
                        </li>
                        <li class="c-sidebar-nav-item">
                            <g:link class="c-sidebar-nav-link" uri="#">
                                <span class="c-sidebar-nav-icon cil-"></span> CIF
                            </g:link>
                        </li>
                    </ul>
                </li>
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" controller="clinicalInfo" action="index">
                        <span class="c-sidebar-nav-icon cil-hospital"></span>
                        Clinical Test
                    </g:link>
                </li>
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" controller="specimen" action="index">
                        <span class="c-sidebar-nav-icon cil-beaker"></span>
                        Lab Test
                    </g:link>
                </li>
                <li class="c-sidebar-nav-divider"></li>
                <li class="c-sidebar-nav-title">Admin</li>
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" controller="staff" action="index">
                        <span class="c-sidebar-nav-icon cil-medical-cross"></span>
                        Staff
                    </g:link>
                </li>
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" controller="testKit" action="index">
                        <span class="c-sidebar-nav-icon cil-cart"></span>
                        Inventory
                    </g:link>
                </li>
                <li class="c-sidebar-nav-item">
                    <g:link class="c-sidebar-nav-link" controller="auditLog" action="index">
                        <span class="c-sidebar-nav-icon cil-spreadsheet"></span>
                        Audit Log
                    </g:link>
                </li>
            </ul>
            <button class="c-sidebar-minimizer c-class-toggler" type="button" data-target="_parent" data-class="c-sidebar-minimized"></button>
        </div>
    </sec:ifLoggedIn>
    <div class="c-wrapper">
        <header class="c-header c-header-light c-header-fixed c-header-with-subheader">
            <sec:ifLoggedIn>
                <button class="c-header-toggler c-class-toggler d-lg-none mfe-auto" type="button" data-target="#sidebar" data-class="c-sidebar-show">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <button class="c-header-toggler c-class-toggler mfs-3 d-md-down-none" type="button" data-target="#sidebar" data-class="c-sidebar-lg-show" responsive="true">
                    <div class="c-icon c-icon-lg">
                        <span class="cil-menu"></span>
                    </div>
                </button>
            </sec:ifLoggedIn>
            <a class="c-header-brand d-lg-none" href="#">
                <asset:image src="logo.png" alt="NIH Logo"/>
            </a>
            <ul class="c-header-nav ml-auto mr-4">
                <li class="c-header-nav-item dropdown">
                    <a class="c-header-nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        <div class="c-avatar">
                            <sec:ifLoggedIn>
                                <asset:image class="c-avatar-img" src="person-icon.jpg" alt="${springSecurityService?.currentUser?.username}" />
                            </sec:ifLoggedIn>
                            <sec:ifNotLoggedIn>
                                <asset:image class="c-avatar-img" src="person-icon-guest.jpg" alt="${springSecurityService?.currentUser?.username}" />
                            </sec:ifNotLoggedIn>
                        </div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right pt-0">
                        <sec:ifLoggedIn>
                        <div class="dropdown-header bg-light py-2">
                            <strong>Account</strong>
                        </div>
                        <g:link class="dropdown-item" controller="staff" action="edit" id="${springSecurityService?.currentUser?.id}">
                            <span class="c-sidebar-nav-icon cil-pencil"></span> 
                            Edit
                        </g:link>
                        <div class="dropdown-divider"></div>
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <g:link class="dropdown-item" controller="login" action="index">
                                <span class="c-sidebar-nav-icon cil-door"></span>
                                Login
                            </g:link>
                        </sec:ifNotLoggedIn>
                        <sec:ifLoggedIn>
                            <g:link class="dropdown-item" controller="staff" action="lock" id="${springSecurityService?.currentUser?.id}">
                                <span class="c-sidebar-nav-icon cil-lock-locked"></span>
                                Lock Account
                            </g:link>
                            <g:form controller="logout" action="index" method="POST">
                                <button class="dropdown-item">
                                    <span class="c-sidebar-nav-icon cil-account-logout"></span>
                                    Logout
                                </button>
                            </g:form>
                        </sec:ifLoggedIn>                      
                    </div>
                </li>
            </ul>
        </header> 
        <div class="c-body">
            <main class="c-main">
                <div class="container-fluid">
                    <g:layoutBody/>
                </div>
            </main>
        </div>
        <footer class="c-footer"></footer>
    </div>
    <asset:javascript src="application.js"/>
</body>
</html>
