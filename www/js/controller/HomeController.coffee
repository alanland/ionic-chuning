angular.module('app.controller.home', [
    'ngCordova',
])

.controller('homeCtrl', ($ionicPlatform, $rootScope, $scope, $state, $http, $timeout, $ionicModal,
    $ionicSideMenuDelegate, $ionicListDelegate, ProjectsService, Camera) ->
    $scope.projects = [
        {title: 'Demo', key: 'demo', setting: {stopwatch: true}},
        {title: 'Demo', key: 'demo', setting: {stopwatch: {}}},
        {title: 'Demo', key: 'demo', setting: {}}
    ]

    $scope.startTraining = (project)->
        $rootScope.project = project
        $state.go project.key
)


.controller('demoController', ($scope, $rootScope, $state, stopwatch)->
    $scope.config = $rootScope.project?.setting
    console.log $scope.config
    $scope.stopwatch = stopwatch
    $scope.running = stopwatch.running

    $scope.goHome = ->
        $state.go 'home'
)
