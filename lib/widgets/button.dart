import 'dart:async';
import 'dart:io';

import 'package:Calculator/Classes/Vibration.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final content;

  final BoxDecoration boxDecoration;

  final EdgeInsets padding;

  final BorderRadius radius;

  final Color color;

  final Alignment alignment;

  final EdgeInsets margin;

  final onPressed;

  final BuildContext context;

  final double containerWidth;

  Button.circle(
      {@required this.content,
      containerWidth,
      boxDecoration,
      @required this.color,
      padding,
      radius,
      alignment,
      margin,
      @required this.context,
      this.onPressed})
      : radius = null,
        boxDecoration = boxDecoration ??
            new BoxDecoration(color: color, shape: BoxShape.circle),
        padding = padding ??
            EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.03,
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03,
            ),
        alignment = alignment ?? Alignment.center,
        margin = margin ?? EdgeInsets.only(bottom: 10),
        containerWidth =
            containerWidth ?? MediaQuery.of(context).size.width / 4;

  Button.rectangle(
      {@required this.content,
      containerWidth,
      boxDecoration,
      @required this.color,
      padding,
      alignment,
      @required this.radius,
      margin,
      @required this.context,
      this.onPressed})
      : boxDecoration = boxDecoration ??
            new BoxDecoration(
                color: color, shape: BoxShape.rectangle, borderRadius: radius),
        padding = padding ??
            EdgeInsets.only(
                left: 0.0,
                right: MediaQuery.of(context).size.height * 0.01,
                top: MediaQuery.of(context).size.height * 0.015,
                bottom: MediaQuery.of(context).size.height * 0.015),
        alignment = alignment ?? Alignment.centerRight,
        margin = margin ?? EdgeInsets.only(bottom: 10),
        containerWidth =
            containerWidth ?? MediaQuery.of(context).size.width / 3;

  @override
  _ButtonState createState() => _ButtonState(this.boxDecoration);
}

class _ButtonState extends State<Button> {
  BoxDecoration _boxDecoration;

  _ButtonState(this._boxDecoration);

  _setNewDecoration() {
    var color = this._boxDecoration.color;
    var shape = this._boxDecoration.shape;
    var borderRadius = this._boxDecoration.borderRadius;

    this._boxDecoration = new BoxDecoration(
        color: color.withOpacity(0.7),
        shape: shape,
        borderRadius: borderRadius);
  }

  _getOldBoxDecoration() {
    var color = this._boxDecoration.color;
    var shape = this._boxDecoration.shape;
    var borderRadius = this._boxDecoration.borderRadius;

    sleep(Duration(milliseconds: 110));

    this._boxDecoration = new BoxDecoration(
        color: color.withOpacity(1), shape: shape, borderRadius: borderRadius);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: widget.containerWidth,
      child: new GestureDetector(
        onTapUp: (TapUpDetails details) {
          setState(() {
            this._getOldBoxDecoration();
          });
        },
        onTapDown: (TapDownDetails details) {
          setState(() {
            this._setNewDecoration();
          });
          Vibration.vibrate();
        },
        onTap: widget.onPressed,
        child: new Container(
          alignment: this.widget.alignment,
          margin: this.widget.margin,
          decoration: this._boxDecoration,
          padding: this.widget.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: this.widget.content,
          ),
        ),
      ),
    );
  }
}
