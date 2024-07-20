import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/profile/belowAppBar.dart';
import 'package:amazon_tutorial/features/profile/orders/orders.dart';
import 'package:amazon_tutorial/features/profile/topButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profile extends StatelessWidget {
  const profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/amazon_in.png",
                    width: 120,
                    height: 40,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.notifications),
                      Icon(Icons.search),
                    ],
                  ),
                )
              ],
            ),
          )),
      body: Column(
        children: [
          belowAppBar(),
          SizedBox(
            height: 10,
          ),
          topButtons(),
          SizedBox(height: 10),
          Orders()
        ],
      ),
    );
  }
}
