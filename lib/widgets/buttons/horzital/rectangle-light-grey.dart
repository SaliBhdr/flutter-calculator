import 'package:Calculator/Classes/ThemeColors.dart';
import 'package:Calculator/widgets/button.dart';
import 'package:Calculator/Classes/ButtonType.dart';
import 'package:flutter/material.dart';

class RectangleLightGreyButton extends StatelessWidget {

  final onPressed;

  final content;

  final String type;

  final double containerWidth;

  RectangleLightGreyButton({this.containerWidth,@required this.content, @required this.onPressed,@required this.type});

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    if(this.type == ButtonType.icon){
      return new Button.rectangle(
        context: context,
        containerWidth: this.containerWidth,
        onPressed: this.onPressed,
        margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
        color: ThemeColors.getLightGrey(),
        alignment: Alignment.center,
        content: Icon(
          this.content,
          color: ThemeColors.getBtnFontColor(),
          size: _screenSize.height * 0.035,
        ),
        radius: BorderRadius.all(Radius.circular(50)),
      );
    }

    if(this.type == ButtonType.text){
      return new Button.rectangle(
        context: context,
        containerWidth: this.containerWidth,
        onPressed: this.onPressed,
        margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
        color: ThemeColors.getLightGrey(),
        alignment: Alignment.center,
        content: Text(this.content,
            style: TextStyle(
                fontSize: _screenSize.height * 0.05,
                fontWeight: FontWeight.bold,
                color: ThemeColors.getBtnFontColor())),
        radius: BorderRadius.all(Radius.circular(50)),
      );
    }

    return new Container();

  }
}
