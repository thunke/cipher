"use strict"

angular.module('cipher').directive 'distChart', (Utils) ->
    restrict: 'EA'
    scope:
        chartData: "="
    template: '<div></div>'
    link: ($scope, $element) ->
        $scope.chart = new Highcharts.Chart
            chart:
              renderTo: $element[0]
              type: 'column'
            credits:
                enabled: false
            title: null
            xAxis:
                categories: []
                title:
                    text: 'Letter'
            yAxis:
                min: 0
                title:
                    text: 'Occurances'
            series: [{
                    name: "Typical distribution of the English Language"
                    data: []
                }, {
                    name: "Distribution within the cipher text"
                    data: []
                }, {
                    name: "Distribution within the clear text"
                    data: []
                }]

        $scope.$watch('chartData', (newVal) ->
            if newVal
                $scope.chart.xAxis[0].setCategories(newVal.categories, false)
                _.each(newVal.series, (series, index) ->
                    $scope.chart.series[index].setData(series, false)
                ) 
                $scope.chart.redraw();
        )

        return
