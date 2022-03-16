import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({Key? key}) : super(key: key);

  @override
  _ChangeAddressScreenState createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    TextEditingController shippingaddressController =
        new TextEditingController();
    return Scaffold(
        appBar: myappbar(context, size, Colors.grey.shade100),
        bottomNavigationBar: TheBottomNavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                whitespace(context, 6, 0),
                Text(
                  "Ented your new shipping address here.",
                  style:
                      GoogleFonts.openSans(color: Colors.black87, fontSize: 17),
                ),
                whitespace(context, 1.5, 0),
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
                    controller: shippingaddressController,
                    keyboardType: TextInputType.multiline,
                    minLines: 3, //Normal textInputField will be displayed
                    maxLines: 10, // when user presses enter it will adapt to it
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
                    ),
                  ),
                ),
                whitespace(context, 3.5, 0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(8.0))),
                    onPressed: () {
                      // Navigator.pushNamed(context, 'LoginScreen');
                    },
                    child: Text(
                      "Change",
                      style: TextStyle(color: basiccolor, fontSize: 17.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
