"use strict"

# Mustache-style templates
_.templateSettings =
    interpolate: /\{\{(.+?)\}\}/g


app = angular.module 'app', ['cipher', 'ngRoute', 'ngResource']

app.config ($locationProvider, $routeProvider, $httpProvider) ->
    $locationProvider.html5Mode(true).hashPrefix('!')

    $routeProvider.when '/', {
        controller: 'homeCtrl',
        templateUrl: '/assets/home.html'
    }

    $routeProvider.when '/:id', {
        controller: 'homeCtrl',
        templateUrl: '/assets/home.html'
    }


app.config ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

jQuery ->
    angular.bootstrap(document, ['app'])
