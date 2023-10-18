import 'package:flutter/material.dart';
import 'package:justplay/extentions/animation_screen_extensions.dart';
import '../features/home/home_page.dart';
import '../features/login/login_page.dart';

enum Routes {
  loginPage,
  homePage,
}

extension RoutesExtention on Routes {
  String get key {
    switch (this) {
      case Routes.homePage:
        return '/home_page.dart';
      case Routes.loginPage:
        return '/login_page.dart';
    }
  }

  navigate(BuildContext context) {
    switch (this) {
      case Routes.homePage:
        return Navigator.of(context).pushReplacementNamed(key);
      case Routes.loginPage:
        return Navigator.of(context).pushReplacement(const LoginPage().scaleTransition());
    }
  }
}

Map<String, WidgetBuilder> routesList() =>
    {Routes.homePage.key: (context) => const HomePage(),
      Routes.loginPage.key: (context) => const LoginPage()};
