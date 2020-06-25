import 'package:flutter/material.dart';

///Main Theme Styles
themeColor() {
  return Color.fromRGBO(250, 82, 82, 1); ///red, #FA5252
}

///Text Styles

TextStyle titleStyle() {
  return TextStyle(fontSize: 16, );
}
TextStyle headingStyle() {
  return TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}

///Color Styles

Color textColor() {
  return Color.fromRGBO(70, 70, 70, 1);
}
Color shadowColor() {

}
Color bgColor() {
  return Color.fromRGBO(250, 248, 240, 1);
}
Color appBarColor() {
  return Color.fromRGBO(250, 250, 245, 1);
}
Color selectedColor() {
  return Color.fromRGBO(250, 82, 82, 1); ///Same as themeColor
}
Color unselectedColor() {
  return Color.fromRGBO(160, 168, 178, 0.8);
}
