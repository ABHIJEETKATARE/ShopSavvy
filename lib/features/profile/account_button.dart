import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton(
      {super.key, required this.ontap, required this.buttonText});
  final VoidCallback ontap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: BorderRadius.circular(50)),
        child: OutlinedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text(
              buttonText,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}
