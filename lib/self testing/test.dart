import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void test(BuildContext context) async {
  SharedPreferences sh = await SharedPreferences.getInstance();
  String? tok = sh.getString('x-auth-token');
  print("abhijeet    $tok");
  print("eshuuu    $tok");
}
