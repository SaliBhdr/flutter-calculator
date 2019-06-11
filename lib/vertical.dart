import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Calculator/widgets/button.dart';

class VerticalCalculator extends StatefulWidget {
  @override
  _VerticalCalculatorState createState() => _VerticalCalculatorState();
}

class _VerticalCalculatorState extends State<VerticalCalculator> {
  String _finalOutput = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  bool _itsOperated = false;

  static const Color _orangeColor = Color(0xFFFF9900);
  static const Color _darkGreyColor = Color(0xFFB3B3B3);
  static const Color _lightGreyColor = Color(0xFFE1E1E1);
  static const Color _btnFontColor = Color(0xFF000000);

  _calculate(String buttonText) {
    if (_isResetBtn(buttonText)) {
      _resetCalculation();
    } else if (_isPercentageBtn(buttonText)) {
      _percentCalculation();
    } else if (_isOperandBtn(buttonText)) {
      _operandCalculation(buttonText);
    } else if (_isDotBtn(buttonText)) {
      _dotCalculation(buttonText);
    } else if (_isEqualBtn(buttonText)) {
      _equalCalculation();
    } else if (_isBackBtn(buttonText)) {
      _backCalculation();
    } else {
      if (_output.length > 0 && double.parse(_output) != 0.0) {
        _output = _checkFraction(_output) + buttonText;
      } else {
        _output = buttonText;
      }
    }

    setState(() {
      _finalOutputCalculation(buttonText);
    });
  }

  _isResetBtn(String buttonText) {
    return buttonText == 'reset';
  }

  _isPercentageBtn(String buttonText) {
    return buttonText == 'percentage';
  }

  _isOperandBtn(String buttonText) {
    return (buttonText == 'plus' ||
        buttonText == 'minus' ||
        buttonText == 'devide' ||
        buttonText == 'times');
  }

  _isDotBtn(String buttonText) {
    return buttonText == '.';
  }

  _isEqualBtn(String buttonText) {
    return buttonText == "equal";
  }

  _isBackBtn(String buttonText) {
    return buttonText == 'backspace';
  }

  _resetCalculation() {
    _output = "0";
    num1 = 0.0;
    num2 = 0.0;
    operand = "";
  }

  _percentCalculation() {
    _output = (double.parse(_output) / 100).toString();
  }

  _operandCalculation(String buttonText) {
    _itsOperated = true;

    if (operand == '') {
      num1 = double.parse(_finalOutput);
    } else {
      _calculate('equal');
    }

    operand = buttonText;

    _output = "0";
  }

  _dotCalculation(String buttonText) {
    if (!_output.contains('.')) {
      _output = _output + buttonText;
    }
  }

  _equalCalculation() {
    num2 = double.parse(_finalOutput);

    _output = _comeOnDoMath(operand, num1, num2);

    _itsOperated = false;
    operand = "";
    num1 = double.parse(_checkNumber(double.parse(_output)));
    num2 = 0.0;
  }

  _backCalculation() {
    if (_output != '' && _output.length > 0)
      _output = _checkNumber(double.parse(_output));

    var _length = _output.length;

    if (_length > 0) {
      _output = _output.replaceRange(_length - 1, _length, '');
    }

    if (_output != '' && _output.length > 0)
      _output = _checkNumber(double.parse(_output));
  }

  _finalOutputCalculation(String buttonText) {
    if ((_output.length > 0 && double.parse(_output) != 0.0) ||
        (!_itsOperated && (_output == '0.0' || _output == '0'))) {
      _finalOutput = _checkNumber(double.parse(_output));
    } else if (buttonText == 'reset' || _output == '') {
      _finalOutput = '0';
    }
  }

  String _checkNumber(double doubleNumber) {
    if (!doubleNumber.isInfinite && !doubleNumber.isNaN) {
      int intNumber = doubleNumber.toInt();

      var fraction = doubleNumber - intNumber;

      if (fraction == 0.0) {
        return intNumber.toString();
      } else {
        return doubleNumber.toString();
      }
    } else {
      return _finalOutput;
    }
  }

  String _checkFraction(String number) {
    if (number.contains('.')) {
      double doubleNumber = double.parse(_output);
      if (!doubleNumber.isInfinite && !doubleNumber.isNaN) {
        int intNumber = doubleNumber.toInt();
        var fraction = doubleNumber - intNumber;
        if (fraction == 0.0) {
          return intNumber.toString() + '.';
        }
      } else {
        return _finalOutput;
      }
    }
    return number;
  }

  String _comeOnDoMath(String operand, double num1, double num2) {
    String output = num1.toString();
    if (operand == 'plus') {
      output = (num1 + num2).toString();
    }

    if (operand == 'minus') {
      output = (num1 - num2).toString();
    }

    if (operand == 'devide') {
      output = (num1 / num2).toString();
    }

    if (operand == 'times') {
      output = (num1 * num2).toString();
    }
    return output;
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
                  _finalOutput,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _finalOutput.length < 12
                          ? _screenSize.height * 0.078
                          : (_finalOutput.length < 18
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
