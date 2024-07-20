import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/profile/orders/singleitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Text(
                  "Your Orders",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'See all',
                style: TextStyle(color: GlobalVariables.selectedNavBarColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 170,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) => SingleProduct(image: list[index]),
          ),
        )
      ],
    );
  }
}
