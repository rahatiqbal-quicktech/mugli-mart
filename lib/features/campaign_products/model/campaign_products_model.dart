// To parse this JSON data, do
//
//     final campaignProductsModel = campaignProductsModelFromJson(jsonString);

import 'dart:convert';

CampaignProductsModel campaignProductsModelFromJson(String str) =>
    CampaignProductsModel.fromJson(json.decode(str));

String campaignProductsModelToJson(CampaignProductsModel data) =>
    json.encode(data.toJson());

class CampaignProductsModel {
  CampaignProductsModel({
    this.products,
  });

  Products? products;

  factory CampaignProductsModel.fromJson(Map<String, dynamic> json) =>
      CampaignProductsModel(
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products?.toJson(),
      };
}

class Products {
  Products({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
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
  dynamic productchildcat;
  int? productbrand;
  int? campaignId;
  Productname? productname;
  Slug? slug;
  dynamic productdiscount;
  int? productnewprice;
  dynamic productoldprice;
  dynamic productpoint;
  String? productcode;
  int? additionalshipping;
  dynamic featureproductdate;
  dynamic productstyle;
  String? productdetails;
  String? productdetails2;
  int? productquantity;
  int? sellerid;
  int? request;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProImage? proImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productcat: json["productcat"],
        productsubcat: json["productsubcat"],
        productchildcat: json["productchildcat"],
        productbrand: json["productbrand"],
        campaignId: json["campaign_id"],
        productname: productnameValues.map![json["productname"]],
        slug: slugValues.map![json["slug"]],
        productdiscount: json["productdiscount"],
        productnewprice: json["productnewprice"],
        productoldprice: json["productoldprice"],
        productpoint: json["productpoint"],
        productcode: json["productcode"],
        additionalshipping: json["additionalshipping"] == null
            ? null
            : json["additionalshipping"],
        featureproductdate: json["featureproductdate"],
        productstyle: json["productstyle"],
        productdetails: json["productdetails"],
        productdetails2: json["productdetails2"],
        productquantity: json["productquantity"],
        sellerid: json["sellerid"],
        request: json["request"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        proImage: ProImage.fromJson(json["pro_image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productcat": productcat,
        "productsubcat": productsubcat,
        "productchildcat": productchildcat,
        "productbrand": productbrand,
        "campaign_id": campaignId,
        "productname": productnameValues.reverse![productname],
        "slug": slugValues.reverse![slug],
        "productdiscount": productdiscount,
        "productnewprice": productnewprice,
        "productoldprice": productoldprice,
        "productpoint": productpoint,
        "productcode": productcode,
        "additionalshipping":
            additionalshipping == null ? null : additionalshipping,
        "featureproductdate": featureproductdate,
        "productstyle": productstyle,
        "productdetails": productdetails,
        "productdetails2": productdetails2,
        "productquantity": productquantity,
        "sellerid": sellerid,
        "request": request,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pro_image": proImage?.toJson(),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Productname { MARCEL_CHEST_REFRIGERATOR, MARCEL_REFRIGERATOR }

final productnameValues = EnumValues({
  "marcel chest refrigerator": Productname.MARCEL_CHEST_REFRIGERATOR,
  "marcel refrigerator": Productname.MARCEL_REFRIGERATOR
});

enum Slug { MARCEL_CHEST_REFRIGERATOR, MARCEL_REFRIGERATOR }

final slugValues = EnumValues({
  "marcel-chest-refrigerator": Slug.MARCEL_CHEST_REFRIGERATOR,
  "marcel-refrigerator": Slug.MARCEL_REFRIGERATOR
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
