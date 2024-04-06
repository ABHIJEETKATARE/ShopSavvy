// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/http_error_handling/error_handling.dart';
import 'package:amazon_tutorial/models/user_model.dart';
import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:amazon_tutorial/reusable/snackbar.dart';
import 'package:amazon_tutorial/screens/homescreen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authService {
  void signUpUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signUp"),
          body: User(
                  name: name,
                  email: email,
                  password: password,
                  id: "",
                  type: "",
                  address: "",
                  token: "")
              .toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            snackbar(
                context: context,
                message: "Account created! Login with your credentials");
          });
    } catch (e) {
      snackbar(context: context, message: e.toString());
    }
  }

  void signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response response = await http.post(Uri.parse("$uri/api/signIn"),
          body: User(
                  name: "",
                  email: email,
                  password: password,
                  id: "",
                  type: "",
                  address: "",
                  token: "")
              .toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            await pref.setString(
                'x-auth-token', jsonDecode(response.body)["token"]);
            Navigator.of(context).pushNamed(homeScreen.routeName);
          });
    } catch (e) {
      snackbar(context: context, message: e.toString());
    }
  }

  //get user data
  void getToken(BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');
      print(token);
      if (token == null) {
        pref.setString('x-auth-token', '');
      }
      http.Response res = await http.get(Uri.parse("$uri/tokenIsValid"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var isTokenValid = json.decode(res.body);
      if (isTokenValid) {
        http.Response userRes = await http.get(Uri.parse("$uri/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
