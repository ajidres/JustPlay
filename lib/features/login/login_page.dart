import 'package:flutter/material.dart';
import 'package:justplay/style/colors.dart';

import '../../extentions/image_extentions.dart';
import '../../widgets/text_input_form_widget.dart';
import 'widget/form_login_widget.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.icon.key,
              height: 160,
            ),
            const FormLoginWidget(),
          ],
        ),
      ),
    );
  }
}


