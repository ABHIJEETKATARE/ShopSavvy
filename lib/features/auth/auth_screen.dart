//import 'dart:math';

import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/reusable/custom_button.dart';
import 'package:amazon_tutorial/reusable/custom_textfield.dart';
import 'package:amazon_tutorial/reusable/listtile_signin_or_signup.dart';
import 'package:amazon_tutorial/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//import 'package:flutter/widgets.dart';
enum Auth { signup, signin }

class authScreen extends StatefulWidget {
  static const String routeName = "/authScreen";
  static Auth _auth = Auth.signup;
  authScreen({val = Auth.signup}) {
    _auth = val;
  }

  @override
  _authScreen createState() {
    return _authScreen(val: _auth);
  }
}

class _authScreen extends State<authScreen> {
  Auth _auth = Auth.signup;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _signUpkey = GlobalKey<FormState>();
  final _signInkey = GlobalKey<FormState>();
  _authScreen({val = Auth.signup}) {
    _auth = val;
  }
  @override
  void dispose() {
    super.dispose();
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  signinsignup obj = signinsignup();
  void update(grp) {
    if (grp == Auth.signin) {
      setState(() {
        _auth = Auth.signup;
      });
    } else {
      setState(() {
        _auth = Auth.signin;
      });
    }
  }

  void signUpUser() {
    authService authServiceobj = authService();
    authServiceobj.signUpUser(
        context: context,
        email: _emailcontroller.text,
        name: _namecontroller.text,
        password: _passwordcontroller.text);
  }

  void signInUser() {
    authService authServiceobj = authService();
    authServiceobj.signInUser(
        context: context,
        email: _emailcontroller.text,
        password: _passwordcontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            obj.rad(
              update,
              grp: _auth,
            ),
            if (_auth == Auth.signup) ...{
              Container(
                padding: EdgeInsets.all(10),
                color: GlobalVariables.backgroundColor,
                child: Form(
                    key: _signUpkey,
                    child: Column(
                      children: [
                        customtextfield(
                          controller: _namecontroller,
                          hintText: "Name",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customtextfield(
                          controller: _emailcontroller,
                          hintText: "Email",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customtextfield(
                          controller: _passwordcontroller,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customButton(
                            onTap: () {
                              if (_signUpkey.currentState!.validate()) {
                                signUpUser();
                              }
                            },
                            title: "submit")
                      ],
                    )),
              )
            },
            obj.rad(update, name: "signin", grp: _auth, val: Auth.signin),
            if (_auth == Auth.signin) ...{
              Container(
                padding: EdgeInsets.all(10),
                color: GlobalVariables.backgroundColor,
                child: Form(
                    key: _signInkey,
                    child: Column(
                      children: [
                        customtextfield(
                          controller: _emailcontroller,
                          hintText: "Email",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customtextfield(
                          controller: _passwordcontroller,
                          hintText: "Password",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customButton(
                            onTap: () {
                              if (_signInkey.currentState!.validate()) {
                                signInUser();
                              }
                            },
                            title: "submit")
                      ],
                    )),
              )
            },
          ],
        ),
      )),
    );
  }
}
