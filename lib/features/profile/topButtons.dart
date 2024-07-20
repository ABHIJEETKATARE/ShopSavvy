import 'package:amazon_tutorial/features/profile/account_button.dart';
import 'package:flutter/material.dart';

class topButtons extends StatefulWidget {
  const topButtons({super.key});

  @override
  State<topButtons> createState() => _topButtonsState();
}

class _topButtonsState extends State<topButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(ontap: () {}, buttonText: "Your Orders"),
            AccountButton(ontap: () {}, buttonText: "Turn Seller")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(ontap: () {}, buttonText: "yourOrders"),
            AccountButton(ontap: () {}, buttonText: "yourOrders")
          ],
        )
      ],
    );
  }
}
