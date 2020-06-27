import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftee/Shared/style_standard.dart';

Widget searchBar ({@required Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: boxShadowStandard()
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.search, color: Colors.black26,),
          )
        ],
      ),
    ),
  );
}