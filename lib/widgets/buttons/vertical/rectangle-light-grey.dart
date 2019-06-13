import 'package:Calculator/Classes/ThemeColors.dart';
import 'package:Calculator/widgets/button.dart';
import 'package:Calculator/Classes/ButtonType.dart';
import 'package:flutter/material.dart';

class RectangleLightGreyButton extends StatelessWidget {

  final onPressed;

  final content;

  final Alignment alignment;

  final EdgeInsets margin;

  final String type;

  RectangleLightGreyButton({@required this.margin,@required this.alignment,@required this.content, @required this.onPressed,@required this.type});

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    if(this.type == ButtonType.icon){
      return new Button.rectangle(
        context: context,
        onPressed: this.onPressed,
        margin: this.margin,
        color: ThemeColors.getLightGrey(),
        alignment: this.alignment,
        content: Icon(
          this.content,
          color: ThemeColors.getBtnFontColor(),
          size: _screenSize.height * 0.02,
        ),
        radius: BorderRadius.all(Radius.circular(50)),
      );
    }

    if(this.type == ButtonType.text){
      return new Button.rectangle(
        context: context,
        onPressed: this.onPressed,
        margin: this.margin,
        color: ThemeColors.getLightGrey(),
        alignment: this.alignment,
        content: Text(this.content,
            style: TextStyle(
                fontSize: _screenSize.height * 0.03,
                fontWeight: FontWeight.bold,
                color: ThemeColors.getBtnFontColor())),
        radius: BorderRadius.all(Radius.circular(50)),
      );
    }
  }
}
