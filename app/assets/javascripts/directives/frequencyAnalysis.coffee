"use strict"

angular.module('cipher').directive('frequencyAnalysis', ['Utils', (Utils) ->
    restrict: 'EA'
    scope:
        valuePairs: "="
    templateUrl: '/assets/directives/frequencyAnalysis.html'
    link: ($scope, $element) ->

        standardDist =  _.sortBy(Utils.standardDist, (pair) -> -pair.count)

        standardSum = _.reduce(standardDist, (total, pair) ->
            total + pair.count
        , 0)

        $scope.$watch('valuePairs', (newVal) ->
            if newVal
                cipherSum = _.reduce(newVal, (total, pair) ->
                    total + pair.count
                , 0)

                newVal = _.map(newVal, (pair) ->
                    cipherVal: pair.cipherVal
                    clearVal: pair.clearVal.toUpperCase(),
                    count: pair.count
                )

                series = [[],[],[]]
                _.each(standardDist, (pair) -> 
                    series[0].push(Math.round(pair.count*cipherSum / standardSum))

                    cipherVals = _.where(newVal, { cipherVal: pair.letter })
                    if cipherVals 
                        series[1].push(_.reduce(cipherVals, (t, v) ->
                            t + v.count
                        , 0))
                     else
                        series[1].push(0)


                    clearVals = _.where(newVal, { clearVal: pair.letter })
                    if clearVals 
                        series[2].push(_.reduce(clearVals, (t, v) ->
                            t + v.count
                        , 0))
                     else
                        series[2].push(0)
                )

                $scope.standardDistChartData =
                    categories: _.map(standardDist, (pair) -> pair.letter)
                    series: series
            return
        , true)

        return
])
