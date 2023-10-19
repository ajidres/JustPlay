import 'package:flutter/material.dart';

import '../style/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final String title;

  final bool showBack;

  const AppBarWidget({super.key, required this.title, this.showBack = false});

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
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
    );
  }
}
