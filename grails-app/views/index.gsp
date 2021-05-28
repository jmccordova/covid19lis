<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>UPM-NIH Covid-19 LIS</title>
    </head>
    <body class="c-app">
        <g:set var="statisticsService" bean="statisticsService"/>
        <g:set var="globalStats" value="${statisticsService?.getGlobalSpecimenResults()}" />
        <g:set var="globalTotal" value="${globalStats?.positive + globalStats?.negative + globalStats?.equivocal + globalStats?.invalid}" />
        <div class="row" role="main">
            <div class="col-sm-3">
                <div class="card text-white bg-danger">
                    <div class="card-body card-body pb-0 d-flex justify-content-between align-items-start">
                        <div>
                            <div class="text-value-lg">${(globalStats?.positive / globalTotal) * 100}%</div>
                            <div class="text-value-sm">${globalStats?.positive} of ${globalTotal}</div>
                            <div>Positive</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="card text-white bg-success">
                    <div class="card-body card-body pb-0 d-flex justify-content-between align-items-start">
                        <div>
                            <div class="text-value-lg">${(globalStats?.negative / globalTotal) * 100}%</div>
                            <div class="text-value-sm">${globalStats?.negative} of ${globalTotal}</div>
                            <div>Negative</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="card text-white bg-warning">
                    <div class="card-body card-body pb-0 d-flex justify-content-between align-items-start">
                        <div>
                            <div class="text-value-lg">${(globalStats?.equivocal / globalTotal) * 100}%</div>
                            <div class="text-value-sm">${globalStats?.equivocal} of ${globalTotal}</div>
                            <div>Equivocal</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="card text-white bg-info">
                    <div class="card-body card-body pb-0 d-flex justify-content-between align-items-start">
                        <div>
                            <div class="text-value-lg">${(globalStats?.invalid / globalTotal) * 100}%</div>
                            <div class="text-value-sm">${globalStats?.invalid} of ${globalTotal}</div>
                            <div>Invalid</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
