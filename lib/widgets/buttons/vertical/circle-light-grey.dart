import 'package:Calculator/Classes/ThemeColors.dart';
import 'package:Calculator/widgets/button.dart';
import 'package:Calculator/Classes/ButtonType.dart';
import 'package:flutter/material.dart';

class CircleLightGreyButton extends StatelessWidget {

  final onPressed;

  final content;

  final String type;

  CircleLightGreyButton({@required this.content, @required this.onPressed,@required this.type});

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    if(this.type == ButtonType.icon){
      return new Button.circle(
          context: context,
          onPressed: this.onPressed,
          color: ThemeColors.getLightGrey(),
          content: Icon(
            this.content,
            color: ThemeColors.getBtnFontColor(),
            size: _screenSize.height * 0.02,
          ));
    }

    if(this.type == ButtonType.text){
      return new Button.circle(
        context: context,
        onPressed: this.onPressed,
        color: ThemeColors.getLightGrey(),
        content: Text(this.content,
            style: TextStyle(
                fontSize: _screenSize.height * 0.03,
                fontWeight: FontWeight.bold,
                color: ThemeColors.getBtnFontColor())),
      );
    }

    return new Container();

  }
}
