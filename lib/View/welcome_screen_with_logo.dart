import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class WelcomeScreenWithLogo extends StatefulWidget {
  @override
  _WelcomeScreenWithLogoState createState() => _WelcomeScreenWithLogoState();
}

class _WelcomeScreenWithLogoState extends State<WelcomeScreenWithLogo> {
  @override
  Widget build(BuildContext context) {
    ThemeData getThemeContext = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.navigate_next_rounded,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/welcome_screen_plant_image.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  child: Text(
                    "Plants are the best gift you can give",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: getThemeContext.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
