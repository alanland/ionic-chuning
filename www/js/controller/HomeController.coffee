angular.module('app.controller.home', [
    'ngCordova',
])

.controller('homeCtrl', ($ionicPlatform, $rootScope, $scope, $state, $http, $timeout, $ionicModal,
    $ionicSideMenuDelegate, $ionicListDelegate, ProjectsService, Camera) ->
    $scope.projects = [
        {
            title: '冲拳',
            key: 'demo',
            setting:
                stopwatch:
                    persecond: 250
            target:
                count: 10000
                groups: 20
                pergroup: 5
        }
        {
            title: 'Demo',
            key: 'demo',
            setting:
                stopwatch:
                    target: 120 * 1000
                    persecond: 250
        }
    ]

    $scope.startTraining = (project)->
        $rootScope.project = project
        $state.go project.key
)


.controller('demoController', ($scope, $rootScope, $state, stopwatch, ChuningService)->
    chuning = ChuningService
    $scope.config = config = $rootScope.project?.setting
    $scope.project = project = $rootScope.project
    $scope.stopwatch = stopwatch
    $scope.running = stopwatch.running
    $scope.current = 0

    today = chuning.getToday()

    projectValue = ->
        today[$scope.project.key]?.value || {
            value: 0
        }

    value = projectValue()

    addProjectValue = (toAdd)->
        v = projectValue()
        if !angular.isUndefined(v.value)
            v.value = parseInt(v.value) + parseInt(toAdd)
        else
            v.value = 0
        value = v
    saveProject = ->
        $scope.project.value = value
        chuning.saveProject($scope.project)

    getCount = ->
        stopwatch.getCount(config.stopwatch.persecond || 1000)


    initTraining = (project)->
        if config?.stopwatch
            initStopwatch()
    initStopwatch = ->
        if project.target.pergroup
            stopwatch.setTarget parseInt(project.target.pergroup / (1000 / config.stopwatch.persecond) * 1000)
        else
            stopwatch.setTarget config.stopwatch.target
        stopwatch.setCallback(->
            $scope.current = getCount()
        )
        stopwatch.setFinishCallback(->
            addProjectValue getCount()
            saveProject()
        )
        stopwatch.reset()
        stopwatch.start()
    initTraining()

    $scope.goHome = ->
        $state.go 'home'
)
