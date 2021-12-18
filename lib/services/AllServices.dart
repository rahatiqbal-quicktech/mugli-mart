import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/Controllers/myordersController.dart';
import 'package:muglimart_quicktech/Models/MyOrdersModel.dart';

class AllServices {
  static var client = http.Client();

  Future<MyOrders> getmyorders() async {
    var response = await client
        .get(Uri.parse('https://muglimart.com/api/v1/customer/order'));
    if (response.statusCode == 200) {
      var body = response.body;
      //  MyOrders.fromJson(response.body);
      MyOrders myOrders = MyOrders.fromJson(jsonDecode(body));
      return myOrders;
    } else {
      return MyOrders();
    }
  }
}
