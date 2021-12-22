import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Models/EditProfileModel.dart';
import 'package:muglimart_quicktech/Screens/edit%20profile%20screen/editprofile_textfield.dart';
import 'package:muglimart_quicktech/Screens/profilescreen.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
              whitespace(context, 2, 0),
              EditProfileTextfield(
                basiccolor: basiccolor,
                controller: nameController,
                hinttext: "Name",
                icon: Icons.text_format,
                inputType: TextInputType.text,
              ),
              whitespace(context, 2, 0),
              EditProfileTextfield(
                basiccolor: basiccolor,
                controller: phoneController,
                hinttext: "Phone",
                icon: Icons.phone,
                inputType: TextInputType.number,
              ),
              whitespace(context, 2, 0),
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
                  controller: addressController,
                  keyboardType: TextInputType.multiline,
                  minLines: 2, //Normal textInputField will be displayed
                  maxLines: 5, // when user presses enter it will adapt to it
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.location_city,
                        color: basiccolor,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(.8),
                      ),
                      hintText: "Address"),
                ),
              ),
              whitespace(context, 3.5, 0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.all(8.0))),
                  onPressed: () {
                    updateprofile(nameController.text, phoneController.text);
                    // Navigator.pushNamed(context, 'LoginScreen');
                  },
                  child: Text(
                    "Update",
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

  final ForToken = GetStorage();

  Future updateprofile(String name, String number) async {
    // ForToken.write('LoginToken',
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVnbGltYXJ0LmNvbVwvYXBpXC92MVwvY3VzdG9tZXJcL2xvZ2luIiwiaWF0IjoxNjQwMTYyOTExLCJleHAiOjE2NDAxNjY1MTEsIm5iZiI6MTY0MDE2MjkxMSwianRpIjoib3RHdVNpUER5RUtpSTdHYyIsInN1YiI6NSwicHJ2IjoiOGI0MjJlNmY2NTc5MzJiOGFlYmNiMWJmMWUzNTZkZDc2YTM2NWJmMiJ9.gV_bkw25Tm8-61mSHH5GW6Mg8GpQI_P3mtZxqHVOam0');
    dynamic token = ForToken.read('LoginToken');
    try {
      http.Response response = await http.post(
          Uri.parse("https://muglimart.com/api/v1/customer/profile/update"),
          body: {
            'fullName': name,
            'phoneNumber': number,
          },
          headers: {
            'Authorization': 'Bearer $token',
          });

      var JsonData = json.decode(response.body);

      EditProfileModel editProfileModel = EditProfileModel.fromJson(JsonData);

      if (editProfileModel.status == "success") {
        print(editProfileModel.update!.fullName);
        print(editProfileModel.update!.phoneNumber);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      }
    } catch (e) {
      print(e);
    }
  }
}
