import 'package:http/http.dart' as http;
import 'package:muglimart_quicktech/config/config.dart';
import 'package:muglimart_quicktech/features/order/models/shipping_area_model.dart';
import 'package:muglimart_quicktech/features/order/models/shipping_districts_model.dart';

class ShippingAddressService {
  Future<ShippingDistrictsModel?> getDistricts() async {
    try {
      var response =
          await http.get(Uri.parse("$baseUrl" + "/api/v1/districts"));

      if (response.statusCode == 200) {
        var jsonString = response.body;

        return shippingDistrictsModelFromJson(jsonString);
      } else
        return shippingDistrictsModelFromJson(response.body);
    } catch (e) {
      print(e);
    }
  }

  Future<ShippingAreaModel?> getArea({String? districtId}) async {
    try {
      var response =
          await http.get(Uri.parse("$baseUrl" + "/api/v1/areas/$districtId"));

      if (response.statusCode == 200) {
        var jsonString = response.body;

        return shippingAreaModelFromJson(jsonString);
      } else
        return shippingAreaModelFromJson(response.body);
    } catch (e) {
      print(e);
    }
  }
}
