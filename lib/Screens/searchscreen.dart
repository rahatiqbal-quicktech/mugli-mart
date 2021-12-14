import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/buttons.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.grey.shade50),
      bottomNavigationBar: const TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width * 3, 0, size.width * 3, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              whitespace(context, 6, 0),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Ionicons.search_circle_outline),
                  hintText: 'Search products or category',
                  labelText: 'Search',
                ),
              ),
              whitespace(context, 2, 0),
              Align(
                alignment: Alignment.centerRight,
                child: outlinedButton(
                    label: "Search",
                    icon: Ionicons.checkmark,
                    primarycolor: Colors.black,
                    bordercolor: Colors.grey,
                    action: () {}),
              ),
              whitespace(context, 5, 0),
              Text(
                "Popular Categories",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  fontSize: size.height * 2,
                  fontStyle: FontStyle.italic,
                )),
              ),
              whitespace(context, 2, 0),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category $index"),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
