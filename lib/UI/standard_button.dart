import 'package:flutter/material.dart';
import 'package:giftee/Shared/style_standard.dart';

Widget buttonStandard ({
  @required bool outlined,
  @required String title,
  @required Function onPressed,
  double height = 50,
  double width = double.infinity,
  EdgeInsets margin = const EdgeInsets.all(20),
  double borderRadius = 15,
}) {
  return Container(
    height: height,
    width: width,
    margin: margin,
    child: FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: !outlined ? BorderSide.none : BorderSide(
          width: 2.5,
          color: selectedColor(),
        )
      ),
      color: !outlined ? selectedColor() : Color.fromRGBO(255, 255, 255, 1),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: !outlined ? Color.fromRGBO(255, 255, 255, 1) : selectedColor()
          ),
        ),
      ),
      onPressed: onPressed,
    ),
  );
}