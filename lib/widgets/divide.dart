import 'package:flutter/material.dart';

import 'package:Calculator/Classes/ThemeColors.dart';

class Divide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return new Container(
        width: _screenSize.width,
        child: new Divider(
          color: ThemeColors.getDarkGrey(),
        ));
  }
}
