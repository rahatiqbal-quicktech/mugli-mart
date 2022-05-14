import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muglimart_quicktech/Widgets/afewwidgets.dart';
import 'package:muglimart_quicktech/features/home/slider/slider_service.dart';
import 'package:muglimart_quicktech/features/home/slider/slider_widget.dart';

import '../features/home/slider/slider_controller.dart';

class SliderBoilerplate extends StatefulWidget {
  const SliderBoilerplate({Key? key}) : super(key: key);

  @override
  State<SliderBoilerplate> createState() => _SliderBoilerplateState();
}

class _SliderBoilerplateState extends State<SliderBoilerplate> {
  final sliderController = Get.put(SliderController());
  @override
  void initState() {
    super.initState();
    sliderController.getSliders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          whitespace(context, 10, 0),
          Center(
            child: TextButton(
                onPressed: () {
                  // SliderService().getSliders();
                  sliderController.getSliders();
                },
                child: Text("Sliders")),
          ),
          whitespace(context, 5, 0),
          SliderWidget(),
        ],
      ),
    );
  }
}
