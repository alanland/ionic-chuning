angular.module('app.controllers.clock', [
    'ngCordova'
])

.controller('clockCtrl', ($scope, $interval)->
    $scope.clock = '...'
    $scope.tickInterval = 19

    $interval ->
        $scope.clock = Date.now()
    , $scope.tickInterval
)