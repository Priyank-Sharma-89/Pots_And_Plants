import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Color hintTextColor;
  final Color prefixIconColor;

  CustomSearchBar(
      {this.backgroundColor, this.borderColor, this.borderRadius, this.hintTextColor, this.prefixIconColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Container(
        margin: EdgeInsets.only(top: 4.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 0.0),
          ),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(0.0),
            hintText: 'Search',
            hintStyle: TextStyle(
              color: hintTextColor ?? Colors.black,
            ),
            prefixIcon: Icon(
              Icons.search_outlined,
              color: prefixIconColor ?? Colors.black,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
