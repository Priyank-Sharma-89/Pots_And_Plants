import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pots_n_plants/CustomWidgets/product_features.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final int productPrice;
  final String productImage;

  ProductDetailPage({this.productName, this.productPrice, this.productImage});

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: Color(0xFFf0faf4),
      appBar: AppBar(
        // iconTheme: IconThemeData(
        //   color: Colors.white,
        // ),
        backgroundColor: Color(0xFFf0faf4),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              child: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(productName, style: getTheme.textTheme.headline4.copyWith(color: Colors.black)),
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: OctoImage.fromSet(
                        image: CachedNetworkImageProvider("$productImage"),
                        octoSet: OctoSet.blurHash(
                            'L6Pj42jE.AyE_3t7t7R**0o#DgR4'), // find blurhash string from https://blurha.sh/
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProductFeatures(
                            icon: Icons.timelapse_sharp,
                            title: "24 Hours",
                          ),
                          ProductFeatures(
                            icon: Icons.height,
                            title: "3.2\" Height",
                          ),
                          ProductFeatures(
                            icon: Icons.water_damage_outlined,
                            title: "70% Humidity",
                          ),
                          ProductFeatures(
                            icon: Icons.wb_sunny_outlined,
                            title: "98Pi Oxygen",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Category",
                      style: getTheme.textTheme.caption,
                    ),
                    Text(
                      "Indoor",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Family",
                      style: getTheme.textTheme.caption,
                    ),
                    Text(
                      "Cactus",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Soil",
                      style: getTheme.textTheme.caption,
                    ),
                    Text(
                      "Potting Mix",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    "About",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: double.infinity,
                  child: Text(
                    "This type of cactus is most in demand "
                    "because of its simple shape. This cactus can also "
                    "survive outdoors.",
                    style: getTheme.textTheme.caption,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: getTheme.primaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(
                //   color: Colors.grey,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price"),
                    Row(
                      children: [
                        Text(
                          "\u20B9 98.99",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("\u20B9 $productPrice"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: getTheme.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                child: GestureDetector(
                  child: Text(
                    "Add to Cart",
                    textAlign: TextAlign.center,
                    style: getTheme.textTheme.subtitle1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
