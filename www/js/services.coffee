angular.module('app.services', [
    'app.service.ProjectsService'
    'app.utils.stopwatch'
])

.factory('BlackFactory', ->
)

.service('BlankService', ->
)
.factory('Camera', ['$q', ($q)->
    getPicture: (options)->
        q = $q.defer()
        navigator.camera.getPicture((result)->
            q.resolve(result)
        , (err)->
            q.reject(err)
        , options)

        return q.promise
])
