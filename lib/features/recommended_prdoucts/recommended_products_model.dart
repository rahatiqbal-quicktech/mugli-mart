// To parse this JSON data, do
//
//     final recommendedProductsModel = recommendedProductsModelFromJson(jsonString);

import 'dart:convert';

RecommendedProductsModel recommendedProductsModelFromJson(String str) =>
    RecommendedProductsModel.fromJson(json.decode(str));

String recommendedProductsModelToJson(RecommendedProductsModel data) =>
    json.encode(data.toJson());

class RecommendedProductsModel {
  RecommendedProductsModel({
    this.products,
  });

  List<Product>? products;

  factory RecommendedProductsModel.fromJson(Map<String, dynamic> json) =>
      RecommendedProductsModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.productcat,
    this.productsubcat,
    this.productchildcat,
    this.productbrand,
    this.campaignId,
    this.productname,
    this.slug,
    this.productdiscount,
    this.productnewprice,
    this.productoldprice,
    this.productpoint,
    this.productcode,
    this.additionalshipping,
    this.featureproductdate,
    this.productstyle,
    this.productdetails,
    this.productdetails2,
    this.productquantity,
    this.sellerid,
    this.request,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.proImage,
  });

  int? id;
  int? productcat;
  int? productsubcat;
  int? productchildcat;
  int? productbrand;
  int? campaignId;
  String? productname;
  String? slug;
  int? productdiscount;
  int? productnewprice;
  int? productoldprice;
  dynamic productpoint;
  String? productcode;
  int? additionalshipping;
  dynamic featureproductdate;
  int? productstyle;
  String? productdetails;
  String? productdetails2;
  int? productquantity;
  int? sellerid;
  int? request;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProImage? proImage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productcat: json["productcat"],
        productsubcat: json["productsubcat"],
        productchildcat:
            json["productchildcat"] == null ? null : json["productchildcat"],
        productbrand:
            json["productbrand"] == null ? null : json["productbrand"],
        campaignId: json["campaign_id"] == null ? null : json["campaign_id"],
        productname: json["productname"],
        slug: json["slug"],
        productdiscount:
            json["productdiscount"] == null ? null : json["productdiscount"],
        productnewprice: json["productnewprice"],
        productoldprice:
            json["productoldprice"] == null ? null : json["productoldprice"],
        productpoint: json["productpoint"],
        productcode: json["productcode"] == null ? null : json["productcode"],
        additionalshipping: json["additionalshipping"] == null
            ? null
            : json["additionalshipping"],
        featureproductdate: json["featureproductdate"],
        productstyle:
            json["productstyle"] == null ? null : json["productstyle"],
        productdetails: json["productdetails"],
        productdetails2:
            json["productdetails2"] == null ? null : json["productdetails2"],
        productquantity: json["productquantity"],
        sellerid: json["sellerid"],
        request: json["request"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        proImage: json["pro_image"] == null
            ? null
            : ProImage.fromJson(json["pro_image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productcat": productcat,
        "productsubcat": productsubcat,
        "productchildcat": productchildcat == null ? null : productchildcat,
        "productbrand": productbrand == null ? null : productbrand,
        "campaign_id": campaignId == null ? null : campaignId,
        "productname": productname,
        "slug": slug,
        "productdiscount": productdiscount == null ? null : productdiscount,
        "productnewprice": productnewprice,
        "productoldprice": productoldprice == null ? null : productoldprice,
        "productpoint": productpoint,
        "productcode": productcode == null ? null : productcode,
        "additionalshipping":
            additionalshipping == null ? null : additionalshipping,
        "featureproductdate": featureproductdate,
        "productstyle": productstyle == null ? null : productstyle,
        "productdetails": productdetails,
        "productdetails2": productdetails2 == null ? null : productdetails2,
        "productquantity": productquantity,
        "sellerid": sellerid,
        "request": request,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "pro_image": proImage == null ? null : proImage!.toJson(),
      };
}

class ProImage {
  ProImage({
    this.id,
    this.productId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? productId;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProImage.fromJson(Map<String, dynamic> json) => ProImage(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
