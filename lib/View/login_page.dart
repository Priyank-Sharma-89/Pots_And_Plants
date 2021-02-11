import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pots_n_plants/View/user_registration_page.dart';

import 'otp_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = true;
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage("assets/images/living_room_pot.jpg"),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              hintText: "Registered Mobile Number",
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            obscureText: _showPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: GestureDetector(
                                onTap: _togglePasswordVisibility,
                                child: _showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              color: getTheme.primaryColor,
                              onPressed: () {
                                if (phoneNumberController.text.isEmpty || passwordController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Username or Password is blank",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 12.0);
                                }
                              },
                              child: Text("Login"),
                            ),
                            RaisedButton(
                              color: getTheme.primaryColor,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return OTPScreen();
                                }));
                              },
                              child: Text("Login with OTP"),
                            ),
                          ],
                        ),
                        FlatButton(
                          onPressed: () {
                            //later
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Don't have an account! Get it in 2 easy steps"),
                        RaisedButton(
                          color: getTheme.primaryColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserRegistrationPage(),
                              ),
                            );
                          },
                          child: Text("Register"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
