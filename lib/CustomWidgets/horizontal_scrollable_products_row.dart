import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pots_n_plants/Modal/productImage.dart';
import 'package:pots_n_plants/View/product_category_detailed_screen.dart';
import 'package:pots_n_plants/View/product_detail_page.dart';

class HorizontalScrollableProductRow extends StatefulWidget {
  final String productCategory;

  HorizontalScrollableProductRow({this.productCategory});

  @override
  _HorizontalScrollableProductRowState createState() => _HorizontalScrollableProductRowState();
}

class _HorizontalScrollableProductRowState extends State<HorizontalScrollableProductRow> {
  var rating = 3.0;
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
    MediaQueryData getMediaQContext = MediaQuery.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.productCategory,
                style: getTheme.textTheme.subtitle1.copyWith(color: getTheme.primaryColor),
              ),
              GestureDetector(
                child: Text(
                  "See All",
                  style: getTheme.textTheme.caption,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProductCategoryDetailedScreen(
                      productCategory: widget.productCategory,
                    );
                  }));
                },
              ),
            ],
          ),
        ),
        Container(
          height: getMediaQContext.size.height * 0.25,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: productImageList.length,
            itemBuilder: (context, index) {
              ProductImage productImage = productImageList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: getMediaQContext.size.width * 0.35,
                child: Stack(children: [
                  Column(
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                  productName: productImage.name,
                                  productImage: productImage.imgURL,
                                  productPrice: productImage.price,
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: OctoImage.fromSet(
                              image: CachedNetworkImageProvider("${productImage.imgURL}"),
                              octoSet: OctoSet.blurHash(
                                  'L6Pj42jE.AyE_3t7t7R**0o#DgR4'), // find blurhash string from https://blurha.sh/
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 120,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.5),
                        child: Text(
                          "${productImage.name}",
                          textAlign: TextAlign.center,
                          style: getTheme.textTheme.caption,
                        ),
                      ),
                      Text(
                        "\u20B9 ${productImage.price}",
                        style: getTheme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 5,
                    top: 0,
                    child: GestureDetector(
                      child: Icon(
                        productImage.isFavourite == false ? Icons.favorite_border_outlined : Icons.favorite,
                        color: productImage.isFavourite == false ? Colors.black : Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          productImage.isFavourite = !productImage.isFavourite;
                        });
                      },
                    ),
                  )
                ]),
              );
            },
          ),
        ),
      ],
    );
  }
}
