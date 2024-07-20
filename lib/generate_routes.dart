import 'package:amazon_tutorial/features/admin/widgets/add_product_screen.dart';
import 'package:amazon_tutorial/features/auth/auth_screen.dart';
import 'package:amazon_tutorial/features/home/home_screen/category_deals_screen.dart';
import 'package:amazon_tutorial/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_tutorial/features/search/screens/search_screen.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:amazon_tutorial/reusable/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case authScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return authScreen();
        },
      );
    case BottomBarState.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const BottomBarState();
        },
      );
    case AddProduct.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return const AddProduct();
        },
      );
    case CategoryDealsScreen.routeName:
      var category = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return CategoryDealsScreen(
            category: category,
          );
        },
      );
    case SearchScreen.routeName:
      var searchQuery = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return SearchScreen(searchQuery: searchQuery);
        },
      );
    case ProductDetailScreen.routeName:
      var product = settings.arguments as Product;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return ProductDetailScreen(
            product: product,
          );
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
