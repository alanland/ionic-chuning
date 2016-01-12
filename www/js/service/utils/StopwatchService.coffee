angular.module("app.utils.stopwatch", []).

constant("SW_DELAI", 20).

factory("stopwatch", (SW_DELAI, $interval) ->
    target = 4000
    data = {
        value: target
        laps: []
        running: false
    }

    running = ->
        angular.isDefined stopwatch

    stopwatch = undefined
    start = ->
        console.log running
        if angular.isDefined(stopwatch)
            return
        stopwatch = $interval(->
            if data.value > 0
                data.value -= SW_DELAI
                data.running = true
            else
                data.value = 0
                stop()
        , SW_DELAI)

    stop = ->
        if angular.isDefined stopwatch
            $interval.cancel stopwatch
            stopwatch = undefined
            data.running = false

    reset = ->
        stop()
        data.value = target
        data.laps = []

    lap = ->
        data.laps.push data.value if running()

    data: data
    start: start
    stop: stop
    reset: reset
    lap: lap
)













