import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pots_n_plants/CustomWidgets/custom_drawer.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController textFieldController = TextEditingController();
  Future<dynamic> changeDetail(BuildContext context, String hintText) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: hintText.contains("Mobile") == true
              ? TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                )
              : TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                  ),
                ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Cancel"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("Save"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData getTheme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: getTheme.canvasColor,
        elevation: 0.0,
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  child: Icon(Icons.camera_alt_outlined),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: getTheme.textTheme.caption,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Priyank Sharma",
                            style: getTheme.textTheme.subtitle1,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeDetail(context, "Enter Name Here...");
                            },
                            // onTap: () {
                            //   return showDialog(
                            //     context: context,
                            //     builder: (context) => AlertDialog(
                            //       content: TextField(
                            //         decoration: InputDecoration(
                            //           hintText: "Write here ...",
                            //         ),
                            //       ),
                            //       actions: <Widget>[
                            //         FlatButton(
                            //           onPressed: () {
                            //             Navigator.of(context).pop();
                            //           },
                            //           child: Text("Save"),
                            //         ),
                            //       ],
                            //     ),
                            //   );
                            // },
                            child: Icon(Icons.edit),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone No.",
                        style: getTheme.textTheme.caption,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "9911372282",
                            style: getTheme.textTheme.subtitle1,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeDetail(context, "Enter New Mobile No.");
                            },
                            child: Text("Change"),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: getTheme.textTheme.caption,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "abc@gmail.com",
                            style: getTheme.textTheme.subtitle1,
                          ),
                          GestureDetector(
                            onTap: () {
                              changeDetail(context, "Enter New Email");
                            },
                            child: Text("Edit"),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: getTheme.textTheme.caption,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "XXXXXX",
                            style: getTheme.textTheme.subtitle1.copyWith(color: Colors.grey),
                          ),
                          GestureDetector(
                            child: Text("Change"),
                          )
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
