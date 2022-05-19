import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Widgets/check_log_in.dart';
import 'package:muglimart_quicktech/features/auth/loginscreen.dart';
import 'package:muglimart_quicktech/features/auth/signupscreen.dart';
import 'package:muglimart_quicktech/features/category/categoriesscreen.dart';
import 'package:muglimart_quicktech/features/edit_profile/editprofilescreen.dart';
import 'package:muglimart_quicktech/features/home/homescreen.dart';
import 'package:muglimart_quicktech/features/logout/logout.dart';
import 'package:muglimart_quicktech/features/profile/profilescreen.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';
import 'package:muglimart_quicktech/functions/get_saved_values.dart';

int? selectedindex;

Widget navbar(BuildContext context, IconData icon, bool status, int index) {
  return GestureDetector(
    onTap: () {
      // setState(() {
      //   selectedindex = index;
      // });
    },
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        // color: Colors.white
        color: index == selectedindex
            ? Colors.black.withOpacity(0.7)
            : Colors.white,
      ),
      child: Icon(icon, color: status ? Colors.white : basiccolor),
    ),
  );
}

Future bottommodal(BuildContext context) => showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        children: [
          ListTile(
            title: const Text("Categories"),
            leading: const Icon(Icons.ac_unit),
            onTap: () {
              Navigator.pushNamed(context, 'UnderConstructionScreen');
            },
          ),
          ListTile(
            title: Text("Categories"),
            leading: Icon(Icons.ac_unit),
          ),
          ListTile(
            title: Text("Categories"),
            leading: Icon(Icons.ac_unit),
          ),
        ],
      );
    });

Widget modalcollumn(BuildContext context) {
  return Wrap(children: [
    Column(
      children: const [
        ListTile(
          title: Text("Categories"),
          leading: Icon(Icons.ac_unit),
        ),
        ListTile(
          title: Text("Categories"),
          leading: Icon(Icons.ac_unit),
        ),
        ListTile(
          title: Text("Categories"),
          leading: Icon(Icons.ac_unit),
        ),
      ],
    ),
  ]);
}

Widget whitespace(BuildContext context, var thisheight, var thiswidth) {
  Size size = MediaQuery.of(context).size / 100;
  return SizedBox(
    height: size.height * thisheight,
    width: size.width * thiswidth,
  );
}

AppBar myappbar(BuildContext context, var size, Color backgroundcolor) {
  final checkToken = GetStorage();
  var token;
  token = checkToken.read('token');
  return AppBar(
    automaticallyImplyLeading: false,
    actions: [
      Padding(
          padding: EdgeInsets.only(
            right: size.width * 3,
          ),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                // elevation: 20,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
                context: context,
                builder: (context) {
                  return Wrap(children: [
                    Column(
                      children: [
                        ListTile(
                          title: const Text("Categories"),
                          leading: const Icon(Icons.category_outlined),
                          onTap: () {
                            Get.to(CategoriesScreen());
                          },
                        ),
                        token == null
                            ? ListTile(
                                title: const Text("Log In"),
                                leading: const Icon(Icons.login_sharp),
                                onTap: () {
                                  Get.to(() => LoginScreen());
                                },
                              )
                            : ListTile(
                                title: const Text("Profile"),
                                leading: const Icon(Icons.photo),
                                onTap: () {
                                  // Navigator.pushNamed(context, 'ProfileScreen');
                                  CheckLogIn().checkLogIn(
                                      function: () {
                                        Get.to(() => ProfileScreen());
                                      },
                                      context: context);
                                },
                              ),
                        token == null
                            ? ListTile(
                                title: const Text("Create an account"),
                                leading: const Icon(Icons.plus_one),
                                onTap: () {
                                  Get.to(() => SignUpScreen());
                                },
                              )
                            : Container(),
                        // ListTile(
                        //   title: const Text("Change Details"),
                        //   leading: const Icon(Icons.settings),
                        //   onTap: () {
                        //     CheckLogIn().checkLogIn(
                        //         function: () {
                        //           Get.to(() => EditProfileScreen(
                        //               id: GetSavedValues().getId()));
                        //         },
                        //         context: context);
                        //   },
                        // ),
                        token == null
                            ? Container()
                            : ListTile(
                                title: const Text("Logout"),
                                leading: const Icon(Icons.logout_sharp),
                                onTap: () {
                                  // Navigator.pushNamed(
                                  //     context, 'UnderConstructionScreen');
                                  LogOut().logOut();
                                },
                              ),
                      ],
                    ),
                  ]);
                },
              );
            },
            child: Icon(
              Icons.more_horiz,
              color: Colors.black,
              size: size.width * 6.5,
            ),
          )),
    ],
    title: Image.asset(
      "assets/images/banner.png",
      width: 50,
    ),
    // Text(
    //   "Mugli Mart",
    //   style: GoogleFonts.barlow(
    //     textStyle:
    //         const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
    //   ),
    // ),
    backgroundColor: backgroundcolor,
    elevation: 0.55,
  );
}

AppBar blackappbar(BuildContext context, var size) {
  return AppBar(
    actions: [
      Padding(
          padding: EdgeInsets.only(
            right: size.width * 5,
          ),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                // elevation: 20,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
                context: context,
                builder: (context) {
                  return Wrap(children: [
                    Column(
                      children: [
                        ListTile(
                          title: Text("Categories"),
                          leading: Icon(Icons.category_outlined),
                          onTap: () {
                            Get.to(CategoriesScreen());
                          },
                        ),
                        ListTile(
                          title: Text("Profile"),
                          leading: Icon(Icons.photo),
                          onTap: () {
                            Get.to(ProfileScreen());
                          },
                        ),
                        // ListTile(
                        //   title: Text("Change Details"),
                        //   leading: Icon(Icons.settings),
                        //   onTap: () {
                        //     Get.to(EditProfileScreen(
                        //       id: int.parse("${GetSavedValues().getToken()}"),
                        //     ));
                        //   },
                        // ),
                        ListTile(
                          title: Text("Logout"),
                          leading: Icon(Icons.logout_sharp),
                          onTap: () {
                            Get.offAll(HomeScreen());
                          },
                        ),
                      ],
                    ),
                  ]);
                },
              );
            },
            child: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: size.width * 6.5,
            ),
          )),
    ],
    title: Text(
      "Mugli Mart",
      style: GoogleFonts.barlow(
        textStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    ),
    backgroundColor: Colors.black87,
    elevation: 0.55,
  );
}
