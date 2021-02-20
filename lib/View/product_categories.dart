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
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            shrinkWrap: true,
            children: List.generate(4, (index) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/an-alocasia-plant-in-a-green-pot-on-wooden-table-royalty-free-image-1132823763-1551727929.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      'Indoor Plants',
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
