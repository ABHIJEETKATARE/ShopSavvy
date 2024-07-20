import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/admin/widgets/loader.dart';
import 'package:amazon_tutorial/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:amazon_tutorial/services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = "/category-deals";
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList = [];
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  void fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Text(
              widget.category,
              style: const TextStyle(color: Colors.black),
            ),
          )),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'keep shopping for ${widget.category}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.5),
                    itemCount: productList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = productList![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                                  context, ProductDetailScreen.routeName,
                                  arguments: product)
                              .then((value) {
                            fetchCategoryProducts();
                            setState(() {});
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(product.images[index]),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                  left: 0, top: 5, right: 15),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
