import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pots_n_plants/CustomWidgets/custom_drawer.dart';

import 'homepage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int productQuantity = 1;
  int productPrice = 30;
  int productTotal = 0;
  int totalBill = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cart",
          style: getTheme.textTheme.headline6,
        ),
        backgroundColor: getTheme.canvasColor,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 5.0,
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
                                              image: CachedNetworkImageProvider(
                                                  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/monstera-baby-plant-royalty-free-image-1133859657-1553276209.jpg"),
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Jade Plant",
                                                style: getTheme.textTheme.subtitle1,
                                              ),
                                              Text(
                                                "\u20B9 30",
                                                style:
                                                    getTheme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Total: \u20B9 $productTotal",
                                            style: getTheme.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.delete,
                                    size: 18,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.accentColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (productQuantity == 1) return;
                                            productQuantity--;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                      Text(
                                        "  $productQuantity  ",
                                        style: getTheme.textTheme.subtitle2,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.primaryColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            productQuantity++;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5.0,
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
                                              image: CachedNetworkImageProvider(
                                                  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/monstera-baby-plant-royalty-free-image-1133859657-1553276209.jpg"),
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Jade Plant",
                                                style: getTheme.textTheme.subtitle1,
                                              ),
                                              Text(
                                                "\u20B9 30",
                                                style:
                                                    getTheme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Total: \u20B9 $productTotal",
                                            style: getTheme.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.delete,
                                    size: 18,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.accentColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (productQuantity == 1) return;
                                            productQuantity--;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                      Text(
                                        "  $productQuantity  ",
                                        style: getTheme.textTheme.subtitle2,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.primaryColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            productQuantity++;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5.0,
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
                                              image: CachedNetworkImageProvider(
                                                  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/monstera-baby-plant-royalty-free-image-1133859657-1553276209.jpg"),
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Jade Plant",
                                                style: getTheme.textTheme.subtitle1,
                                              ),
                                              Text(
                                                "\u20B9 30",
                                                style:
                                                    getTheme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Total: \u20B9 $productTotal",
                                            style: getTheme.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.delete,
                                    size: 18,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.accentColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (productQuantity == 1) return;
                                            productQuantity--;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                      Text(
                                        "  $productQuantity  ",
                                        style: getTheme.textTheme.subtitle2,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.primaryColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            productQuantity++;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5.0,
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
                                              image: CachedNetworkImageProvider(
                                                  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/monstera-baby-plant-royalty-free-image-1133859657-1553276209.jpg"),
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Jade Plant",
                                                style: getTheme.textTheme.subtitle1,
                                              ),
                                              Text(
                                                "\u20B9 30",
                                                style:
                                                    getTheme.textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Total: \u20B9 $productTotal",
                                            style: getTheme.textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.delete,
                                    size: 18,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.accentColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            if (productQuantity == 1) return;
                                            productQuantity--;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                      Text(
                                        "  $productQuantity  ",
                                        style: getTheme.textTheme.subtitle2,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: getTheme.primaryColor.withOpacity(0.5),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            productQuantity++;
                                            productTotal = productQuantity * productPrice;
                                            totalBill = productTotal;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Bill",
                              style: getTheme.textTheme.bodyText1,
                            ),
                            Text(
                              totalBill == null ? "\u20B9 0" : "\u20B9 $totalBill",
                              style: getTheme.textTheme.bodyText1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Cost",
                              style: getTheme.textTheme.bodyText1,
                            ),
                            Text(
                              "Free",
                              style: getTheme.textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: getTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 2.0),
                                        child: Center(
                                          child: Text(
                                            "Continue Shopping",
                                            textAlign: TextAlign.center,
                                            style: getTheme.textTheme.subtitle1.copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                          return HomePage();
                                        }));
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: getTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: GestureDetector(
                                      child: Center(
                                        child: Text(
                                          "Place Order",
                                          textAlign: TextAlign.center,
                                          style: getTheme.textTheme.subtitle1.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
