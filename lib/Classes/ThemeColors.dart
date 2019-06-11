import 'package:flutter/material.dart';


class ThemeColors {
  static const Color _orangeColor = Color(0xFFFF9900);
  static const Color _darkGreyColor = Color(0xFFB3B3B3);
  static const Color _lightGreyColor = Color(0xFFE1E1E1);
  static const Color _btnFontColor = Color(0xFF000000);

  static Color getOrange(){
    return _orangeColor;
  }

  static Color getDarkGrey(){
    return _darkGreyColor;
  }

  static Color getLightGrey(){
    return _lightGreyColor;
  }

  static Color getBtnFontColor(){
    return _btnFontColor;
  }
}