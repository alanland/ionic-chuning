# ionic-todo-app
Ionic todo app

# cmd

- 环境
```
npm install -g cordova ionic gulp bower
bower install ngCordova --save
```

- 声音插件

```
--cordova plugin add cordova-plugin-nativeaudio
cordova plugin add https://github.com/SidneyS/cordova-plugin-nativeaudio.git
```

- 其他插件　
```
ionic plugin add cordova-plugin-geolocation
cordova plugin add org.apache.cordova.camera
cordova plugin add cordova-plugin-geolocation
cordova plugin add cordova-plugin-device-motion
cordova plugin add org.apache.cordova.device-motion
cordova plugin add cordova-plugin-whitelist
cordova plugin add https://github.com/litehelpers/Cordova-sqlite-storage.git
```

- ionic 命令
```
ionic server
ionic run
ionic emulate android
ionic build
ionic run android -l  #　模拟器
ionic run android -l -c
```

- gulp
```
cd www
gulp
```

- adb 命令
```
adb devices
adb -d install platforms/android/build/outputs/apk/android-debug.apk
```

- adb安装到手机
```
ionic build 
adb -s 4TGETWCM75EQA6MV uninstall com.ionicframework.todo623409 
adb -s 4TGETWCM75EQA6MV install platforms/android/build/outputs/apk/android-debug.apk 
```

# some work

## icon & splash
Show how to update icon and splash pictures.

## route
Show how to use router in ionic.

## http
Use of http to communicate with server.

## ng-cordova
Show how to use ng-cordova.

### org.apache.cordova.camera

### cordova-plugin-device-motion

### cordova-plugin-geolocation

### Cordova-sqlite-storage

## separate template file

## functions
### left swip to finish task
### right swip show delete options
### tap to rerange / delete tasks
### use adb do debug in android device

# todo list
- js的打包发布