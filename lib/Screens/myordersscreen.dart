import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muglimart_quicktech/Controllers/myordersController.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/Widgets/thebottomnavbar.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final MyOrdersController controller = Get.put(MyOrdersController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size / 100;
    return Scaffold(
      appBar: myappbar(context, size, Colors.white70),
      bottomNavigationBar: TheBottomNavBar(),
      body: SingleChildScrollView(
        child: Obx(
          () => ListView.builder(
              itemCount: controller.orderlist[0].customerorders!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.red,
                );
              }),
        ),
      ),
    );
  }
}
