import 'dart:convert';
import 'dart:io';
import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/http_error_handling/error_handling.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:amazon_tutorial/reusable/snackbar.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct(
      {required BuildContext context,
      required String name,
      required double quantity,
      required double price,
      required String description,
      required String category,
      required List<File> images}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      List<String> imageUrls = [];
      final cloudinary = CloudinaryPublic('dndoamwd5', 'u0l5knos');
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }
      final product = Product(
          name: name,
          description: description,
          quantity: quantity,
          price: price,
          images: imageUrls,
          category: category);
      http.Response res = await http.post(Uri.parse("$uri/admin/add-product"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "x-auth-token": userProvider.user.token
          },
          body: product.toJson());
      httpErrorHandle(
          response: res,
          onSuccess: () {
            snackbar(
                context: context, message: "Product is saved successfully");
            Navigator.pop(context);
          },
          context: context);
    } catch (e) {
      snackbar(context: context, message: e.toString());
    }
  }

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final List<Product> products = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/admin/get-products"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "x-auth-token": userProvider.user.token
        },
      );
      httpErrorHandle(
          response: res,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              products
                  .add(Product.fromJson(jsonEncode((jsonDecode(res.body)[i]))));
            }
          },
          context: context);
    } catch (e) {
      snackbar(context: context, message: e.toString());
    }

    return products;
  }

//delete
  void deleteProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res =
          await http.post(Uri.parse('$uri/admin/delete-product'),
              headers: {
                'Content-Type': 'application/json;charset=UTF-8',
                'x-auth-token': userProvider.user.token
              },
              body: json.encode({'id': product.id}));
      httpErrorHandle(response: res, onSuccess: onSuccess, context: context);
    } catch (e) {
      snackbar(context: context, message: e.toString());
    }
  }
}
