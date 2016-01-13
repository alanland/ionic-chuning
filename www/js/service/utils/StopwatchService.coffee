angular.module("app.utils.stopwatch", []).

constant("SW_DELAI", 20).

factory("stopwatch", (SW_DELAI, $interval) ->
    target = 4000
    data = {
        value: target
        laps: []
        running: false
    }
    callback = ->
        console.log data.value
    onFinish = ->
        console.log 'finish'


    running = ->
        angular.isDefined stopwatch

    stopwatch = undefined
    start = ->
        if angular.isDefined(stopwatch)
            return
        stopwatch = $interval(->
            if data.value > 0
                data.value -= SW_DELAI
                callback.apply @
                data.running = true
            else
                data.value = 0
                onFinish.apply @
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
    restart: ->
        reset()
        start()
    lap: lap
    getTarget: ->
        target
    setTarget: (t)->
        target = t
    setCallback: (c)->
        callback = c
    setFinishCallback: (c)->
        onFinish = c
    getCount: (delay)-> # 获取开始之后有多少次数
        parseInt ((target - data.value) / delay)
)













