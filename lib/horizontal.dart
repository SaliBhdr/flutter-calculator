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
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('reset'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getDarkGrey(),
                    alignment: Alignment.center,
                    content: Text('C',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('backspace'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getDarkGrey(),
                    alignment: Alignment.center,
                    content: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.035,
                    ),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('percentage'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getDarkGrey(),
                    alignment: Alignment.center,
                    content: Icon(
                      FontAwesomeIcons.percent,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.035,
                    ),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('devide'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getOrange(),
                    alignment: Alignment.center,
                    content: Icon(
                      FontAwesomeIcons.divide,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.035,
                    ),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('7'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('7',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('8'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('8',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('9'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('9',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('times'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getOrange(),
                    alignment: Alignment.center,
                    content: Icon(
                      FontAwesomeIcons.times,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.035,
                    ),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('4'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('4',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('5'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('5',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('6'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('6',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('minus'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getOrange(),
                    alignment: Alignment.center,
                    content: Icon(
                      FontAwesomeIcons.minus,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.035,
                    ),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('1'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('1',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('2'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('2',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('3'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('3',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    containerWidth: MediaQuery.of(context).size.width / 4,
                    context: context,
                    onPressed: () => _calculate('plus'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getOrange(),
                    alignment: Alignment.center,
                    content: Icon(
                      FontAwesomeIcons.plus,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.035,
                    ),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('0'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('0',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.05,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('.'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('.',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.07,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('equal'),
                    margin: EdgeInsets.fromLTRB(5,7.5,5,7.5),
                    color: ThemeColors.getOrange(),
                    alignment: Alignment.center,
                    content: Icon(
                      FontAwesomeIcons.equals,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.035,
                    ),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
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
