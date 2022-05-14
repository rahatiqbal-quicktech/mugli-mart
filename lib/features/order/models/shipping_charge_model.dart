// To parse this JSON data, do
//
//     final sgippingChargeModel = sgippingChargeModelFromJson(jsonString);

import 'dart:convert';

SgippingChargeModel sgippingChargeModelFromJson(String str) =>
    SgippingChargeModel.fromJson(json.decode(str));

String sgippingChargeModelToJson(SgippingChargeModel data) =>
    json.encode(data.toJson());

class SgippingChargeModel {
  SgippingChargeModel({
    this.status,
    this.charge,
    this.customer,
  });

  bool? status;
  Charge? charge;
  Customer? customer;

  factory SgippingChargeModel.fromJson(Map<String, dynamic> json) =>
      SgippingChargeModel(
        status: json["status"],
        charge: Charge.fromJson(json["charge"]),
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "charge": charge?.toJson(),
        "customer": customer?.toJson(),
      };
}

class Charge {
  Charge({
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

  factory Charge.fromJson(Map<String, dynamic> json) => Charge(
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.phone,
    this.district,
    this.area,
    this.stateaddress,
    this.customerid,
    this.houseaddress,
    this.fulladdress,
    this.zipcode,
    this.createdAt,
    this.updatedAt,
    this.districtName,
    this.areaName,
  });

  int? id;
  String? name;
  String? phone;
  String? district;
  String? area;
  String? stateaddress;
  String? customerid;
  String? houseaddress;
  String? fulladdress;
  String? zipcode;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? districtName;
  String? areaName;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        district: json["district"],
        area: json["area"],
        stateaddress: json["stateaddress"],
        customerid: json["customerid"],
        houseaddress: json["houseaddress"],
        fulladdress: json["fulladdress"],
        zipcode: json["zipcode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        districtName: json["districtName"],
        areaName: json["areaName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "district": district,
        "area": area,
        "stateaddress": stateaddress,
        "customerid": customerid,
        "houseaddress": houseaddress,
        "fulladdress": fulladdress,
        "zipcode": zipcode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "districtName": districtName,
        "areaName": areaName,
      };
}
