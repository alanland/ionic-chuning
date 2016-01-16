angular.module('app.routes', [])

.config(($stateProvider, $urlRouterProvider)->
    $urlRouterProvider.otherwise('/')

    $stateProvider
    .state('home', {
        url: '/',
        templateUrl: 'templates/home.html',
        controller: 'homeCtrl'
    })

    .state('demo', {
        url: '/demo',
        templateUrl: 'templates/demo.html',
        controller: 'demoController'
    })

    .state('menu', {
        url: '/menu',
        abstract: true,
        templateUrl: 'templates/menu.html'
    })

    .state('signup', {
        url: '/signup',
        templateUrl: 'templates/signup.html',
        controller: 'signupCtrl'
    })

    .state('newTask', {
        url: '/newTask',
        templateUrl: 'templates/newTask.html',
        controller: 'newTaskCtrl'
    })

    .state('deviceMotionTest', {
        url: '/deviceMotionTest',
        templateUrl: 'templates/deviceMotionTest.html',
        controller: 'deviceMotionTestCtrl'
    })

    .state('clock', {
        url: '/clock',
        templateUrl: 'templates/clock.html',
        controller: 'clockCtrl'
    })

    .state('stopwatch', {
        url: '/stopwatch',
        templateUrl: 'templates/stopwatch.html',
        controller: 'stopwatchCtrl'
    })

    .state('dapai', {
        url: '/dapai',
        templateUrl: 'templates/dapai.html',
        controller: 'dapaiCtrl'
    })
)
