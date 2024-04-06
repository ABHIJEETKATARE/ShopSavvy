import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_tutorial/reusable/snackbar.dart';

void httpErrorHandle(
    {required http.Response response,
    required VoidCallback onSuccess,
    required BuildContext context}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      snackbar(
          context: context, message: json.decode(response.body)["message"]);
      break;
    case 500:
      snackbar(context: context, message: json.decode(response.body)["error"]);
      break;
    default:
      snackbar(context: context, message: (response.body));
      break;
  }
}
