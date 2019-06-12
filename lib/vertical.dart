import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Calculator/widgets/button.dart';

import 'Classes/ThemeColors.dart';
import 'Classes/Calculator.dart';


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

    return Container(
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
              new Container(
                width: _screenSize.width,
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.only(
                  left: _screenSize.width * 0.02,
                  right: _screenSize.width * 0.03,
                  top: _screenSize.height * 0.05,
                  bottom: _screenSize.height * 0.02,
                ),
                child: new Text(
                  _result,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _result.length < 12
                          ? _screenSize.height * 0.078
                          : (_result.length < 18
                              ? _screenSize.height * 0.055
                              : _screenSize.height * 0.04)),
                ),
              ),
              new Container(
                  width: _screenSize.width,
                  child: new Divider(
                    color: ThemeColors.getDarkGrey(),
                  )),
              new Row(
                children: <Widget>[
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('reset'),
                    color: ThemeColors.getDarkGrey(),
                    content: Text('C',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                      context: context,
                      onPressed: () => _calculate('backspace'),
                      color: ThemeColors.getDarkGrey(),
                      content: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: ThemeColors.getBtnFontColor(),
                        size: _screenSize.height * 0.02,
                      )),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('percentage'),
                    color: ThemeColors.getDarkGrey(),
                    content: Icon(
                      FontAwesomeIcons.percent,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.02,
                    ),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('devide'),
                    color: ThemeColors.getOrange(),
                    content: Icon(
                      FontAwesomeIcons.divide,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.02,
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('7'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('7',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('8'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('8',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('9'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('9',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('times'),
                    color: ThemeColors.getOrange(),
                    content: Icon(
                      FontAwesomeIcons.times,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.02,
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('4'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('4',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('5'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('5',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('6'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('6',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('minus'),
                    color: ThemeColors.getOrange(),
                    content: Icon(
                      FontAwesomeIcons.minus,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.02,
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('1'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('1',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('2'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('2',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('3'),
                    color: ThemeColors.getLightGrey(),
                    content: Text('3',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('plus'),
                    color: ThemeColors.getOrange(),
                    content: Icon(
                      FontAwesomeIcons.plus,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.02,
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('0'),
                    margin: EdgeInsets.only(left: 15, bottom: 7),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.centerLeft,
                    content: Text('0',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('.'),
                    margin: EdgeInsets.only(left: 5, bottom: 7, right: 5),
                    color: ThemeColors.getLightGrey(),
                    alignment: Alignment.center,
                    content: Text('.',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.045,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.getBtnFontColor())),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('equal'),
                    margin: EdgeInsets.only(right: 15, bottom: 7),
                    color: ThemeColors.getOrange(),
                    alignment: Alignment.centerRight,
                    content: Icon(
                      FontAwesomeIcons.equals,
                      color: ThemeColors.getBtnFontColor(),
                      size: _screenSize.height * 0.02,
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
