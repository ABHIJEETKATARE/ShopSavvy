import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});
  static const String routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(Provider.of<UserProvider>(context).user.toString()),
    ));
  }
}
