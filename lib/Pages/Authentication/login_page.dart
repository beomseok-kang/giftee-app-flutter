import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:giftee/Pages/Authentication/register_page.dart';
import 'package:giftee/Shared/size_config.dart';
import 'package:giftee/Shared/style_standard.dart';
import 'package:giftee/UI/loading.dart';
import 'package:giftee/UI/standard_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

//  final GoogleSignIn _googleSignIn = GoogleSignIn();
//  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = '';
  String _password = '';
  String _error = '';
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: bgColor(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color.fromRGBO(0, 0, 0, 1),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _loading ? Loading() : _loginBody(),
          ],
        )),
      ),
    );
  }

  Widget _loginBody() {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Giftee',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Peterbuilt'),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      focusColor: selectedColor(),
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: 'Email',
                      contentPadding: const EdgeInsets.all(10.0)),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => EmailValidator.validate(val)
                      ? null
                      : 'It is an incorrect email address.',
                  onChanged: (val) {
                    setState(() => _email = val);
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                    decoration: InputDecoration(
                        focusColor: selectedColor(),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye),
                          color: _showPassword ? Colors.black : Colors.grey,
                          iconSize: 25.0,
                        ),
                        hintText: 'Password',
                        contentPadding: EdgeInsets.all(10.0)),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: _showPassword == false ? true : false,
                    validator: (val) => val.length < 8 || val.length > 16
                        ? 'The password is in incorrect form.'
                        : null,
                    onChanged: (val) {
                      setState(() => _password = val);
                    }),
              ),
              buttonStandard(
                outlined: false,
                title: 'Log In',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() => _loading = true);
                    Future.delayed(Duration(milliseconds: 500))
                        .then((value) => setState(() => _loading = false));

                    ///LOGIN PROCEDURE => Error ? Show Dialog : Login and pop context

                  }
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 1,
                width: double.maxFinite,
                color: unselectedColor(),
              ),
              buttonStandard(
                  outlined: true,
                  title: 'Sign Up',
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage())))
            ],
          ),
        ),
      ],
    );
  }
}
