import 'dart:async';

import 'package:flutter/material.dart';
import 'package:justplay/extentions/image_extentions.dart';
import 'package:justplay/style/themes.dart';

import '../extentions/routes_extentions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController motionController;
  late Animation motionAnimation;
  double size = 5;

  @override
  void initState() {
    super.initState();
    _setAnimation();
    _setTimerToHome();
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.icon.key,
          height: size,
        ),
      ),
    );
  }

  void _setAnimation() {
    motionController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
      lowerBound: 0.5,
    );

    motionAnimation = CurvedAnimation(
      parent: motionController,
      curve: Curves.ease,
    );

    motionController.forward();
    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });

    motionController.addListener(() {
      setState(() {
        size = motionController.value * 250;
      });
    });
  }

  void _setTimerToHome() {
    Timer(
      const Duration(seconds: 2),
      () => Routes.loginPage.navigate(context),
    );
  }
}
