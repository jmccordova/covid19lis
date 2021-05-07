<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Add Address</title>
    </head>
    <body class="c-app">
        <div class="row" role="main">
            <div class="col-sm-12">
                <g:render template="/layouts/flash" />
                <g:form resource="${this.address}" method="POST">
                    <g:render template="form" />
                    <g:submitButton name="create" class="btn btn-sm btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </g:form>
            </div>
        </div>
    </body>
</html>
