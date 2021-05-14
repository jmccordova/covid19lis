<!doctype html>
<html>
    <head>
        <title>Forbidden</title>
        <meta name="layout" content="main">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <h2 class="header">Forbidden</h2>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12">
                    <p class="flow-text">You are not allowed to access <u>${createLink(uri: "/", absolute: true) + request.forwardURI.substring(1)}</u>.</p>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m12 l12">
                    <div class="btn right back-button">Go Back</div>
                </div>
            </div>
        </div>
    </body>
</html>
