<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Export Census</title>
    </head>
    <body>
        <div id="list-lineList" class="content scaffold-list" role="main">
            <h1>Census</h1>
            <g:form method="GET" action="generateCensus">
                <div class="row">
                    <div class="col-sm-6">
                        <span class="help-block">Start Date</span>
                        <g:field class="form-control" id="date-start" type="date" name="startDate" placeholder="date" value="${params.startDate}" max="${new java.text.SimpleDateFormat('yyyy-MM-dd').format(new Date())}" />
                    </div>
                    <div class="col-sm-6">
                        <span class="help-block">End Date</span>
                        <g:field class="form-control" id="date-end" type="date" name="endDate" placeholder="date" value="${params.endDate}" min="${params.startDate}" max="${new java.text.SimpleDateFormat('yyyy-MM-dd').format(new Date())}" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="facility">
                        Health Facility
                    </label>
                    <g:select name="facility" id="facility" class="form-control select2" value="${params.facility}" from="${facilities}" noSelection="['':'None specific']" />
                </div>
                <div class="form-group">
                    <g:submitButton class="btn btn-primary" name="submit" value="Submit" />
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