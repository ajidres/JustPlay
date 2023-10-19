import 'package:flutter/material.dart';

extension ScreenAnimationExtention on Widget{
  Route scaleTransition() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,) => this,

        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,) =>
            ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn,
                ),
              ),
              child: child,
            )
    );
  }

}