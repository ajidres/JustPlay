import 'package:flutter/material.dart';
import 'package:justplay/style/themes.dart';
import 'package:justplay/widgets/button_main_widget.dart';
import 'package:justplay/widgets/dialog_widget.dart';

import '../../../extentions/routes_extentions.dart';
import '../../../widgets/text_input_form_widget.dart';


const constUser = "JOGABONITO";
const constPassword = "JOGABONITO!123";

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  bool _btnEnable = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputUser = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () => setState(() {
          _validateUser(_inputUser.value.text) && _validatePassword(_inputPassword.value.text)
              ? _btnEnable = true
              : _btnEnable = false;
        }),
        child: Column(
          children: [
            FormTextInputWidget(
              label: 'User',
              hint: 'Please enter your user',
              keyboardType: TextInputType.text,
              controller: _inputUser,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                return _validateUser(_inputUser.value.text) || _inputUser.value.text.isEmpty ? null:'Error, please enter a valid user';
              },
            ),
            _separator(),
            FormTextInputWidget(
              label: 'Password',
              hint: 'Please enter your password',
              keyboardType: TextInputType.visiblePassword,
              controller: _inputPassword,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                return _validatePassword(_inputPassword.value.text) || _inputPassword.value.text.isEmpty ? null:'Error, please enter a valid password';
              },
            ),
            _separator(),
            ButtonMainWidget(
              label: 'Continue',
              onPressed: () {
                if (_btnEnable && _validateLogin(_inputUser.value.text,_inputPassword.value.text)) {
                  Routes.homePage.navigate(context);
                }else{
                  showError();
                }
              },
            )

          ],
        ),
      ),
    );
  }

  void showError(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DialogWidget(
            txtTitle: 'Error',
            txtMessage: 'Invalid credentials',
            showCancelButton: false,
          );
        });
  }
}

Widget _separator(){
  return const SizedBox(height: 20);
}

bool _validateLogin(String user, String password) {
  return user==constUser && password==constPassword;
}

bool _validateUser(String data) {
  return data.isNotEmpty && data.length > 5;
}

bool _validatePassword(String data) {
  return data.isNotEmpty && data.length > 7;
}
