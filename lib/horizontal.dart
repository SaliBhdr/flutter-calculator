import 'package:Calculator/Classes/ButtonType.dart';
import 'package:Calculator/widgets/buttons/horzital/rectangle-dark-grey.dart';
import 'package:Calculator/widgets/buttons/horzital/rectangle-light-grey.dart';
import 'package:Calculator/widgets/buttons/horzital/rectangle-orange.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Calculator/widgets/button.dart';

import 'Classes/ThemeColors.dart';
import 'Classes/Calculator.dart';
import 'widgets/divide.dart';
import 'widgets/screen.dart';

class HorizontalCalculator extends StatefulWidget {
  @override
  _HorizontalCalculatorState createState() => _HorizontalCalculatorState();
}

class _HorizontalCalculatorState extends State<HorizontalCalculator> {
  String _result = "0";

  _calculate(String buttonText) {
    Calculator calculator = new Calculator();

    setState(() {
      _result = calculator.calculate(buttonText);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return new Container(
      width: _screenSize.width,
      height: _screenSize.height,
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.bottomCenter,
        child: new Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Screen(_result),
              new Divide(),
              new Row(
                children: <Widget>[
                  new RectangleDarkGreyButton(
                    content: 'C',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('reset'),
                    type: ButtonType.text,
                  ),
                  new RectangleDarkGreyButton(
                    content: FontAwesomeIcons.arrowLeft,
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('backspace'),
                    type: ButtonType.icon,
                  ),
                  new RectangleDarkGreyButton(
                    content: FontAwesomeIcons.percent,
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('percentage'),
                    type: ButtonType.icon,
                  ),
                  new RectangleOrangeButton(
                    content: FontAwesomeIcons.divide,
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('devide'),
                    type: ButtonType.icon,
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new RectangleLightGreyButton(
                    content: '7',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('7'),
                    type: ButtonType.text,
                  ),
                  new RectangleLightGreyButton(
                    content: '8',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('8'),
                    type: ButtonType.text,
                  ),
                  new RectangleLightGreyButton(
                    content: '9',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('9'),
                    type: ButtonType.text,
                  ),
                  new RectangleOrangeButton(
                    content: FontAwesomeIcons.times,
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('times'),
                    type: ButtonType.icon,
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new RectangleLightGreyButton(
                    content: '4',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('4'),
                    type: ButtonType.text,
                  ),
                  new RectangleLightGreyButton(
                    content: '5',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('5'),
                    type: ButtonType.text,
                  ),
                  new RectangleLightGreyButton(
                    content: '6',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('6'),
                    type: ButtonType.text,
                  ),
                  new RectangleOrangeButton(
                    content: FontAwesomeIcons.minus,
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('minus'),
                    type: ButtonType.icon,
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new RectangleLightGreyButton(
                    content: '1',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('1'),
                    type: ButtonType.text,
                  ),
                  new RectangleLightGreyButton(
                    content: '2',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('2'),
                    type: ButtonType.text,
                  ),
                  new RectangleLightGreyButton(
                    content: '3',
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('3'),
                    type: ButtonType.text,
                  ),
                  new RectangleOrangeButton(
                    content: FontAwesomeIcons.plus,
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () => _calculate('plus'),
                    type: ButtonType.icon,
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new RectangleLightGreyButton(
                    content: '0',
                    onPressed: () => _calculate('0'),
                    type: ButtonType.text,
                  ),
                  new RectangleLightGreyButton(
                    content: '.',
                    onPressed: () => _calculate('.'),
                    type: ButtonType.text,
                  ),
                  new RectangleOrangeButton(
                    content: FontAwesomeIcons.equals,
                    onPressed: () => _calculate('equal'),
                    type: ButtonType.icon,
                  )
                ],
              ),
            ],
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
