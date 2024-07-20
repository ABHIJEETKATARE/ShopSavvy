import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/Widgets/cart.dart';
import 'package:amazon_tutorial/features/admin/screens/analytics_screen.dart';
import 'package:amazon_tutorial/features/admin/screens/product_screen.dart';
import 'package:amazon_tutorial/features/admin/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  final List<Widget> adminPages = [
    const ProductScreen(),
    const AnalyticsScreen(),
    const OrdersScreen()
  ];
  void updateAdminPage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // alignment: Alignment.topLeft,
                  child: Image.asset(
                    height: 40,
                    width: 120,
                    "assets/images/amazon_in.png",
                  ),
                ),
                Text(
                  "Admin",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
      body: adminPages[_page],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: GlobalVariables.backgroundColor,
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          onTap: updateAdminPage,
          items: [
            BottomNavigationBarItem(
              label: "homescreen",
              icon: Container(
                width: 42,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: 5))),
                child: const Icon(
                  Icons.home_outlined,
                  size: 28,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "cart",
              icon: Container(
                width: 42,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: 5))),
                child: Icon(
                  Icons.analytics_outlined,
                  size: 28,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "post",
              icon: Container(
                width: 42,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 2
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.backgroundColor,
                            width: 5))),
                child: Icon(
                  Icons.all_inbox_outlined,
                  size: 28,
                ),
              ),
            ),
          ]),
    );
  }
}
