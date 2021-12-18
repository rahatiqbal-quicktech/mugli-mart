import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/Utilities/colors.dart';

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
  return AppBar(
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
                            Navigator.pushNamed(
                                context, 'UnderConstructionScreen');
                          },
                        ),
                        ListTile(
                          title: const Text("Profile"),
                          leading: const Icon(Icons.photo),
                          onTap: () {
                            Navigator.pushNamed(context, 'ProfileScreen');
                          },
                        ),
                        ListTile(
                          title: const Text("Settings"),
                          leading: const Icon(Icons.settings),
                          onTap: () {
                            Navigator.pushNamed(
                                context, 'UnderConstructionScreen');
                          },
                        ),
                        ListTile(
                          title: const Text("Logout"),
                          leading: const Icon(Icons.logout_sharp),
                          onTap: () {
                            Navigator.pushNamed(
                                context, 'UnderConstructionScreen');
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
    title: Text(
      "Mugli Mart",
      style: GoogleFonts.barlow(
        textStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
    ),
    leading: GestureDetector(
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onTap: () => Navigator.pop(context),
    ),
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
                      children: const [
                        ListTile(
                          title: Text("Categories"),
                          leading: Icon(Icons.category_outlined),
                        ),
                        ListTile(
                          title: Text("Profile"),
                          leading: Icon(Icons.photo),
                        ),
                        ListTile(
                          title: Text("Settings"),
                          leading: Icon(Icons.settings),
                        ),
                        ListTile(
                          title: Text("Logout"),
                          leading: Icon(Icons.logout_sharp),
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
