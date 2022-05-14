import 'package:get/get.dart';
import 'package:muglimart_quicktech/features/home/slider/slider_model.dart';
import 'package:muglimart_quicktech/features/home/slider/slider_service.dart';

class SliderController extends GetxController {
  final sliders = RxList<Slider>();

  getSliders() async {
    var temp = await SliderService().getSliders();
    if (temp != null) {
      sliders.value = temp.sliders as List<Slider>;
      print(sliders.length);
    }
  }
}
