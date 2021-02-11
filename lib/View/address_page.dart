import 'package:flutter/material.dart';

import 'add_address.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Book"),
        backgroundColor: getTheme.canvasColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: Icon(Icons.add),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddAddress();
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
              Image.asset("assets/icon/location.png"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "You have no address saved yet",
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
