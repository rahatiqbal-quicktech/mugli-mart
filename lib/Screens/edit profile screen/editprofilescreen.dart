import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Screens/edit%20profile%20screen/editprofile_textfield.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

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
}
