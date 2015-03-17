"use strict"

angular.module('cipher').factory('Message', ['$resource', ($resource) ->
    factory = $resource("/api/messages/:id.json",
        { id: "@id" },
        { 'solve': { method: 'GET', isArray: false, url: '/api/messages/:id/solution.json' }}
    )
])
