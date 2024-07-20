import 'dart:convert';

import 'package:amazon_tutorial/models/rating.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  final double quantity;
  final double price;
  final List<String> images;
  final String category;
  final String? id;
  final List<Rating>? rating;
  Product(
      {required this.name,
      required this.description,
      required this.quantity,
      required this.price,
      required this.images,
      required this.category,
      this.id,
      this.rating});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'price': price,
      'images': images,
      'category': category,
      'id': id,
      'rating': rating
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] != null ? map['name'] as String : '',
        description:
            map['description'] != null ? map['description'] as String : '',
        quantity: map['quantity']?.toDouble() ?? 0.0,
        price: map['price']?.toDouble() ?? 0.0,
        images: List<String>.from((map['images'])),
        category: map['category'] != null ? map['category'] as String : '',
        id: map['_id'],
        rating: map['ratings'] != null
            ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
            : null);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
