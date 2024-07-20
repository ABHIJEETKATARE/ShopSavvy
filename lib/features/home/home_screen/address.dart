import 'package:amazon_tutorial/models/user_model.dart';
import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Address extends StatelessWidget {
  const Address({super.key});
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 114, 226, 221),
        Color.fromARGB(255, 162, 236, 233)
      ], stops: [
        0.4,
        0.8
      ])),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Delivery to ${user.name} - ${user.address}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2, left: 5),
            child: Icon(Icons.arrow_drop_down_outlined),
          )
        ],
      ),
    );
  }
}
