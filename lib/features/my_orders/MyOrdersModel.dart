class MyOrders {
  List<Customerorders>? customerorders;

  MyOrders({this.customerorders});

  MyOrders.fromJson(Map<String, dynamic> json) {
    if (json['customerorders'] != null) {
      customerorders = <Customerorders>[];
      json['customerorders'].forEach((v) {
        customerorders!.add(new Customerorders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerorders != null) {
      data['customerorders'] =
          this.customerorders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customerorders {
  int? orderIdPrimary;
  int? customerId;
  String? ordertrack;
  int? orderTotal;
  int? cshippingfee;
  int? cdiscount;
  String? offertype;
  int? additionalshipping;
  int? shippingId;
  int? orderSubtotal;
  int? totalproductpoint;
  int? usemypoint;
  String? orderStatus;
  String? createdAt;
  String? updatedAt;

  Customerorders(
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
      this.updatedAt});

  Customerorders.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
