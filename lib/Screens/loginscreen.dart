import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Controllers/authControllers.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneemailController = new TextEditingController();

  var auth = AuthtController();

  final authStorage = GetStorage();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: size.height * 40,
              width: double.infinity,
              color: basiccolor,
              child: Container(
                // margin: EdgeInsets.all(10),
                height: size.height * 30,
                width: size.width * 80,
                // color: Colors.red,
                child: Image.asset('assets/images/banner.png'),
              ),

              //   Text(
              //     "MugliMart",
              //     style: GoogleFonts.lobster(
              //         textStyle: TextStyle(
              //       color: Colors.white,
              //       fontSize: size.height * 6,
              //     )),
              //     // TextStyle(
              //     //   color: Colors.white,
              //     //   fontSize: size.height * 6,
              //     //   fontStyle: FontStyle.italic,
              //     // ),
              //   ),
            ), //TODO for logo
            SizedBox(
              height: size.height * 5,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 3.5, right: size.width * 3.5),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Phone or Email",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.left,
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: basiccolor,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            hintText: "Enter your Phone or Email"),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 2,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.left,
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
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                              color: basiccolor,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(.8)),
                            hintText: "Password"),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 5,
                    ),
                    TextButton(
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(8.0))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          printfunction();
                          auth.login(phoneemailController.text,
                              passwordController.text);
                          // Navigator.pushNamed(context, 'HomeScreen');
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: basiccolor, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 2),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have account?",
                          ),
                          SizedBox(
                            width: size.width * 2,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'SignUpScreen');
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(String phone, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("https://muglimart.com/api/v1/customer/login"),
          body: {'phoneNumber': phone, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var token = data['token'];
        print(data['token'].toString());
        print("abc");
      } else {
        var data = jsonDecode(response.body.toString());
        print(data['error']);
        print("Not worked");
      }
    } catch (e) {
      print(e);
    }
  }

  void printfunction() {
    print("abcde");
  }
}
