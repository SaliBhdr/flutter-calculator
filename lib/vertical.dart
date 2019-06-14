import 'package:Calculator/Classes/ButtonType.dart';
import 'package:Calculator/widgets/buttons/vertical/circle-dark-grey.dart';
import 'package:Calculator/widgets/buttons/vertical/circle-light-grey.dart';
import 'package:Calculator/widgets/buttons/vertical/circle-orange.dart';
import 'package:Calculator/widgets/buttons/vertical/rectangle-light-grey.dart';
import 'package:Calculator/widgets/buttons/vertical/rectangle-orange.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Classes/Calculator.dart';
import 'widgets/divide.dart';
import 'widgets/screen.dart';

class VerticalCalculator extends StatefulWidget {
  @override
  _VerticalCalculatorState createState() => _VerticalCalculatorState();
}

class _VerticalCalculatorState extends State<VerticalCalculator> {
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
              new Screen(result: _result),
              new Divide(),
              new Row(
                children: <Widget>[
                  new CircleDarkGreyButton(
                    content: 'C',
                    onPressed: () => _calculate('reset'),
                    type: ButtonType.text,
                  ),
                  new CircleDarkGreyButton(
                    content: FontAwesomeIcons.arrowLeft,
                    onPressed: () => _calculate('backspace'),
                    type: ButtonType.icon,
                  ),
                  new CircleDarkGreyButton(
                    content: FontAwesomeIcons.percent,
                    onPressed: () => _calculate('percentage'),
                    type: ButtonType.icon,
                  ),
                  new CircleOrangeButton(
                    content: FontAwesomeIcons.divide,
                    onPressed: () => _calculate('devide'),
                    type: ButtonType.icon,
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new CircleLightGreyButton(
                    content: '7',
                    onPressed: () => _calculate('7'),
                    type: ButtonType.text,
                  ),
                  new CircleLightGreyButton(
                    content: '8',
                    onPressed: () => _calculate('8'),
                    type: ButtonType.text,
                  ),
                  new CircleLightGreyButton(
                    content: '9',
                    onPressed: () => _calculate('9'),
                    type: ButtonType.text,
                  ),
                  new CircleOrangeButton(
                    content: FontAwesomeIcons.times,
                    onPressed: () => _calculate('times'),
                    type: ButtonType.icon,
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new CircleLightGreyButton(
                    content: '4',
                    onPressed: () => _calculate('4'),
                    type: ButtonType.text,
                  ),
                  new CircleLightGreyButton(
                    content: '5',
                    onPressed: () => _calculate('5'),
                    type: ButtonType.text,
                  ),
                  new CircleLightGreyButton(
                    content: '6',
                    onPressed: () => _calculate('6'),
                    type: ButtonType.text,
                  ),
                  new CircleOrangeButton(
                    content: FontAwesomeIcons.minus,
                    onPressed: () => _calculate('minus'),
                    type: ButtonType.icon,
                  )
                ],
              ),
              new Row(
                children: <Widget>[
                  new CircleLightGreyButton(
                    content: '1',
                    onPressed: () => _calculate('1'),
                    type: ButtonType.text,
                  ),
                  new CircleLightGreyButton(
                    content: '2',
                    onPressed: () => _calculate('2'),
                    type: ButtonType.text,
                  ),
                  new CircleLightGreyButton(
                    content: '3',
                    onPressed: () => _calculate('3'),
                    type: ButtonType.text,
                  ),
                  new CircleOrangeButton(
                    content: FontAwesomeIcons.plus,
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
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 15, bottom: 7)),
                  new RectangleLightGreyButton(
                      content: '.',
                      onPressed: () => _calculate('.'),
                      type: ButtonType.text,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5, bottom: 7, right: 5)),
                  new RectangleOrangeButton(
                      content: FontAwesomeIcons.equals,
                      onPressed: () => _calculate('equal'),
                      type: ButtonType.icon,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 15, bottom: 7))
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
