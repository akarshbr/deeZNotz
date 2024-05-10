import 'package:deeznotz/presentation/home/controller/note_controller.dart';
import 'package:deeznotz/presentation/home/controller/settings_controller.dart';
import 'package:deeznotz/presentation/splash/view/splash_screen.dart';
import 'package:deeznotz/repository/model/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>("notes");
  await Hive.openBox("Settings");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => NoteController()),
    ChangeNotifierProvider(create: (context) => SettingsController())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
