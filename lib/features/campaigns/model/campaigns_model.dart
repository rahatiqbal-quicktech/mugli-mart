// To parse this JSON data, do
//
//     final campaignsModel = campaignsModelFromJson(jsonString);

import 'dart:convert';

CampaignsModel campaignsModelFromJson(String str) =>
    CampaignsModel.fromJson(json.decode(str));

String campaignsModelToJson(CampaignsModel data) => json.encode(data.toJson());

class CampaignsModel {
  CampaignsModel({
    this.campaigns,
  });

  List<Campaign>? campaigns;

  factory CampaignsModel.fromJson(Map<String, dynamic> json) => CampaignsModel(
        campaigns: List<Campaign>.from(
            json["campaigns"].map((x) => Campaign.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "campaigns": List<dynamic>.from(campaigns!.map((x) => x.toJson())),
      };
}

class Campaign {
  Campaign({
    this.id,
    this.title,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
