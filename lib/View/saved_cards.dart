import 'package:flutter/material.dart';

import 'Add_Card.dart';

class SavedCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Cards"),
        backgroundColor: getTheme.canvasColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddCard();
                }));
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: getTheme.primaryColor,
                radius: 80,
                child: Image.asset(
                  "assets/icon/credit-card.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "You have no cards saved yet",
                  style: getTheme.textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
