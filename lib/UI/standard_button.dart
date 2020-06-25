import 'package:flutter/material.dart';
import 'package:giftee/Shared/style_standard.dart';

Widget buttonStandard ({@required bool outlined, @required String title, @required Function onPressed}) {
  return Container(
    height: 50,
    width: double.maxFinite,
    margin: EdgeInsets.all(20),
    child: FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: !outlined ? BorderSide.none : BorderSide(
          width: 2.5,
          color: selectedColor(),
        )
      ),
      color: !outlined ? selectedColor() : Colors.transparent,
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