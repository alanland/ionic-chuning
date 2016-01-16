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
                pergroup: 500
        }
        {
            title: '打牌',
            key: 'dapai',
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

.controller('dapaiCtrl', ($state, $scope, $localstorage)->
    storageKey = 'dapai'
    persons = $localstorage.getList(storageKey)
    if persons && persons.length > 0
        $scope.persons = persons
    else
        $scope.persons = [
            {
                name: '李林',
                value: 0
            },
            {
                name: '郑忠',
                value: 0
            },
            {
                name: '小智',
                value: 0
            }
        ]
    updateStorage = ->
        $localstorage.setObject(storageKey, $scope.persons)

    $scope.add = (person)->
        for p in $scope.persons
            if p.name == person.name
                p.value = p.value + 1
        updateStorage()
    $scope.subtract = (person)->
        for p in $scope.persons
            if p.name == person.name
                p.value = p.value - 1
        updateStorage()
    $scope.goHome = ->
        $state.go 'home'
)


.controller('demoController', ($scope, $rootScope, $state, $cordovaNativeAudio, stopwatch, ChuningService)->
    chuning = ChuningService
    $scope.config = config = $rootScope.project?.setting
    $scope.project = project = $rootScope.project
    $scope.stopwatch = stopwatch
    $scope.running = stopwatch.running
    $scope.current = 0
    $scope.currentAll = 0

    today = chuning.getToday()

    projectValue = ->
        today[$scope.project.key]?.value || {
            value: 0
        }

    value = projectValue()

    updateCurrentAll = ->
        $scope.currentAll = projectValue().value
    updateCurrentAll()

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
            updateCurrentAll()
        )
        stopwatch.restart()
    initTraining()

    $scope.goHome = ->
        $state.go 'home'


    document.addEventListener('deviceready', ->
        $cordovaNativeAudio.preloadSimple('click', 'audio/click.mp3').then(
            (msg)->
                console.log msg
                $cordovaNativeAudio.play(msg)
                $cordovaNativeAudio.play(msg)
                $cordovaNativeAudio.play(msg)
            (error)->
                console.log error
        )
        $cordovaNativeAudio.preloadSimple('snare', 'audio/snare.mp3');
        $cordovaNativeAudio.preloadSimple('hi-hat', 'audio/highhat.mp3');
        $cordovaNativeAudio.preloadSimple('bass', 'audio/bass.mp3');
        $cordovaNativeAudio.preloadSimple('bongo', 'audio/bongo.mp3');
    )
)
