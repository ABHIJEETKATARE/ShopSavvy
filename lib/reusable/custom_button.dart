import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final Color? color;
  const customButton(
      {super.key, required this.onTap, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(color: color == null ? Colors.white : Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
