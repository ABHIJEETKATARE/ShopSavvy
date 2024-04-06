import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const customButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(title),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          minimumSize: Size(double.infinity, 50)),
    );
  }
}
