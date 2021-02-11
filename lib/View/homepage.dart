import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pots_n_plants/View/product_categories.dart';
import 'package:pots_n_plants/View/shopping_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'cart_page.dart';
import 'favourites.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final List<Widget> _pages = [
    ShoppingPage(),
    ProductCategories(),
    Favourites(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData getThemeContext = Theme.of(context);
    return Scaffold(
      backgroundColor: getThemeContext.canvasColor,
      body: _pages[currentPage],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentPage,
        onTap: (index) => setState(() => currentPage = index),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Home"),
            selectedColor: getThemeContext.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.auto_awesome_mosaic),
            title: Text("Categories"),
            selectedColor: getThemeContext.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            title: Text("Favourites"),
            selectedColor: getThemeContext.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Cart"),
            selectedColor: getThemeContext.primaryColor,
          )
        ],
      ),
    );
  }
}
