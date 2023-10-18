import 'package:flutter/material.dart';
import 'package:justplay/ui/home_page.dart';
import 'package:justplay/ui/login_page.dart';
import 'package:justplay/ui/splash_page.dart';
import 'extentions/routes_extentions.dart';
import 'style/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JustPlay",
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const SplashPage(),
      routes: {
        Routes.homePage.key: (context) => const HomePage(),
        Routes.loginPage.key: (context) => const LoginPage()
      },
    );
  }

}