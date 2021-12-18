import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController trackidController = TextEditingController();
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
        appBar: myappbar(context, size, Colors.white),
        bottomNavigationBar: TheBottomNavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                whitespace(context, 3.5, 0),
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
                    controller: trackidController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Ionicons.analytics_outline,
                          color: basiccolor,
                        ),
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(.8)),
                        hintText: "Tracking ID"),
                  ),
                ),
                whitespace(context, 2, 0),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: Text('Track'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: basiccolor,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
