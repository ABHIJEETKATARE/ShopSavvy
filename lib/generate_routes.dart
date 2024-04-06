import 'package:amazon_tutorial/screens/auth_screen.dart';
import 'package:amazon_tutorial/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case authScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return authScreen();
        },
      );
    case homeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const homeScreen();
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("not exist"),
          ),
        ),
      );
  }
}
