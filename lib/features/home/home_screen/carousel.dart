import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatelessWidget {
  const CarouselImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: GlobalVariables.carouselImages.length,
        itemBuilder: (context, index, realIndex) {
          return Image.network(
              fit: BoxFit.cover, GlobalVariables.carouselImages[index]);
        },
        options: CarouselOptions(viewportFraction: 1, height: 200));
  }
}
