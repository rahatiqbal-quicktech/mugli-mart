import 'dart:convert';
import 'package:muglimart_quicktech/features/loading_dialog/loading_dialog.dart';
import 'package:muglimart_quicktech/features/my_orders/MyOrdersModel.dart';
import 'package:http/http.dart' as http;

class MyOrderService {
  Future<MyOrders> getMyOrders({required String token}) async {
    final response = await http.get(
        Uri.parse('https://muglimart.com/api/v1/customer/order'),
        headers: {
          'Authorization': 'Bearer $token',
        });
    print(response.body);

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      LoadingDialog().dismiss();
      return MyOrders.fromJson(data);
    } else {
      LoadingDialog().dismiss();
      return MyOrders.fromJson(data);
    }
  }
}
