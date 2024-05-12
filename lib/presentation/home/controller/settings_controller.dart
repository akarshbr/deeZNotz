import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends ChangeNotifier{
  late SharedPreferences sharedPreferences;

  saveViewPreference(bool isGridView) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isGridView', isGridView);
  }

}