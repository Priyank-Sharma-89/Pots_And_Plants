import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pots_n_plants/Modal/productImage.dart';
import 'package:pots_n_plants/View/product_detail_page.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productCategory),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: productImageList.length,
            itemBuilder: (context, index) {
              ProductImage product = productImageList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        productName: product.name,
                        productImage: product.imgURL,
                        productPrice: product.price,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: OctoImage.fromSet(
                          image: CachedNetworkImageProvider("${product.imgURL}"),
                          octoSet: OctoSet.blurHash(
                              'L6Pj42jE.AyE_3t7t7R**0o#DgR4'), // find blurhash string from https://blurha.sh/
                          fit: BoxFit.fill,
                          // width: double.infinity,
                          // height: 160,
                        ),
                        // child: Image.network(
                        //   '${product.imgURL}',
                        //   fit: BoxFit.cover,
                        //   // height: 120,
                        //   width: double.infinity,
                        // ),
                      ),
                      Text(
                        '${product.name}',
                      ),
                      Text(
                        '\u20B9 ${product.price}',
                      )
                    ],
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.3 : 1.3);
            },
          ),
        ),
      ),
    );
  }
}
