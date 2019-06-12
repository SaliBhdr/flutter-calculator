import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Calculator/widgets/button.dart';

import 'Classes/Calculator.dart';

class VerticalCalculator extends StatefulWidget {
  @override
  _VerticalCalculatorState createState() => _VerticalCalculatorState();
}

class _VerticalCalculatorState extends State<VerticalCalculator> {
  String _result = "0";

  static const Color _orangeColor = Color(0xFFFF9900);
  static const Color _darkGreyColor = Color(0xFFB3B3B3);
  static const Color _lightGreyColor = Color(0xFFE1E1E1);
  static const Color _btnFontColor = Color(0xFF000000);

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
                    color: _darkGreyColor,
                  )),
              new Row(
                children: <Widget>[
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('reset'),
                    color: _darkGreyColor,
                    content: Text('C',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                      context: context,
                      onPressed: () => _calculate('backspace'),
                      color: _darkGreyColor,
                      content: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: _btnFontColor,
                        size: _screenSize.height * 0.02,
                      )),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('percentage'),
                    color: _darkGreyColor,
                    content: Icon(
                      FontAwesomeIcons.percent,
                      color: _btnFontColor,
                      size: _screenSize.height * 0.02,
                    ),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('devide'),
                    color: _orangeColor,
                    content: Icon(
                      FontAwesomeIcons.divide,
                      color: _btnFontColor,
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
                    color: _lightGreyColor,
                    content: Text('7',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('8'),
                    color: _lightGreyColor,
                    content: Text('8',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('9'),
                    color: _lightGreyColor,
                    content: Text('9',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('times'),
                    color: _orangeColor,
                    content: Icon(
                      FontAwesomeIcons.times,
                      color: _btnFontColor,
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
                    color: _lightGreyColor,
                    content: Text('4',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('5'),
                    color: _lightGreyColor,
                    content: Text('5',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('6'),
                    color: _lightGreyColor,
                    content: Text('6',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('minus'),
                    color: _orangeColor,
                    content: Icon(
                      FontAwesomeIcons.minus,
                      color: _btnFontColor,
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
                    color: _lightGreyColor,
                    content: Text('1',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('2'),
                    color: _lightGreyColor,
                    content: Text('2',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('3'),
                    color: _lightGreyColor,
                    content: Text('3',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                  ),
                  new Button.circle(
                    context: context,
                    onPressed: () => _calculate('plus'),
                    color: _orangeColor,
                    content: Icon(
                      FontAwesomeIcons.plus,
                      color: _btnFontColor,
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
                    color: _lightGreyColor,
                    alignment: Alignment.centerLeft,
                    content: Text('0',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('.'),
                    margin: EdgeInsets.only(left: 5, bottom: 7, right: 5),
                    color: _lightGreyColor,
                    alignment: Alignment.center,
                    content: Text('.',
                        style: TextStyle(
                            fontSize: _screenSize.height * 0.045,
                            fontWeight: FontWeight.bold,
                            color: _btnFontColor)),
                    radius: BorderRadius.all(Radius.circular(50)),
                  ),
                  new Button.rectangle(
                    context: context,
                    onPressed: () => _calculate('equal'),
                    margin: EdgeInsets.only(right: 15, bottom: 7),
                    color: _orangeColor,
                    alignment: Alignment.centerRight,
                    content: Icon(
                      FontAwesomeIcons.equals,
                      color: _btnFontColor,
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
