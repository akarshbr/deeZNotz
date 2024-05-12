import 'package:deeznotz/repository/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>("notes");
  runApp(const MyApp());
}
