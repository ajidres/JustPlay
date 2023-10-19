import 'package:flutter/material.dart';
import 'package:justplay/style/themes.dart';

import '../style/colors.dart';

class ButtonMainWidget extends StatelessWidget {
  const ButtonMainWidget({Key? key, this.label = "", this.onPressed}) : super(key: key);

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: getButtonStyle(),
        child: label.setTextThemeButton(context),
      ),
    );
  }
}
