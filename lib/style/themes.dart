import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData appTheme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColorPalette.colorScaffold,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColorPalette.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 8,
        color: AppColorPalette.primary,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.black, fontSize: 20.0),
          bodySmall: TextStyle(color: Colors.black, fontSize: 12.0)));
}




