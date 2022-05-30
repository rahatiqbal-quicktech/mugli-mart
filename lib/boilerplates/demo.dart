// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:muglimart_quicktech/features/category/CategoriesController.dart';
// import 'package:muglimart_quicktech/features/campaigns/campaignController.dart';
// import 'package:muglimart_quicktech/features/category/Categories.dart';
// import 'package:http/http.dart' as http;
// import 'package:muglimart_quicktech/Models/SliderModel.dart';
// import 'package:muglimart_quicktech/Models/categorylist.dart';
// import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';

// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);

//   @override
//   _DemoState createState() => _DemoState();
// }

// class _DemoState extends State<Demo> {
//   // var cats = new List<Categories>();
//   late Future<Categories> futurecategories;
//   var cats = CategoriesController();
//   Categories? report;
//   CampaignModel? report_;

//   var a = CampaignController();

//   var getdata = CategoriesController();

//   // getData() {
//   //   // CategoriesController().getcategories().then((value)
//   //   CampaignController().getcampaigns().then((value) {
//   //     setState(() {
//   //       report_ = value;
//   //     });
//   //   });
//   // }

//   // getCampaigns() {
//   //   CampaignController().getcampaigns().then((value) => {
//   //      setState(() {
//   //       report_ = value;
//   //     })
//   //   });
//   //   }
//   // }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getData();
//   //   // futurecategories = cats.getcategories();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     String baseUrl = "https://muglimart.com/";
//     return Scaffold(
//         body: Center(
//       child: FutureBuilder<SliderModel>(
//           future: getSliders(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.sliders!.length,
//                   itemBuilder: (context, index) {
//                     return Center(
//                         child: Column(
//                       children: [
//                         Text(baseUrl +
//                             snapshot.data!.sliders![index].image.toString()),
//                         whitespace(context, 5, 0),
//                         Image.network(baseUrl +
//                             snapshot.data!.sliders![index].image.toString()),

//                         // Image.network(snapshot
//                         //     .data!.campaigns![index].image
//                         //     .toString()),
//                         // Text(snapshot.data!.sliders![index].image
//                         //     .toString())
//                       ],
//                     ));
//                   });
//             } else {
//               return Text("Loading.....");
//             }
//           }),
//     )
//         //     FutureBuilder<Categories>(
//         //   future: getData(),
//         //   builder: (context, snapshot) {
//         //     if (snapshot.hasData) {
//         //       return Text(snapshot.data!.catname);
//         //     } else if (snapshot.hasError) {
//         //       return Text('${snapshot.error}');
//         //     }

//         //     // By default, show a loading spinner.
//         //     return const CircularProgressIndicator();
//         //   },
//         // )
//         //  ListView.builder(itemBuilder: (context, index) {
//         //   return ListTile(
//         //     title: Text(""),
//         //   );
//         // }),
//         );
//   }

//   Future<Categories> getCategoryList() async {
//     final response =
//         await http.get(Uri.parse('https://muglimart.com/api/v1/category'));

//     var data = jsonDecode(response.body.toString());

//     if (response.statusCode == 200) {
//       return Categories.fromJson(data);
//     } else {
//       return Categories.fromJson(data);
//     }
//   }

//   Future<CampaignModel> getCampaigns() async {
//     final response =
//         await http.get(Uri.parse('https://muglimart.com/api/v1/campaigns'));

//     var data = jsonDecode(response.body.toString());

//     if (response.statusCode == 200) {
//       return CampaignModel.fromJson(data);
//     } else {
//       return CampaignModel.fromJson(data);
//     }
//   }

//   Future<SliderModel> getSliders() async {
//     final response =
//         await http.get(Uri.parse('https://muglimart.com/api/v1/slider'));

//     var data = jsonDecode(response.body.toString());

//     if (response.statusCode == 200) {
//       return SliderModel.fromJson(data);
//     } else {
//       return SliderModel.fromJson(data);
//     }
//   }
// }
