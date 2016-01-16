#!/usr/bin/env bash


ionic build
# -k remain user data
adb -s 4TGETWCM75EQA6MV shell pm uninstall -k com.github.alanland.chuning
adb -s 4TGETWCM75EQA6MV install platforms/android/build/outputs/apk/android-debug.apk
