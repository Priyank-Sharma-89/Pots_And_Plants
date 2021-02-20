import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:pots_n_plants/Modal/carouselImage.dart';

class CarouselImages extends StatefulWidget {
  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int _current = 0;
  var carouselResponse;
  List carouselDecodedData = [];
  List<CarouselImage> carouselImageList = [];

  Future getProductsJsonData() async {
    carouselResponse = await rootBundle.loadString("assets/carouselimages.json");
    carouselDecodedData = jsonDecode(carouselResponse);
    carouselImageList = carouselDecodedData.map((json) => CarouselImage.fromJson(json)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProductsJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 210.0,
        initialPage: 0,
        enlargeCenterPage: false,
        autoPlay: true,
        reverse: false,
        enableInfiniteScroll: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 3000),
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      items: carouselImageList.map((carouselImg) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: OctoImage.fromSet(
                  image: CachedNetworkImageProvider("${carouselImg.imgURL}"),
                  octoSet:
                      OctoSet.blurHash('L6Pj42jE.AyE_3t7t7R**0o#DgR4'), // find blurhash string from https://blurha.sh/
                  fit: BoxFit.fill,
                  // width: double.infinity,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
