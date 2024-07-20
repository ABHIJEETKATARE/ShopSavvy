import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/product_details/services/product_details_services.dart';
import 'package:amazon_tutorial/features/search/screens/search_screen.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:amazon_tutorial/providers/user_provider.dart';
import 'package:amazon_tutorial/reusable/custom_button.dart';
import 'package:amazon_tutorial/reusable/stars.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = "/product-details";
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double avgRating = 0;
  double myRating = 0;
  ProductDetailsServices productDetailsServices = ProductDetailsServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double totalRating = 0;
    for (var i = 0; i < (widget.product.rating!.length); i++) {
      totalRating += widget.product.rating![i].rating;
      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / (widget.product.rating!.length);
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        navigateToSearchScreen(value);
                      },
                      decoration: InputDecoration(
                          prefixIcon: const InkWell(
                            child: Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(96, 150, 52, 52),
                                  width: 1)),
                          hintText: "Amazon.in",
                          hintStyle: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                  ),
                )),
                Container(
                  height: 42,
                  color: Colors.transparent,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(
                    Icons.mic,
                    size: 25,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.id!,
                  ),
                  Stars(rating: avgRating),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            CarouselSlider(
                items: widget.product.images.map((i) {
                  return Builder(
                    builder: (context) {
                      return Image.network(
                        i,
                        fit: BoxFit.contain,
                        height: 200,
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                )),
            Container(
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                    text: 'Deal Price: ',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: '\$${widget.product.price}',
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.red,
                              fontWeight: FontWeight.w500))
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              height: 5,
              color: Colors.black12,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: customButton(
                onTap: () {},
                title: "Buy Now",
                color: const Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: customButton(
                onTap: () {},
                title: "Add To Cart",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Rate the Product",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            RatingBar.builder(
                allowHalfRating: true,
                minRating: 1,
                initialRating: myRating,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, value) {
                  return const Icon(
                    Icons.star,
                    color: GlobalVariables.secondaryColor,
                  );
                },
                onRatingUpdate: (rating) {
                  productDetailsServices.rateProduct(
                      context: context,
                      rating: rating,
                      product: widget.product);
                })
          ],
        ),
      ),
    );
  }
}
