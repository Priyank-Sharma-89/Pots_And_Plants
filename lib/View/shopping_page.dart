import 'package:flutter/material.dart';
import 'package:pots_n_plants/CustomWidgets/carousel_slider.dart';
import 'package:pots_n_plants/CustomWidgets/customSearchBar.dart';
import 'package:pots_n_plants/CustomWidgets/custom_drawer.dart';
import 'package:pots_n_plants/CustomWidgets/horizontal_scrollable_products_row.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (_key.currentState.isDrawerOpen) {
          Navigator.of(context).pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: CustomSearchBar(
            backgroundColor: Color(0xFFfcfcfb),
            borderColor: getTheme.primaryColor,
            borderRadius: 8.0,
            hintTextColor: Colors.grey,
            prefixIconColor: getTheme.primaryColor,
          ),
          backgroundColor: getTheme.canvasColor,
          elevation: 0,
        ),
        drawer: CustomDrawer(),
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ListView(
                children: [
                  CarouselImages(),
                  SizedBox(
                    height: 40,
                  ),
                  HorizontalScrollableProductRow(
                    productCategory: "Indoor Plants",
                  ),
                  HorizontalScrollableProductRow(
                    productCategory: "Terrace Plants",
                  ),
                  HorizontalScrollableProductRow(
                    productCategory: "Garden Plants",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
