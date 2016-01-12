angular.module('app.controllers.stopwatch', [
    'ngCordova'
])

.controller('stopwatchCtrl', ($scope, stopwatch)->
    $scope.stopwatch = stopwatch
    $scope.running = stopwatch.running
)