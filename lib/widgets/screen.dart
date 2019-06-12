import 'package:flutter/material.dart';

class Screen extends StatefulWidget {

  String _result;

  Screen(result){
    _result = result;
  }

  @override
  _ScreenState createState() {

    return _ScreenState();
  }
}

class _ScreenState extends State<Screen> {


  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return new Container(
      width: _screenSize.width,
      alignment: Alignment.centerRight,
      padding: new EdgeInsets.only(
        left: _screenSize.width * 0.02,
        right: _screenSize.width * 0.03,
        top: _screenSize.height * 0.05,
        bottom: _screenSize.height * 0.02,
      ),
      child: new Text(
        widget._result,
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget._result.length < 12
                ? _screenSize.height * 0.078
                : (widget._result.length < 18
                ? _screenSize.height * 0.055
                : _screenSize.height * 0.04)),
      ),
    );
  }
}
