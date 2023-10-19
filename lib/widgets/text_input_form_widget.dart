import 'package:flutter/material.dart';
import 'package:justplay/style/colors.dart';
import 'package:justplay/style/themes.dart';

class FormTextInputWidget extends StatefulWidget {
  const FormTextInputWidget({
    Key? key,
    this.hint,
    this.label = "",
    this.validator,
    this.controller,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.keyboardType,
    this.initialValue,
  }) : super(key: key);

  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode autoValidateMode;
  final TextInputType? keyboardType;
  final String? initialValue;

  @override
  State<FormTextInputWidget> createState() => _FormTextInputWidgetState();
}

class _FormTextInputWidgetState extends State<FormTextInputWidget> {

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label.setTextThemeMedium(context),
        const SizedBox(height: 8),
        TextFormField(
          decoration: setDecoration(),
          obscureText: (widget.keyboardType != TextInputType.visiblePassword)? _passwordVisible:!_passwordVisible,
          style: const TextStyle().textThemeMedium(context),
          validator: widget.validator,
          controller: widget.controller,
          autovalidateMode: widget.autoValidateMode,
          keyboardType: widget.keyboardType,
          initialValue: widget.initialValue,
        )
      ],
    );
  }

  InputDecoration setDecoration() {
    return (widget.keyboardType != TextInputType.visiblePassword)
        ? getInputDecorator(context, hint: widget.hint)
        : getInputDecorator(context, hint: widget.hint).copyWith(
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: AppColorPalette.primary,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          );
  }
}
