class TrackOrderModel {
  Trackorder? trackorder;

  TrackOrderModel({this.trackorder});

  TrackOrderModel.fromJson(Map<String, dynamic> json) {
    trackorder = json['trackorder'] != null
        ? new Trackorder.fromJson(json['trackorder'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackorder != null) {
      data['trackorder'] = this.trackorder!.toJson();
    }
    return data;
  }
}

class Trackorder {
  int? orderIdPrimary;
  int? customerId;
  String? ordertrack;
  int? orderTotal;
  int? cshippingfee;
  dynamic cdiscount;
  dynamic offertype;
  int? additionalshipping;
  int? shippingId;
  int? orderSubtotal;
  int? totalproductpoint;
  dynamic usemypoint;
  String? orderStatus;
  String? createdAt;
  String? updatedAt;
  Status? status;

  Trackorder(
      {this.orderIdPrimary,
      this.customerId,
      this.ordertrack,
      this.orderTotal,
      this.cshippingfee,
      this.cdiscount,
      this.offertype,
      this.additionalshipping,
      this.shippingId,
      this.orderSubtotal,
      this.totalproductpoint,
      this.usemypoint,
      this.orderStatus,
      this.createdAt,
      this.updatedAt,
      this.status});

  Trackorder.fromJson(Map<String, dynamic> json) {
    orderIdPrimary = json['orderIdPrimary'];
    customerId = json['customerId'];
    ordertrack = json['ordertrack'];
    orderTotal = json['orderTotal'];
    cshippingfee = json['cshippingfee'];
    cdiscount = json['cdiscount'];
    offertype = json['offertype'];
    additionalshipping = json['additionalshipping'];
    shippingId = json['shippingId'];
    orderSubtotal = json['orderSubtotal'];
    totalproductpoint = json['totalproductpoint'];
    usemypoint = json['usemypoint'];
    orderStatus = json['orderStatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderIdPrimary'] = this.orderIdPrimary;
    data['customerId'] = this.customerId;
    data['ordertrack'] = this.ordertrack;
    data['orderTotal'] = this.orderTotal;
    data['cshippingfee'] = this.cshippingfee;
    data['cdiscount'] = this.cdiscount;
    data['offertype'] = this.offertype;
    data['additionalshipping'] = this.additionalshipping;
    data['shippingId'] = this.shippingId;
    data['orderSubtotal'] = this.orderSubtotal;
    data['totalproductpoint'] = this.totalproductpoint;
    data['usemypoint'] = this.usemypoint;
    data['orderStatus'] = this.orderStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Status {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Status({this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
