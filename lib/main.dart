import 'package:flutter/material.dart';

import 'View/welcome_screen_with_logo.dart';
import 'customMainTheme.dart';

void main() {
  runApp(PotsNPlants());
}

class PotsNPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getCustomTheme(),
      home: WelcomeScreenWithLogo(),
    );
  }
}
