import 'package:dio/dio.dart';
import 'package:muglimart_quicktech/features/order/models/shipping_area_model.dart';
import 'package:muglimart_quicktech/features/order/models/shipping_charge_model.dart';
import 'package:http/http.dart' as http;

class GetShippingAddressService {
  var dio = Dio();
  // Future<SgippingChargeModel> getShippingAddress() async {
  //   try {
  //     var response = await dio
  //         .get('https://muglimart.com/api/customer/shippingcharge/195');
  //     if (response.statusCode == 200) {
  //       return sgippingChargeModelFromJson(response.data);
  //     } else
  //       return SgippingChargeModel();
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

  Future<SgippingChargeModel> getData() async {
    final response = await http.get(
        Uri.parse('https://muglimart.com/api/customer/shippingcharge/195'));
    var data = response.body;
    if (response.statusCode == 200) {
      return sgippingChargeModelFromJson(data);
    } else
      return SgippingChargeModel();
  }
}
