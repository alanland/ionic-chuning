angular.module('app.controller.testMotion', [
    'ngCordova'
])


.controller('deviceMotionTestCtrl', ($scope, $state, $cordovaDeviceMotion, $cordovaGeolocation)->
    $scope.motion = {}
    $scope.position = {}

    $scope.goHome = ->
        $state.go 'home'

    options = frequency: 200
    document.addEventListener('deviceready', ->
        watch = $cordovaDeviceMotion.watchAcceleration(options)
        watch.then(
            null
            (err)->
                return
            (result)->
                console.log result
                $scope.motion = result
        )
        #        watch.clearWatch()
        # OR
        #        $cordovaDeviceMotion.clearWatch(watch).then(
        #            (result)->
        #                return
        #            (err)->
        #                return
        #        )


        #
        # geo
        #
        posOptions = timeout: 5000, enableHighAccuracy: true
        $cordovaGeolocation.getCurrentPosition(posOptions).then(
            (position)->
                lat = position.coords.latitude
                long = position.coords.longitude
                $scope.position = {lat: lat, long: long}
            (err)->
                console.log err
        )

        watchOptions = timeout: 2000, enableHighAccuracy: true
        watch = $cordovaGeolocation.watchPosition(watchOptions)
        watch.then(
            null,
            (err)->
                return
            (position)->
                lat = position.coords.latitude
                long = position.coords.longitude
                $scope.position = {lat: lat, long: long}
        )
#       watch.clearWatch()
# OR
#        $cordovaGeolocation.clearWatch(watch).then(
#            (result)->
#                return
#            (err)->
#                return
#        )
    )
)