// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.categories,
  });

  List<Category>? categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.catname,
    this.slug,
    this.image,
    this.level,
    this.frontPage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.subcategories,
  });

  int? id;
  String? catname;
  String? slug;
  String? image;
  int? level;
  int? frontPage;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Subcategory>? subcategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        catname: json["catname"],
        slug: json["slug"],
        image: json["image"],
        level: json["level"],
        frontPage: json["frontPage"] == null ? null : json["frontPage"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subcategories: List<Subcategory>.from(
            json["subcategories"].map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catname": catname,
        "slug": slug,
        "image": image,
        "level": level,
        "frontPage": frontPage == null ? null : frontPage,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "subcategories":
            List<dynamic>.from(subcategories!.map((x) => x.toJson())),
      };
}

class Subcategory {
  Subcategory({
    this.id,
    this.subcategoryName,
    this.slug,
    this.categoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.childcategories,
  });

  int? id;
  String? subcategoryName;
  String? slug;
  int? categoryId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Childcategory>? childcategories;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        subcategoryName: json["subcategoryName"],
        slug: json["slug"],
        categoryId: json["category_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        childcategories: List<Childcategory>.from(
            json["childcategories"].map((x) => Childcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subcategoryName": subcategoryName,
        "slug": slug,
        "category_id": categoryId,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "childcategories":
            List<dynamic>.from(childcategories!.map((x) => x.toJson())),
      };
}

class Childcategory {
  Childcategory({
    this.id,
    this.childcategoryName,
    this.slug,
    this.subcategoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? childcategoryName;
  String? slug;
  int? subcategoryId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Childcategory.fromJson(Map<String, dynamic> json) => Childcategory(
        id: json["id"],
        childcategoryName: json["childcategoryName"],
        slug: json["slug"],
        subcategoryId: json["subcategory_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "childcategoryName": childcategoryName,
        "slug": slug,
        "subcategory_id": subcategoryId,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
