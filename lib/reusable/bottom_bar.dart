import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/screens/homescreen/homescreen.dart';
import 'package:flutter/material.dart';

class BottomBarState extends StatefulWidget {
  const BottomBarState({super.key});

  @override
  State<BottomBarState> createState() => _BottomBarStateState();
}

class _BottomBarStateState extends State<BottomBarState> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: homeScreen(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: GlobalVariables.backgroundColor,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle_sharp), label: "circle")
        ],
      ),
    );
  }
}
