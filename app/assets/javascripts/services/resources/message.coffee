"use strict"

angular.module('cipher').factory 'Message', ($resource) ->
    factory = $resource("/api/messages/:id.json", {id: "@id"}, {update: {method: 'PUT'}})
