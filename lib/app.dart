import 'package:flutter/material.dart';
import 'features/home_screen.dart';
import 'style/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JustPlay",
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: const HomeScreen(),
      // routes: {
      //   RoutesConstant.tennisCourt.key: (context) => const ReservationScreen()
      // },
    );
  }

}