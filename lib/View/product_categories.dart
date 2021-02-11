import 'package:flutter/material.dart';
import 'package:pots_n_plants/CustomWidgets/custom_drawer.dart';

class ProductCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getTheme.canvasColor,
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(4, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Image.network(
                      'https://www.pots-plants.com/assets/img/product/1.png',
                      fit: BoxFit.cover,
                      height: 120,
                      width: 150,
                    ),
                    clipBehavior: Clip.antiAlias,
                  ),
                  Text(
                    'Indoor Plants',
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
