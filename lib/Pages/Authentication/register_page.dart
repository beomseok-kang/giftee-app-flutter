import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:giftee/UI/input_field.dart';
import 'package:giftee/UI/loading.dart';
import 'package:giftee/UI/standard_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _nickName = '';
  String _email = '';
  String _password = '';
  String _error = '';
  bool _showPassword = false;
  bool _showCheckPassword = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgColor(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(0, 0, 0, 1),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _loading ? Loading() : _loginBody(),
            ],
          )),
    );
  }

  Widget _loginBody() {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  'Create your account',
                  style: TextStyle(
                      fontSize: 24,
                      height: 1,
                      fontWeight: FontWeight.bold,
                      color: textColor(),
                      fontFamily: 'Helvetica'),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  boxShadow: boxShadowStandard(),
                ),
                child: inputFieldStandard(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 20,
                      color: selectedColor(),
                    ),
                    hintText: 'Nickname ( 3 ~ 10 characters )',
                    fillColor: Colors.white,
                    validator: (val) => val.length < 3 || val.length > 10
                        ? 'Please write your nickname between 3 and 10 characters.'
                        : null,
                    onChanged: (val) => setState(() => _nickName = val),
                    keyboardType: TextInputType.text
                ),
              ),
              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: boxShadowStandard()
                ),
                child: inputFieldStandard(
                  prefixIcon: Icon(
                      Icons.account_circle,
                      size: 20, color: selectedColor()
                  ),
                  hintText: 'Email',
                  fillColor: Colors.white,
                  validator: (val) => EmailValidator.validate(val)
                      ? null
                      : 'It is an incorrect email address.',
                  onChanged: (val) => setState(() => _email = val),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  boxShadow: boxShadowStandard(),
                ),
                child: inputFieldStandard(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: selectedColor(),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _showPassword = !_showPassword),
                      icon: Icon(Icons.remove_red_eye),
                      color:
                      _showPassword ? selectedColor() : unselectedColor(),
                      iconSize: 25.0,
                    ),
                    hintText: 'Password',
                    fillColor: Colors.white,
                    validator: (val) => val.length < 8 || val.length > 16
                        ? 'The password is in incorrect form.'
                        : null,
                    onChanged: (val) => setState(() => _password = val),
                    obscureText: _showPassword ? false : true,
                    keyboardType: TextInputType.emailAddress
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  boxShadow: boxShadowStandard(),
                ),
                child: inputFieldStandard(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: selectedColor(),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _showCheckPassword = !_showCheckPassword),
                      icon: Icon(Icons.remove_red_eye),
                      color:
                      _showCheckPassword ? selectedColor() : unselectedColor(),
                      iconSize: 25.0,
                    ),
                    hintText: 'Check Password',
                    fillColor: Colors.white,
                    validator: (val) => val.length < 8 || val.length > 16
                        ? 'The password is in incorrect form.'
                        : null,
                    onChanged: (val) => setState(() => _password = val),
                    obscureText: _showCheckPassword ? false : true,
                    keyboardType: TextInputType.emailAddress
                ),
              ),
              buttonStandard(
                borderRadius: 5,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                outlined: false,
                title: 'Sign Up',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => _loading = true);
                    Future.delayed(Duration(milliseconds: 500))
                        .then((value) => setState(() => _loading = false));

                    ///SIGNUP PROCEDURE => Error ? Show Dialog : SignUp and pop context

                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
