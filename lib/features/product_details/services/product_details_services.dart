import 'dart:convert';

import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/http_error_handling/error_handling.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:amazon_tutorial/reusable/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailsServices {
  void rateProduct(
      {required BuildContext context,
      required double rating,
      required Product product}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    double updatedRating = rating;
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/rate-product"),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": userProvider.user.token
          },
          body: jsonEncode({'id': product.id, 'rating': rating}));
      httpErrorHandle(response: res, onSuccess: () {}, context: context);
    } catch (e) {
      snackbar(context: context, message: e.toString());
    }
  }
}
