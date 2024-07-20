import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/admin/widgets/loader.dart';
import 'package:amazon_tutorial/features/home/home_screen/address.dart';
import 'package:amazon_tutorial/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_tutorial/features/search/services/search_services.dart';
import 'package:amazon_tutorial/features/search/widget/searched_product.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/searchscreen";
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? productList = [];
  SearchServices searchServices = SearchServices();
  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  void fetchSearchedProduct() async {
    productList = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
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
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient),
              ),
              title: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(7),
                      child: TextFormField(
                        onFieldSubmitted: (value) =>
                            {navigateToSearchScreen(value)},
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search,
                                  size: 23,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide.none),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: const BorderSide(
                                    color:
                                        const Color.fromARGB(96, 150, 52, 52),
                                    width: 1)),
                            hintText: "Search Amazon.in",
                            hintStyle: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  )),
                  Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      Icons.mic,
                      color: Colors.black,
                      size: 25,
                    ),
                  )
                ],
              ),
            )),
        body: productList == null
            ? const Loader()
            : Column(
                children: [
                  const Address(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: productList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                      context, ProductDetailScreen.routeName,
                                      arguments: productList![index])
                                  .then((value) {
                                fetchSearchedProduct();
                                setState(() {});
                              });
                            },
                            child:
                                SearchedProduct(product: productList![index]));
                      },
                    ),
                  )
                ],
              ));
  }
}
