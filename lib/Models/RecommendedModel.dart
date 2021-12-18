class RecommendedModel {
  int? minprice;
  int? maxprice;
  Bredcrumb? bredcrumb;
  List<Subcategories>? subcategories;
  Products? products;
  List<Allbrands>? allbrands;

  RecommendedModel(
      {this.minprice,
      this.maxprice,
      this.bredcrumb,
      this.subcategories,
      this.products,
      this.allbrands});

  RecommendedModel.fromJson(Map<String, dynamic> json) {
    minprice = json['minprice'];
    maxprice = json['maxprice'];
    bredcrumb = json['bredcrumb'] != null
        ? new Bredcrumb.fromJson(json['bredcrumb'])
        : null;
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    if (json['allbrands'] != null) {
      allbrands = <Allbrands>[];
      json['allbrands'].forEach((v) {
        allbrands!.add(new Allbrands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['minprice'] = this.minprice;
    data['maxprice'] = this.maxprice;
    if (this.bredcrumb != null) {
      data['bredcrumb'] = this.bredcrumb!.toJson();
    }
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.allbrands != null) {
      data['allbrands'] = this.allbrands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bredcrumb {
  int? id;
  String? catname;
  String? slug;
  String? image;
  int? level;
  int? frontPage;
  int? status;
  String? createdAt;
  String? updatedAt;

  Bredcrumb(
      {this.id,
      this.catname,
      this.slug,
      this.image,
      this.level,
      this.frontPage,
      this.status,
      this.createdAt,
      this.updatedAt});

  Bredcrumb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catname = json['catname'];
    slug = json['slug'];
    image = json['image'];
    level = json['level'];
    frontPage = json['frontPage'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catname'] = this.catname;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['level'] = this.level;
    data['frontPage'] = this.frontPage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Subcategories {
  int? id;
  String? subcategoryName;
  String? slug;
  int? categoryId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Subcategories(
      {this.id,
      this.subcategoryName,
      this.slug,
      this.categoryId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcategoryName = json['subcategoryName'];
    slug = json['slug'];
    categoryId = json['category_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subcategoryName'] = this.subcategoryName;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Products {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  Null nextPageUrl;
  String? path;
  int? perPage;
  Null prevPageUrl;
  int? to;
  int? total;

  Products(
      {this.currentPage,
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
      this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
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
  Null productpoint;
  String? productcode;
  Null additionalshipping;
  Null featureproductdate;
  Null productstyle;
  String? productdetails;
  String? productdetails2;
  int? productquantity;
  int? sellerid;
  int? request;
  int? status;
  String? createdAt;
  String? updatedAt;
  ProImage? proImage;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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

class Allbrands {
  int? productbrand;
  int? id;
  String? brandName;

  Allbrands({this.productbrand, this.id, this.brandName});

  Allbrands.fromJson(Map<String, dynamic> json) {
    productbrand = json['productbrand'];
    id = json['id'];
    brandName = json['brandName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productbrand'] = this.productbrand;
    data['id'] = this.id;
    data['brandName'] = this.brandName;
    return data;
  }
}
