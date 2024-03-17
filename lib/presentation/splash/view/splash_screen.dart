import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:deeznotz/core/constants/colors.dart';
import 'package:deeznotz/core/constants/style.dart';
import 'package:deeznotz/presentation/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.bgColorLight,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("deeZ", style: StyleVariables.splashTextStyleLight),
            AnimatedTextKit(animatedTexts: [
              TyperAnimatedText("Notz",
                  speed: const Duration(milliseconds: 450), textStyle: StyleVariables.splashTextStyleLight)
            ])
          ],
        ),
      ),
    );
  }
}
