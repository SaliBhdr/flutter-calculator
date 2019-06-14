class Calculator {
  String _finalOutput = "0";

  String _output = "0";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = "";
  bool _itsOperated = false;

  static final Calculator _singleton = new Calculator._internal();

  factory Calculator() {
    return _singleton;
  }

  Calculator._internal();

  String calculate(String buttonText) {
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
    } else if(_output.length < 17) {
      if (_output.length > 0  && double.parse(_output) != 0.0) {
        _output = _checkFraction(_checkNumber(double.parse(_output))) + buttonText;
      } else {
        _output = buttonText;
      }
    }

    _finalOutputCalculation(buttonText);

    print(_finalOutput);
    return _finalOutput;
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
    _num1 = 0.0;
    _num2 = 0.0;
    _operand = "";
  }

  _percentCalculation() {
    _output = (double.parse(_output) / 100).toString();
  }

  _operandCalculation(String buttonText) {
    _itsOperated = true;

    if (_operand == '') {
      _num1 = double.parse(_finalOutput);
    } else {
      calculate('equal');
    }

    _operand = buttonText;

    _output = "0";
  }

  _dotCalculation(String buttonText) {
    if (!_output.contains('.')) {
      _output = _output + buttonText;
    }
  }

  _equalCalculation() {
    _num2 = double.parse(_finalOutput);

    _output = _comeOnDoMath(_operand, _num1, _num2);

    _itsOperated = false;
    _operand = "";
    _num1 = double.parse(_output);
    _num2 = 0.0;
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
}
