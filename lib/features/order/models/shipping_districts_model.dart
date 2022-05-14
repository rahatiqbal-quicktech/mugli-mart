// To parse this JSON data, do
//
//     final shippingDistrictsModel = shippingDistrictsModelFromJson(jsonString);

import 'dart:convert';

ShippingDistrictsModel shippingDistrictsModelFromJson(String str) =>
    ShippingDistrictsModel.fromJson(json.decode(str));

String shippingDistrictsModelToJson(ShippingDistrictsModel data) =>
    json.encode(data.toJson());

class ShippingDistrictsModel {
  ShippingDistrictsModel({
    this.districts,
  });

  List<District>? districts;

  factory ShippingDistrictsModel.fromJson(Map<String, dynamic> json) =>
      ShippingDistrictsModel(
        districts: List<District>.from(
            json["districts"].map((x) => District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "districts": List<dynamic>.from(districts!.map((x) => x.toJson())),
      };
}

class District {
  District({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
