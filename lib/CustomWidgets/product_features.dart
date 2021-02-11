import 'package:flutter/material.dart';

import 'custom_clickable_button.dart';

class ProductFeatures extends StatelessWidget {
  final IconData icon;
  final String title;

  ProductFeatures({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    var titleSplit = title.split(" ");
    ThemeData getTheme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7.0),
          child: CustomClickableButton(
            buttonColor: getTheme.primaryColor.withOpacity(0.2),
            borderRadius: 8.0,
            iconColor: getTheme.primaryColor,
            icon: icon,
            insidePadding: EdgeInsets.all(3.0),
          ),
        ),
        Text(
          "${titleSplit[0]}\n${titleSplit[1]}",
          style: getTheme.textTheme.caption,
        ),
      ],
    );
  }
}
