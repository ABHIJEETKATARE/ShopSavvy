import 'dart:io';

import 'package:amazon_tutorial/colors/global_variables.dart';
import 'package:amazon_tutorial/features/admin/services/admin_service.dart';
import 'package:amazon_tutorial/features/admin/widgets/filepiker.dart';
import 'package:amazon_tutorial/models/product.dart';
import 'package:amazon_tutorial/reusable/custom_button.dart';
import 'package:amazon_tutorial/reusable/custom_textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:flutter/widgets.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});
  static const String routeName = "AddProduct";
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final List<DropdownMenuItem> categories = [
    const DropdownMenuItem(
      value: 0,
      child: Text("Mobiles"),
    ),
    const DropdownMenuItem(
      value: 1,
      child: Text("Essentials"),
    ),
    const DropdownMenuItem(
      value: 2,
      child: Text("Appliances"),
    ),
    const DropdownMenuItem(
      value: 3,
      child: Text("Books"),
    ),
    const DropdownMenuItem(
      value: 4,
      child: Text("Fashion"),
    ),
  ];
  final List<String> categoriesText = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion"
  ];
  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<File> images = [];
  void selectImages() async {
    final result = await pickImages();
    setState(() {
      images = result;
    });
  }

  final _addProductFormKey = GlobalKey<FormState>();
  AdminServices adminServices = AdminServices();
  int categoryValue = 0;
  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          quantity: double.parse(quantityController.text),
          price: double.parse(priceController.text),
          images: images,
          category: categoriesText[categoryValue]);
    }
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/amazon_in.png",
                    width: 120,
                    height: 40,
                  ),
                ),
                const Text(
                  "Admin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images
                            .map((e) => Image.file(
                                  e,
                                  height: 20,
                                  fit: BoxFit.cover,
                                ))
                            .toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ))
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          radius: const Radius.circular(10),
                          strokeWidth: 2,
                          strokeCap: StrokeCap.square,
                          dashPattern: const [10, 4],
                          borderType: BorderType.RRect,
                          borderPadding:
                              const EdgeInsets.symmetric(horizontal: 10)
                                  .copyWith(top: 10),
                          color: Colors.black,
                          padding: EdgeInsets.all(10),
                          child: Container(
                            // margin: const EdgeInsets.symmetric(horizontal: 10)
                            //     .copyWith(top: 10),
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Select Product Images",
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
                customtextfield(
                    controller: productNameController,
                    hintText: "Product Name"),
                SizedBox(
                  height: 10,
                ),
                customtextfield(
                  controller: descriptionController,
                  hintText: "description",
                  maxilines: 7,
                ),
                SizedBox(
                  height: 10,
                ),
                customtextfield(
                  controller: priceController,
                  hintText: "price",
                ),
                SizedBox(
                  height: 10,
                ),
                customtextfield(
                  controller: quantityController,
                  hintText: "quantity",
                  maxilines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: categoryValue,
                    items: categories,
                    onChanged: (v) {
                      setState(() {
                        categoryValue = v;
                      });
                    },
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                customButton(
                  onTap: sellProduct,
                  title: "Sell",
                )
              ]),
            ),
          ),
        ));
  }
}
