import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/auth/authControllers.dart';
import 'package:muglimart_quicktech/features/auth/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneemailController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(left: size.width * 2.6, right: size.width * 2.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 5,
              ),
              Text(
                "Create a new account",
                style: TextStyle(
                  color: basiccolor,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: size.height * 3.5,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: basiccolor,
                    width: 0.58,
                  ),
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: InputBorder.none,
                      prefixIcon:
                          //  FaIcon(
                          //   FontAwesomeIcons.box,
                          //   color: basiccolor,
                          // ),
                          Icon(
                        Icons.account_circle_outlined,
                        color: basiccolor,
                      ),
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Name"),
                ),
              ),
              SizedBox(
                height: size.height * 2,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: basiccolor,
                    width: 0.58,
                  ),
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: basiccolor,
                      ),
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Email"),
                ),
              ),
              SizedBox(
                height: size.height * 2,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: basiccolor,
                    width: 0.58,
                  ),
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: phoneemailController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.phone_enabled_outlined,
                        color: basiccolor,
                      ),
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Phone"),
                ),
              ),
              SizedBox(
                height: size.height * 2,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: basiccolor,
                    width: 0.58,
                  ),
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.password,
                        color: basiccolor,
                      ),
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                      hintText: "Password"),
                ),
              ),
              SizedBox(
                height: size.height * 3.5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
                  onPressed: () {
                    // Navigator.pushNamed(context, 'LoginScreen');
                    signup(nameController.text, phoneemailController.text,
                        passwordController.text);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: basiccolor, fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signup(String name, String phone, String password) async {
    var data = {"fullName": name, "phoneNumber": phone, "password": password};

    try {
      http.Response response = await http.post(
        Uri.parse("https://muglimart.com/api/v1/customer/register"),
        body: data,
      );
      print("Response Body  : " + response.body);
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body.toString());
        print("This is jsondata ");
        print("JsonData   :   " + jsondata['status'].toString());
        if (jsondata['status'] == "success") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      } else {
        print("No jsondata");
      }
    } catch (e) {
      print(e);
    }

    // var response = await AuthtController().signup(data);
    // var body = jsonDecode(response.body);

    // if (body['status'] == "success") {
    //   print(body['status']);
    //   Navigator.pushNamed(context, "HomeScreen");
    // } else {
    //   print(body);
    // }
  }

  Widget ShowToast() {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: const Text(
        'this is a demo alert diolog',
        style: TextStyle(color: Colors.red),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  showDialogue() {
    return CupertinoAlertDialog(
      title: const Text('AlertDialog Title'),
      content: const Text(
        'this is a demo alert diolog',
        style: TextStyle(color: Colors.red),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
