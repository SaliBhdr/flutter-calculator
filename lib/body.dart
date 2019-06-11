import 'package:Calculator/horizontal.dart';
import 'package:Calculator/vertical.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    var _orientation = MediaQuery.of(context).orientation;
    var _screenSize = MediaQuery.of(context).size;

    AppBar _appBar = AppBar(
      title: Text(this.title),
    );

    // TODO: implement build
    return new Scaffold(
      appBar: _orientation == Orientation.portrait
          ? (_screenSize.height > 500 ? _appBar : null)
          : _appBar,

      body: _orientation == Orientation.portrait
          ? VerticalCalculator()
          : HorizontalCalculator(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
