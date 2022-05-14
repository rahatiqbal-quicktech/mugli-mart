import 'package:muglimart_quicktech/features/home/slider/slider_model.dart';
import 'package:http/http.dart' as http;

class SliderService {
  Future<SliderModel?> getSliders() async {
    try {
      final response =
          await http.get(Uri.parse('https://muglimart.com/api/v1/slider'));
      print(response.body);

      if (response.statusCode == 200) {
        return sliderModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
