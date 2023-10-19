import 'package:flutter/material.dart';
import 'extentions/routes_extentions.dart';
import 'features/splash_page.dart';
import 'style/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JustPlay',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const SplashPage(),
      routes: routesList(),
    );
  }

}