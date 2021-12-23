class ProductDetailsModel {
  Productdetails? productdetails;
  Relatedproduct? relatedproduct;
  Sellerinfo? sellerinfo;
  Productbrand? productbrand;

  ProductDetailsModel(
      {this.productdetails,
      this.relatedproduct,
      this.sellerinfo,
      this.productbrand});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    productdetails = json['productdetails'] != null
        ? new Productdetails.fromJson(json['productdetails'])
        : null;
    relatedproduct = json['relatedproduct'] != null
        ? new Relatedproduct.fromJson(json['relatedproduct'])
        : null;
    sellerinfo = json['sellerinfo'] != null
        ? new Sellerinfo.fromJson(json['sellerinfo'])
        : null;
    productbrand = json['productbrand'] != null
        ? new Productbrand.fromJson(json['productbrand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productdetails != null) {
      data['productdetails'] = this.productdetails!.toJson();
    }
    if (this.relatedproduct != null) {
      data['relatedproduct'] = this.relatedproduct!.toJson();
    }
    if (this.sellerinfo != null) {
      data['sellerinfo'] = this.sellerinfo!.toJson();
    }
    if (this.productbrand != null) {
      data['productbrand'] = this.productbrand!.toJson();
    }
    return data;
  }
}

class Productdetails {
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
  List<dynamic>? colors;
  List<dynamic>? sizes;

  Productdetails(
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
      this.proImage,
      this.colors,
      this.sizes});

  Productdetails.fromJson(Map<String, dynamic> json) {
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
    if (json['colors'] != null) {
      colors = [];
      json['colors'].forEach((v) {
        colors!.add(v);
      });
    }
    if (json['sizes'] != null) {
      sizes = [];
      json['sizes'].forEach((v) {
        sizes!.add(v);
      });
    }
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
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
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

class Relatedproduct {
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

  Relatedproduct(
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

  Relatedproduct.fromJson(Map<String, dynamic> json) {
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

class Sellerinfo {
  int? id;
  String? shopname;
  String? slug;
  String? shoplogo;
  String? shopbanner;
  int? sellerphone;
  Null sellerphone2;
  String? selleremail;
  Null contperson;
  Null sellercash;
  Null sellerwithdraw;
  Null selleraddress;
  Null sellerwebsite;
  String? sellerbkashaccount;
  String? sellerrocketaccount;
  String? sellernagodaccount;
  Null sellerbankaccount;
  Null sellerbankname;
  Null sellerbankbranch;
  Null sellerroutingno;
  Null publishproduct;
  Null commisiontype;
  Null commision;
  Null featurevandor;
  int? agree;
  int? verify;
  Null forgetcode;
  int? status;
  String? createdAt;
  String? updatedAt;

  Sellerinfo(
      {this.id,
      this.shopname,
      this.slug,
      this.shoplogo,
      this.shopbanner,
      this.sellerphone,
      this.sellerphone2,
      this.selleremail,
      this.contperson,
      this.sellercash,
      this.sellerwithdraw,
      this.selleraddress,
      this.sellerwebsite,
      this.sellerbkashaccount,
      this.sellerrocketaccount,
      this.sellernagodaccount,
      this.sellerbankaccount,
      this.sellerbankname,
      this.sellerbankbranch,
      this.sellerroutingno,
      this.publishproduct,
      this.commisiontype,
      this.commision,
      this.featurevandor,
      this.agree,
      this.verify,
      this.forgetcode,
      this.status,
      this.createdAt,
      this.updatedAt});

  Sellerinfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopname = json['shopname'];
    slug = json['slug'];
    shoplogo = json['shoplogo'];
    shopbanner = json['shopbanner'];
    sellerphone = json['sellerphone'];
    sellerphone2 = json['sellerphone2'];
    selleremail = json['selleremail'];
    contperson = json['contperson'];
    sellercash = json['sellercash'];
    sellerwithdraw = json['sellerwithdraw'];
    selleraddress = json['selleraddress'];
    sellerwebsite = json['sellerwebsite'];
    sellerbkashaccount = json['sellerbkashaccount'];
    sellerrocketaccount = json['sellerrocketaccount'];
    sellernagodaccount = json['sellernagodaccount'];
    sellerbankaccount = json['sellerbankaccount'];
    sellerbankname = json['sellerbankname'];
    sellerbankbranch = json['sellerbankbranch'];
    sellerroutingno = json['sellerroutingno'];
    publishproduct = json['publishproduct'];
    commisiontype = json['commisiontype'];
    commision = json['commision'];
    featurevandor = json['featurevandor'];
    agree = json['agree'];
    verify = json['verify'];
    forgetcode = json['forgetcode'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shopname'] = this.shopname;
    data['slug'] = this.slug;
    data['shoplogo'] = this.shoplogo;
    data['shopbanner'] = this.shopbanner;
    data['sellerphone'] = this.sellerphone;
    data['sellerphone2'] = this.sellerphone2;
    data['selleremail'] = this.selleremail;
    data['contperson'] = this.contperson;
    data['sellercash'] = this.sellercash;
    data['sellerwithdraw'] = this.sellerwithdraw;
    data['selleraddress'] = this.selleraddress;
    data['sellerwebsite'] = this.sellerwebsite;
    data['sellerbkashaccount'] = this.sellerbkashaccount;
    data['sellerrocketaccount'] = this.sellerrocketaccount;
    data['sellernagodaccount'] = this.sellernagodaccount;
    data['sellerbankaccount'] = this.sellerbankaccount;
    data['sellerbankname'] = this.sellerbankname;
    data['sellerbankbranch'] = this.sellerbankbranch;
    data['sellerroutingno'] = this.sellerroutingno;
    data['publishproduct'] = this.publishproduct;
    data['commisiontype'] = this.commisiontype;
    data['commision'] = this.commision;
    data['featurevandor'] = this.featurevandor;
    data['agree'] = this.agree;
    data['verify'] = this.verify;
    data['forgetcode'] = this.forgetcode;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Productbrand {
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
  String? brandName;

  Productbrand(
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
      this.brandName});

  Productbrand.fromJson(Map<String, dynamic> json) {
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
    brandName = json['brandName'];
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
    data['brandName'] = this.brandName;
    return data;
  }
}
