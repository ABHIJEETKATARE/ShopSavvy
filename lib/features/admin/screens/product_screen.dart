import 'package:amazon_tutorial/features/admin/services/admin_service.dart';
import 'package:amazon_tutorial/features/admin/widgets/add_product_screen.dart';
import 'package:amazon_tutorial/features/admin/widgets/loader.dart';
import 'package:amazon_tutorial/features/profile/orders/singleitem.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  AdminServices adminServices = AdminServices();
  List<Product>? products;
  void addProductCall() {
    Navigator.of(context).pushNamed(AddProduct.routeName);
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            tooltip: "Add a Product",
            shape: CircleBorder(),
            foregroundColor: Colors.black,
            onPressed: addProductCall,
            child: const Icon(Icons.add)),
        body: products == null
            ? Loader()
            : GridView.builder(
                itemCount: products!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 140,
                          child:
                              SingleProduct(image: products![index].images[0])),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              products![index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                deleteProduct(products![index], index);
                              },
                              icon: Icon(Icons.delete_outline))
                        ],
                      )
                    ],
                  );
                },
              ));
  }
}
