// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealOfDay extends StatelessWidget {
  DealOfDay({
    super.key,
  });
  final List list = [
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Deal Of The Day',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Image.network(
            height: 235,
            fit: BoxFit.fitHeight,
            "https://th.bing.com/th/id/OIP.hAQXkkmxlydgrJmGh_u87gHaLH?w=123&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, right: 40, top: 5),
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Abhijeet',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                height: 60,
                padding: const EdgeInsets.all(5),
                child: Image.network(list[index]),
              );
            },
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
            child: Text(
              "See all deals",
              style: TextStyle(color: Colors.cyan[800]),
            ))
      ],
    );
  }
}
