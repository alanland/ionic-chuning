angular.module('ionic.utils', [])

.factory('$localstorage', ['$window', ($window)->
    set: (key, value)->
        $window.localStorage[key] = value
    get: (key, defaultValue)->
        $window.localStorage[key] || defaultValue
    setObject: (key, value)->
        $window.localStorage[key] = JSON.stringify(value)
    getObject: (key)->
        JSON.parse($window.localStorage[key] || '{}')
    getList: (key)->
        JSON.parse($window.localStorage[key] || '[]')
])


.factory('tdTimer', ($scope, $timeout)->
    stopFlag = true
    stop: ->
        stopFlag = true
    start: ->
        stopFlag = false
)

# todo
.factory('tdClock', ($scope, $timeout)->
    $scope.clock = 'loading clock...'
    $scope.tickInterval = 1000

    tick = ->
        $scope.clock = Date.now()
        $timeout tick, $scope.tickInterval

    $timeout tick, $scope.tickInterval
)









