import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pots_n_plants/Modal/productImage.dart';

class ProductCategoryDetailedScreen extends StatefulWidget {
  final String productCategory;

  ProductCategoryDetailedScreen({this.productCategory});

  @override
  _ProductCategoryDetailedScreenState createState() => _ProductCategoryDetailedScreenState();
}

class _ProductCategoryDetailedScreenState extends State<ProductCategoryDetailedScreen> {
  var productImgResponse;
  List productImgDecodedData = [];
  List<ProductImage> productImageList = [];

  Future getProductsJsonData() async {
    productImgResponse = await rootBundle.loadString("assets/productimages.json");
    productImgDecodedData = jsonDecode(productImgResponse);

    productImageList = productImgDecodedData.map((json) => ProductImage.fromJson(json)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProductsJsonData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productCategory),
        backgroundColor: getTheme.canvasColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: ListView.builder(
            itemCount: productImageList.length,
            itemBuilder: (context, index) {
              ProductImage product = productImageList[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(right: 15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1.2,
                                  child: OctoImage.fromSet(
                                    image: CachedNetworkImageProvider("${product.imgURL}"),
                                    octoSet: OctoSet.blurHash(
                                        'L6Pj42jE.AyE_3t7t7R**0o#DgR4'), // find blurhash string from https://blurha.sh/
                                    // width: double.infinity,
                                    // height: 160,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${product.name}",
                                  style: getTheme.textTheme.subtitle1,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\u20B9 ${product.price}",
                                      style: getTheme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      "\u20B9 45",
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: getTheme.primaryColor),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              child: Text("Buy"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
