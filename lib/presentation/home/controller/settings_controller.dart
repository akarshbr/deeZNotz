import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ChangeNotifier{
  var settings = Hive.box("Settings");
  bool isGridView = true;
  loadViewPreference() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    isGridView = (sharedPreferences.getBool('isGridView') ?? true);
  }
  saveViewPreference(bool isGridView) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isGridView', isGridView);
  }
  toggle(){
    isGridView = !isGridView;
    saveViewPreference(isGridView);
    notifyListeners();
  }

}