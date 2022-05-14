// To parse this JSON data, do
//
//     final categoryProducts = categoryProductsFromJson(jsonString);

import 'dart:convert';

CategoryProducts categoryProductsFromJson(String str) =>
    CategoryProducts.fromJson(json.decode(str));

String categoryProductsToJson(CategoryProducts data) =>
    json.encode(data.toJson());

class CategoryProducts {
  CategoryProducts({
    this.bredcrumb,
    this.products,
  });

  Bredcrumb? bredcrumb;
  Products? products;

  factory CategoryProducts.fromJson(Map<String, dynamic> json) =>
      CategoryProducts(
        bredcrumb: Bredcrumb.fromJson(json["bredcrumb"]),
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "bredcrumb": bredcrumb!.toJson(),
        "products": products!.toJson(),
      };
}

class Bredcrumb {
  Bredcrumb({
    this.id,
    this.catname,
    this.slug,
    this.image,
  });

  int? id;
  String? catname;
  String? slug;
  String? image;

  factory Bredcrumb.fromJson(Map<String, dynamic> json) => Bredcrumb(
        id: json["id"],
        catname: json["catname"],
        slug: json["slug"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catname": catname,
        "slug": slug,
        "image": image,
      };
}

class Products {
  Products({
    this.currentPage,
    this.data,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  int? to;
  int? total;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.productname,
    this.slug,
    this.productdiscount,
    this.productnewprice,
    this.productoldprice,
    this.proImage,
  });

  int? id;
  String? productname;
  String? slug;
  dynamic productdiscount;
  int? productnewprice;
  dynamic productoldprice;
  ProImage? proImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productname: json["productname"],
        slug: json["slug"],
        productdiscount: json["productdiscount"],
        productnewprice: json["productnewprice"],
        productoldprice: json["productoldprice"],
        proImage: ProImage.fromJson(json["pro_image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productname": productname,
        "slug": slug,
        "productdiscount": productdiscount,
        "productnewprice": productnewprice,
        "productoldprice": productoldprice,
        "pro_image": proImage!.toJson(),
      };
}

class ProImage {
  ProImage({
    this.id,
    this.productId,
    this.image,
  });

  int? id;
  int? productId;
  String? image;

  factory ProImage.fromJson(Map<String, dynamic> json) => ProImage(
        id: json["id"] ?? 2,
        productId: json["product_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
      };
}
