import 'package:flutter/material.dart';

void snackbar({required context, required message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
