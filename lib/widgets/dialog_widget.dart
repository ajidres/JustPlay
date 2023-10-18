// Flutter imports:
import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../style/themes.dart';
import 'button_main_widget.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {Key? key,
      this.txtTitle = '',
      this.txtMessage = '',
      this.textBtnAccept = 'Accept',
      this.textBtnCancel = 'Cancel',
      this.showCancelButton = true})
      : super(key: key);

  final String txtTitle;
  final String txtMessage;
  final String textBtnAccept;
  final String textBtnCancel;

  final bool showCancelButton;

  final double latMargin = 12.0;
  final double topMargin = 20.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8,
      child: _dialogContent(context),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: getDialogStyle(),
          child: Padding(
            padding: EdgeInsets.only(top: topMargin, right: latMargin, left: latMargin),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _titleText(context),
                _messageText(context),
              ],
            ),
          ),
        ),
        _buttons(context),
      ],
    );
  }

  Widget _titleText(BuildContext context) {
    return Visibility(visible: txtTitle.isNotEmpty, child: txtTitle.setTextTitleThemeSmall(context));
  }

  Widget _messageText(BuildContext context) {
    return Visibility(
        visible: txtMessage.isNotEmpty,
        child: Padding(
          padding: EdgeInsets.only(top: topMargin, bottom: topMargin),
          child: txtMessage.setTextThemeMedium(context),
        ));
  }

  Widget _buttons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Visibility(
          visible: showCancelButton,
          child: Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop(false);
              },
              child: _buttonSingle(context, textBtnCancel),
            ),
          ),
        ),

        Visibility(
          visible: showCancelButton,
          child: SizedBox(width: 1, child: Container(color: Colors.white,),),
        ),

        Expanded(
            child:GestureDetector(
              onTap: (){
                Navigator.of(context).pop(true);
              },
              child: _buttonSingle(context, textBtnAccept),
            )
        ),
      ],
    );
  }

  Widget _buttonSingle(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColorPalette.secondary,
      child: Center(child: title.setTextThemeButton(context),),
    );
  }
}
