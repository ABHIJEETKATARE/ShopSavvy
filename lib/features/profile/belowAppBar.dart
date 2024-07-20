import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class belowAppBar extends StatelessWidget {
  const belowAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Container(
      decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        children: [
          Container(
            height: 40,
            child: Text(
              'Hello, ',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
          Container(
            height: 40,
            child: Text(
              provider.user.name,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
