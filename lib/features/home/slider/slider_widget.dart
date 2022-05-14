import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muglimart_quicktech/all_controllers/allControllers.dart';

class SliderWidget extends StatelessWidget with AllControllers {
  SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final sliderController = Get.put(SliderController());
    return Obx(
      (() => sliderController.sliders.length == 0
          ? Center(child: CircularProgressIndicator())
          : CarouselSlider.builder(
              itemCount: sliderController.sliders.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                //
                final item = sliderController.sliders[itemIndex];
                return Stack(
                  children: [
                    Container(
                      // height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                                // fit: BoxFit.fitWidth,
                                image: NetworkImage(
                                    "https://muglimart.com/${item.image}"))),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                // height: 150,

                viewportFraction: 1.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: sliderController.sliders.length == 1 ? false : true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            )),
    );
  }
}
