class RecommendedProductsModel {
  List<Products>? products;

  RecommendedProductsModel({this.products});

  RecommendedProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
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
  int? productpoint;
  String? productcode;
  int? additionalshipping;
  String? featureproductdate;
  int? productstyle;
  String? productdetails;
  String? productdetails2;
  int? productquantity;
  int? sellerid;
  int? request;
  int? status;
  String? createdAt;
  String? updatedAt;
  ProImage? proImage;

  Products(
      {this.id,
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
      this.proImage});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productcat = json['productcat'];
    productsubcat = json['productsubcat'];
    productchildcat = json['productchildcat'];
    productbrand = json['productbrand'];
    campaignId = json['campaign_id'];
    productname = json['productname'];
    slug = json['slug'];
    productdiscount = json['productdiscount'];
    productnewprice = json['productnewprice'];
    productoldprice = json['productoldprice'];
    productpoint = json['productpoint'];
    productcode = json['productcode'];
    additionalshipping = json['additionalshipping'];
    featureproductdate = json['featureproductdate'];
    productstyle = json['productstyle'];
    productdetails = json['productdetails'];
    productdetails2 = json['productdetails2'];
    productquantity = json['productquantity'];
    sellerid = json['sellerid'];
    request = json['request'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    proImage = json['pro_image'] != null
        ? new ProImage.fromJson(json['pro_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productcat'] = this.productcat;
    data['productsubcat'] = this.productsubcat;
    data['productchildcat'] = this.productchildcat;
    data['productbrand'] = this.productbrand;
    data['campaign_id'] = this.campaignId;
    data['productname'] = this.productname;
    data['slug'] = this.slug;
    data['productdiscount'] = this.productdiscount;
    data['productnewprice'] = this.productnewprice;
    data['productoldprice'] = this.productoldprice;
    data['productpoint'] = this.productpoint;
    data['productcode'] = this.productcode;
    data['additionalshipping'] = this.additionalshipping;
    data['featureproductdate'] = this.featureproductdate;
    data['productstyle'] = this.productstyle;
    data['productdetails'] = this.productdetails;
    data['productdetails2'] = this.productdetails2;
    data['productquantity'] = this.productquantity;
    data['sellerid'] = this.sellerid;
    data['request'] = this.request;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.proImage != null) {
      data['pro_image'] = this.proImage!.toJson();
    }
    return data;
  }
}

class ProImage {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProImage(
      {this.id, this.productId, this.image, this.createdAt, this.updatedAt});

  ProImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
