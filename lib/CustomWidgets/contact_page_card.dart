import 'package:flutter/material.dart';

class ContactPageCard extends StatelessWidget {
  final double cardExternalPadding;
  final double cardElevation;
  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final Function actionOnTap;

  ContactPageCard(
      {this.cardExternalPadding, this.cardElevation, this.leadingIcon, this.title, this.subTitle, this.actionOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(cardExternalPadding),
      child: Card(
        elevation: cardElevation ?? 5.0,
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                leadingIcon,
                color: Colors.green,
              ),
            ],
          ),
          title: Text(title),
          subtitle: Text(subTitle),
          trailing: Icon(
            Icons.keyboard_arrow_right_rounded,
          ),
          onTap: () {
            actionOnTap();
          },
        ),
      ),
    );
  }
}
