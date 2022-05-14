import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Models/EditProfileModel.dart';
import 'package:muglimart_quicktech/features/edit_profile/editprofile_textfield.dart';
import 'package:muglimart_quicktech/features/loading_dialog/loading_dialog.dart';
import 'package:muglimart_quicktech/features/profile/profilescreen.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  final int id;
  final name;
  final email;
  final phoneNumber;
  EditProfileScreen(
      {required this.id, this.name, this.email, this.phoneNumber, Key? key})
      : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    phoneController.text = widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.white70),
      bottomNavigationBar: TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              whitespace(context, 3.5, 0),
              Text(
                "Edit your profile",
                style: GoogleFonts.openSans(
                  color: basiccolor,
                  fontSize: 26,
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      whitespace(context, 2, 0),
                      EditProfileTextfield(
                        basiccolor: basiccolor,
                        controller: nameController,
                        hinttext: "Name",
                        validationRequired: false,
                        icon: Icons.text_format,
                        inputType: TextInputType.text,
                      ),
                      whitespace(context, 2, 0),
                      EditProfileTextfield(
                        basiccolor: basiccolor,
                        controller: phoneController,
                        hinttext: "Phone",
                        validationRequired: false,
                        icon: Icons.phone,
                        inputType: TextInputType.number,
                      ),
                      whitespace(context, 2, 0),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       color: basiccolor,
                      //       width: 0.58,
                      //     ),
                      //     color: Colors.white.withOpacity(0.8),
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: TextFormField(
                      //     controller: addressController,
                      //     keyboardType: TextInputType.multiline,
                      //     minLines: 2, //Normal textInputField will be displayed
                      //     maxLines: 5, // when user presses enter it will adapt to it
                      //     decoration: InputDecoration(
                      //         contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      //         border: InputBorder.none,
                      //         prefixIcon: Icon(
                      //           Icons.location_city,
                      //           color: basiccolor,
                      //         ),
                      //         hintStyle: TextStyle(
                      //           color: Colors.grey.withOpacity(.8),
                      //         ),
                      //         hintText: "Address"),
                      //   ),
                      // ),
                      // whitespace(context, 3.5, 0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(8.0))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              LoadingDialog().show(context);
                              updateprofile(
                                  nameController.text, phoneController.text);
                            }
                            // Navigator.pushNamed(context, 'LoginScreen');
                          },
                          child: Text(
                            "Update",
                            style: TextStyle(color: LogoColor, fontSize: 23),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  final ForToken = GetStorage();

  Future updateprofile(String name, String number) async {
    final box = GetStorage();
    try {
      http.Response response = await http.post(
        Uri.parse(
            "https://muglimart.com/api/customer/profile/update/${widget.id}"),
        body: {
          'fullName': name,
          'phoneNumber': number,
        },
      );

      var JsonData = json.decode(response.body);

      EditProfileModel editProfileModel = EditProfileModel.fromJson(JsonData);

      if (editProfileModel.status == "success") {
        box.write("fullName", editProfileModel.update!.fullName);
        box.write("phoneNumber", editProfileModel.update!.phoneNumber);
        box.write("email", editProfileModel.update!.email);
        LoadingDialog().dismiss();
        print(editProfileModel.update!.fullName);
        print(editProfileModel.update!.phoneNumber);
        Get.off(() => ProfileScreen());
        Fluttertoast.showToast(msg: "Profile Updated");
      }
    } catch (e) {
      LoadingDialog().dismiss();
      Fluttertoast.showToast(
          msg: "An unknown error has occured while updating your profile");
      print(e);
    }
  }

  // updateSavedValue
}
