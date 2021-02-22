import 'package:flutter/material.dart';
import 'package:pots_n_plants/View/address_page.dart';
import 'package:pots_n_plants/View/contact_us_page.dart';
import 'package:pots_n_plants/View/login_page.dart';
import 'package:pots_n_plants/View/saved_cards.dart';
import 'package:pots_n_plants/View/user_profile_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    MediaQueryData getMediaQ = MediaQuery.of(context);
    return SafeArea(
      child: Container(
        width: getMediaQ.size.width * 0.65,
        child: Drawer(
          child: Container(
            color: getTheme.canvasColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/images/avatar_image.jpg'),
                        ),
                        Text("User Name"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text('My Profile'),
                        onTap: () => {
                          Navigator.pop(context),
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserProfileScreen();
                          }))
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.location_city_outlined),
                        title: Text('Saved Address'),
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return AddressPage();
                          }))
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Orders'),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(Icons.credit_card_outlined),
                        title: Text('Saved Cards'),
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return SavedCards();
                          }))
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.star_border_outlined),
                        title: Text('Review App'),
                        onTap: () => {Navigator.of(context).pop()},
                      ),
                      ListTile(
                        leading: Icon(Icons.call_rounded),
                        title: Text('Contact Us'),
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ContactUsPage();
                          }))
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.login_rounded),
                        title: Text('Sign In'),
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }))
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
