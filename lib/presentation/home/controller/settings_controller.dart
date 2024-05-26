import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ChangeNotifier {
  late SharedPreferences sharedPreferences;
  bool? isAppLockOn;

  setAppLock() {}
  Future<void> startFunction() async {
    await checkAppLockOn();
  }

  checkAppLockOn() async {
    log("SettingsController -> checkAppLockOn()");
    sharedPreferences = await SharedPreferences.getInstance();
    isAppLockOn = sharedPreferences.getBool("isAppLock") ?? false;
    log("app lock -> $isAppLockOn");
  }

  toggleAppLock(bool isAppLock) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isAppLock', isAppLock);
  }
}
