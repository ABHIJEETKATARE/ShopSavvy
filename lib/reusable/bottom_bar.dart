import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/Widgets/cart.dart';
import 'package:amazon_tutorial/features/Widgets/home.dart';
import 'package:amazon_tutorial/features/profile/profile.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class BottomBarState extends StatefulWidget {
  const BottomBarState({super.key});
  static const String routeName = "/bottomBarState";
  @override
  State<BottomBarState> createState() => _BottomBarStateState();
}

class _BottomBarStateState extends State<BottomBarState> {
  List<Widget> screens = const [home(), profile(), cart()];
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  void updateSelectedPage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateSelectedPage,
        backgroundColor: GlobalVariables.backgroundColor,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: const Icon(
                  Icons.home_outlined,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: bottomBarBorderWidth))),
                child: const badges.Badge(
                  badgeStyle:
                      badges.BadgeStyle(badgeColor: Colors.white, elevation: 0),
                  badgeContent: Text("3"),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
