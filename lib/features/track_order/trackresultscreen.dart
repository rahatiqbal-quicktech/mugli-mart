import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muglimart_quicktech/features/track_order/TrackOrderModel.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';
import 'package:http/http.dart' as http;

class TrackResultScreen extends StatefulWidget {
  String id;
  // const TrackResultScreen({Key? key}) : super(key: key);
  TrackResultScreen({required this.id});

  @override
  _TrackResultScreenState createState() => _TrackResultScreenState();
}

class _TrackResultScreenState extends State<TrackResultScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: myappbar(context, size, Colors.grey.shade100),
      bottomNavigationBar: TheBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            whitespace(context, 10, 0),
            FutureBuilder<TrackOrderModel>(
                future: GetTrackResult(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      height: size.height * 30,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          whitespace(context, 3.8, 0),
                          Text(
                            "Tracking ID :  ${widget.id}",
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600),
                          ),
                          whitespace(context, 2, 0),
                          Text(
                            "Status",
                            style: GoogleFonts.openSans(),
                          ),
                          Text(
                            snapshot.data!.trackorder!.status!.name.toString(),
                            style: GoogleFonts.openSans(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return CupertinoActivityIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<TrackOrderModel> GetTrackResult() async {
    final response = await http.post(
        Uri.parse('https://muglimart.com/api/v1/order/track'),
        body: {'trackId': widget.id});

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return TrackOrderModel.fromJson(data);
    } else {
      return TrackOrderModel.fromJson(data);
    }
  }
}
