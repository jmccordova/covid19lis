<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Export Form A</title>
    </head>
    <body>
        <div id="list-lineList" class="content scaffold-list" role="main">
            <h1>Form A</h1>
            <g:form method="GET" action="generateFormA">
                <div class="row">
                    <div class="col-sm-5">
                        <span class="help-block">Start Date</span>
                        <g:field class="form-control" id="date-start" type="date" name="startDate" placeholder="date" value="${params.startDate}" max="${new java.text.SimpleDateFormat('yyyy-MM-dd').format(new Date())}" />
                    </div>
                    <div class="col-sm-5">
                        <span class="help-block">End Date</span>
                        <g:field class="form-control" id="date-end" type="date" name="endDate" placeholder="date" value="${params.endDate}" min="${params.startDate}" max="${new java.text.SimpleDateFormat('yyyy-MM-dd').format(new Date())}" />
                    </div>
                    <div class="col-sm-2">
                        <g:submitButton class="btn btn-sm btn-primary" name="submit" value="Submit" />
                    </div>
                </div>
            </g:form>
        </div>
        <g:javascript>
            $(document).ready(function(){
                $("#date-start").change(function() {
                    var val = $(this).val()

                    $("#date-end").attr('min', val)
                })
            });
        </g:javascript>
    </body>
</html>