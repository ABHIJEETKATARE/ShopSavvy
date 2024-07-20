import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/home/home_screen/address.dart';
import 'package:amazon_tutorial/features/home/home_screen/carousel.dart';
import 'package:amazon_tutorial/features/home/home_screen/deal_of_day.dart';
import 'package:amazon_tutorial/features/home/home_screen/topcategories.dart';
import 'package:amazon_tutorial/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});
  static const String routeName = "/homeScreen";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  void navigateToSearchScreen(String query)
  {
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(7),
                      child: TextFormField(
                        onFieldSubmitted: (value) => navigateToSearchScreen(value),
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(top: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(96, 150, 52, 52), width: 1)),
                            hintText: "Search Amazon.in",
                            hintStyle: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child:const Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Address(),
              SizedBox(height: 10),
              TopCategories(),
              SizedBox(
                height: 10,
              ),
              CarouselImages(),
              SizedBox(
                height: 10,
              ),
              DealOfDay()
            ],
          ),
        ));
  }
}
