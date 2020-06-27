import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:giftee/Pages/Authentication/login_page.dart';
import 'package:giftee/Shared/style_standard.dart';

showLoginAlert (BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text('Sign in'),
    content: Text('You need to sign in to enter.\nWould you sign in?'),
    actions: <Widget>[
      FlatButton(
        child: Text('No', style: TextStyle(color: Colors.black),),
        onPressed: () => Navigator.pop(context),
      ),
      FlatButton(
        child: Text('Yes', style: TextStyle(color: selectedColor()),),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(
            builder: (context) => LoginPage()));
        },
      )
    ],
  );

  showDialog(context: context,
    builder: (BuildContext context) {
      return alert;
    }
  );
}