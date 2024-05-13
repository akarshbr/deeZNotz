import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/presentation/home/controller/note_controller.dart';
import 'package:deeznotz/presentation/home/controller/settings_controller.dart';
import 'package:deeznotz/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteController()),
        ChangeNotifierProvider(create: (context) => SettingsController())
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: _buildDeezNotzLightTheme(),
      ),
    );
  }
}
ThemeData _buildDeezNotzLightTheme(){
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(scaffoldBackgroundColor: DeezNotzColors.blue50,
    textTheme: _buildDeezNotzTextTheme(base.textTheme)
  );
}

TextTheme _buildDeezNotzTextTheme(TextTheme base) {
  return base.copyWith(
    headlineSmall: base.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
    titleLarge: base.titleLarge!.copyWith(fontSize: 20,fontWeight: FontWeight.w900),
    bodySmall: base.bodySmall!.copyWith(fontWeight: FontWeight.w400,fontSize: 15),
    bodyLarge: base.bodyLarge!.copyWith(fontWeight: FontWeight.w500,fontSize: 17)
  ).apply(fontFamily: "WorkSans");
}
