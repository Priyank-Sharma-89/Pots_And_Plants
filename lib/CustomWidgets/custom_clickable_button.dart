import 'package:flutter/material.dart';

class CustomClickableButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color buttonColor;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets buttonMargin;
  final Function actionOnTap;
  final EdgeInsets insidePadding;

  CustomClickableButton(
      {@required this.icon,
      this.iconColor,
      this.buttonColor,
      this.borderColor,
      this.borderRadius,
      this.buttonMargin,
      this.actionOnTap,
      this.insidePadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.transparent,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 0.0),
        ),
      ),
      margin: buttonMargin ?? EdgeInsets.all(0),
      child: Padding(
        padding: insidePadding ?? const EdgeInsets.all(0.0),
        child: GestureDetector(
          onTap: () {
            actionOnTap();
          },
          child: Icon(
            icon,
            color: iconColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
