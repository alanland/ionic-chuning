angular.module('app.controller.home', [
    'ngCordova',
])

.controller('homeCtrl', ($ionicPlatform, $rootScope, $scope, $state, $http, $timeout, $ionicModal,
    $ionicSideMenuDelegate, $ionicListDelegate, ProjectsService, Camera) ->
    $scope.projects = [
        {
            title: 'Demo',
            key: 'demo',
            setting:
                stopwatch:
                    target: 20 * 1000
                    persecond: 4
        }
        {
            title: 'Demo',
            key: 'demo',
            setting:
                stopwatch:
                    target: 120 * 1000
                    persecond: 4
        }
    ]

    $scope.startTraining = (project)->
        $rootScope.project = project
        $state.go project.key
)


.controller('demoController', ($scope, $rootScope, $state, stopwatch)->
    $scope.config = config = $rootScope.project?.setting
    $scope.stopwatch = stopwatch
    $scope.running = stopwatch.running
    $scope.current = 0

    initTraining = (project)->
        if config?.stopwatch
            stopwatch.setTarget config.stopwatch.target
            stopwatch.setCallback( ->
                $scope.current = stopwatch.getCount(250)
            )
            stopwatch.reset()
    initTraining()

    $scope.goHome = ->
        $state.go 'home'
)
