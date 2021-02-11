import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/splash_image.png"),
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              controller: phoneNumberController,
                              decoration: InputDecoration(
                                hintText: "Mobile Number",
                                prefixIcon: Icon(Icons.phone_android_outlined),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                "Get OTP",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            color: getTheme.primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 4,
                                fontSize: 20,
                              ),
                              controller: otpController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Text(
                            "OTP will enter automatically once received",
                            style: getTheme.textTheme.caption,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Resend OTP",
                              style: getTheme.textTheme.subtitle2,
                            ),
                          ),
                        ],
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
