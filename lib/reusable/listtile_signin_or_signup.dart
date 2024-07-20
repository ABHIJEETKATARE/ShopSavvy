import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:amazon_tutorial/features/auth/auth_screen.dart';
//import 'package:flutter/widgets.dart';

class signinsignup {
  final Function fun = () {};
  ListTile rad(fun,
      {String name = "Create Account",
      Auth val = Auth.signup,
      Auth grp = Auth.signup}) {
    return ListTile(
        tileColor: grp == val
            ? GlobalVariables.backgroundColor
            : GlobalVariables.greyBackgroundCOlor,
        title: Text(name),
        leading: Radio(
            value: val,
            groupValue: grp,
            onChanged: (val) {
              fun(grp);
            }));
  }
}
