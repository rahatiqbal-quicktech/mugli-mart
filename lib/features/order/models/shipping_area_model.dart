// To parse this JSON data, do
//
//     final shippingAreaModel = shippingAreaModelFromJson(jsonString);

import 'dart:convert';

ShippingAreaModel shippingAreaModelFromJson(String str) =>
    ShippingAreaModel.fromJson(json.decode(str));

String shippingAreaModelToJson(ShippingAreaModel data) =>
    json.encode(data.toJson());

class ShippingAreaModel {
  ShippingAreaModel({
    this.areas,
  });

  List<Area>? areas;

  factory ShippingAreaModel.fromJson(Map<String, dynamic> json) =>
      ShippingAreaModel(
        areas: List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "areas": List<dynamic>.from(areas!.map((x) => x.toJson())),
      };
}

class Area {
  Area({
    this.id,
    this.districtId,
    this.area,
    this.shippingfee,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? districtId;
  String? area;
  String? shippingfee;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        districtId: json["district_id"],
        area: json["area"],
        shippingfee: json["shippingfee"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_id": districtId,
        "area": area,
        "shippingfee": shippingfee,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
