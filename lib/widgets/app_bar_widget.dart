
import 'package:flutter/material.dart';

import '../style/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize{

  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColorPalette.primary,
      elevation: 8,
      title: Text(title),
    );
  }


}