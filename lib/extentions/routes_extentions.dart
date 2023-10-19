import 'package:flutter/material.dart';
import 'package:justplay/extentions/animation_screen_extensions.dart';
import 'package:justplay/features/games_by_city_page.dart';
import '../features/home/home_page.dart';
import '../features/login/login_page.dart';

enum Routes { loginPage, homePage, gamesByCity }

extension RoutesExtention on Routes {
  String get key {
    switch (this) {
      case Routes.homePage:
        return '/home_page';
      case Routes.loginPage:
        return '/login_page';
      case Routes.gamesByCity:
        return '/games_by_city_page';
    }
  }

  navigate(BuildContext context, {dynamic argument}) {
    switch (this) {
      case Routes.loginPage:
        return Navigator.of(context).pushReplacement(const LoginPage().scaleTransition());
      case Routes.gamesByCity:
        return Navigator.of(context).pushNamed(key, arguments: argument);
      default:
        return Navigator.of(context).pushReplacementNamed(key);
    }
  }
}

Map<String, WidgetBuilder> routesList() =>
    {Routes.homePage.key: (context) => const HomePage(),
      Routes.loginPage.key: (context) => const LoginPage(),
      Routes.gamesByCity.key: (context) => const GameByCityPage()};
