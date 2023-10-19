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

  double minAnimationChange = 0.5;
  double sizeImage = 5;
  int sizeImageChange = 250;
  int animationTime = 500;
  int timerTime = 2;

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
          height: sizeImage,
        ),
      ),
    );
  }

  void _setAnimation() {
    motionController = AnimationController(
      duration: Duration(milliseconds: animationTime),
      vsync: this,
      lowerBound: minAnimationChange,
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
        sizeImage = motionController.value * sizeImageChange;
      });
    });
  }

  void _setTimerToHome() {
    Timer(
      Duration(seconds: timerTime),
      () => Routes.loginPage.navigate(context),
    );
  }
}
