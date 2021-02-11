import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pots_n_plants/CustomWidgets/contact_page_card.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final String phoneNumber = "9999988888";
  final String email = "support@potsnplants.in";
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("Could not launch $command");
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        backgroundColor: getTheme.canvasColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ContactPageCard(
                cardExternalPadding: 12.0,
                cardElevation: 5.0,
                leadingIcon: Icons.support_agent_outlined,
                title: phoneNumber,
                subTitle: "(Mon - Fri: 10:00 AM to 8 PM)",
                actionOnTap: () => customLaunch("tel: $phoneNumber"),
              ),
              ContactPageCard(
                cardExternalPadding: 12.0,
                cardElevation: 5.0,
                leadingIcon: Icons.chat_outlined,
                title: phoneNumber,
                subTitle: "Whatsapp",
                actionOnTap: () => customLaunch("whatsapp://send?phone=+91$phoneNumber"),
              ),
              ContactPageCard(
                cardExternalPadding: 12.0,
                cardElevation: 5.0,
                leadingIcon: Icons.email_outlined,
                title: email,
                subTitle: "Write to us",
                actionOnTap: () => customLaunch("mailto: $email"),
              ),
              ContactPageCard(
                cardExternalPadding: 12.0,
                cardElevation: 5.0,
                leadingIcon: Icons.location_on_outlined,
                title: "Udyog Bhawan, Patel Road",
                subTitle: "New Delhi - 36",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
