import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserRegistrationPage extends StatefulWidget {
  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  bool _showPassword = true;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image: new NetworkImage(
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bright-living-room-with-a-large-house-plant-copy-royalty-free-image-1580854667.jpg?crop=0.479xw:0.998xh;0.0241xw,0&resize=480:*'))),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Create Account",
                      style: getTheme.textTheme.headline1,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: firstNameController,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              hintText: "First Name",
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r"\s")),
                              LengthLimitingTextInputFormatter(15),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: lastNameController,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              hintText: "Last Name",
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r"\s")),
                              LengthLimitingTextInputFormatter(15),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
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
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            obscureText: _showPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: "Create Password",
                              suffixIcon: GestureDetector(
                                onTap: _togglePasswordVisibility,
                                child: _showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextField(
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: getTheme.primaryColor,
                          onPressed: () {
                            if (firstNameController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter first name",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                              return;
                            }
                            if (lastNameController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter last name",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                              return;
                            }
                            if (phoneNumberController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter mobile number",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                            } else if (phoneNumberController.text.length < 10) {
                              Fluttertoast.showToast(
                                  msg: "Mobile number is not valid",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                              return;
                            }
                            if (emailController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please provide valid email address",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                            } else if (validateEmail(emailController.text) == false) {
                              Fluttertoast.showToast(
                                  msg: "Please provide valid email address",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                              return;
                            }
                            if (passwordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Password cannot be blank",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                            } else if (passwordController.text.length < 6) {
                              Fluttertoast.showToast(
                                  msg: "Password is less than 6 characters",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                              return;
                            }
                            if (confirmPasswordController.text != passwordController.text) {
                              Fluttertoast.showToast(
                                  msg: "Password is not same",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 12.0);
                              return;
                            }
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
