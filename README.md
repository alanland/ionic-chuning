# ionic-todo-app
Ionic todo app

# cmd
```
sudo npm install -g cordova ionic gulp
cordova plugin add org.apache.cordova.camera
ionic plugin add cordova-plugin-geolocation
cordova plugin add cordova-plugin-geolocation

ionic server
ionic run
ionic emulate android
ionic build

npm install -g bower
npm install -g cordova ionic
bower install ngCordova --save

ionic run android -l 
ionic run android -l -c

 // cordova plugin add cordova-plugin-device-motion
cordova plugin add org.apache.cordova.device-motion
cordova plugin add cordova-plugin-whitelist

adb devices
adb -d install platforms/android/build/outputs/apk/android-debug.apk

ionic build & \
adb -s 4TGETWCM75EQA6MV uninstall com.ionicframework.todo623409 & \
adb -s 4TGETWCM75EQA6MV install platforms/android/build/outputs/apk/android-debug.apk 

cordova plugin add https://github.com/litehelpers/Cordova-sqlite-storage.git

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