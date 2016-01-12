#!/usr/bin/env bash


ionic build
adb -s 4TGETWCM75EQA6MV uninstall com.github.alanland.chuning
adb -s 4TGETWCM75EQA6MV install platforms/android/build/outputs/apk/android-debug.apk
