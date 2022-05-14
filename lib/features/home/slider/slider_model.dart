// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.sliders,
  });

  List<Slider>? sliders;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        sliders:
            List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sliders": List<dynamic>.from(sliders!.map((x) => x.toJson())),
      };
}

class Slider {
  Slider({
    this.id,
    this.image,
    this.link,
  });

  int? id;
  String? image;
  String? link;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        image: json["image"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
      };
}
