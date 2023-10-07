class OrdersModel {
  String? ordersId;
  String? ordersUserid;
  String? ordersAddress;
  String? ordersType;
  String? ordersDeliveryFee;
  String? ordersPrice;
  String? ordersDiscountAmmount;
  String? ordersTotalPrice;
  String? ordersCoupon;
  String? ordersState;
  String? ordersTime;
  String? ordersRating;
  String? ordersNote;
  String? ordersBranch;
  String? addressId;
  String? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressNote;
  String? addressLat;
  String? addressLong;
  String? branchNameAr;
  String? branchNameEn;
  String? couponName;

  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersType,
      this.ordersDeliveryFee,
      this.ordersPrice,
      this.ordersDiscountAmmount,
      this.ordersTotalPrice,
      this.ordersCoupon,
      this.ordersState,
      this.ordersTime,
      this.ordersRating,
      this.ordersNote,
      this.ordersBranch,
      this.addressId,
      this.addressUserId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressNote,
      this.addressLat,
      this.addressLong,
      this.branchNameAr,
      this.branchNameEn,
      this.couponName});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersDeliveryFee = json['orders_delivery_fee'];
    ordersPrice = json['orders_price'];
    ordersDiscountAmmount = json['orders_discount_ammount'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCoupon = json['orders_coupon'];
    ordersState = json['orders_state'];
    ordersTime = json['orders_time'];
    ordersRating = json['orders_rating'];
    ordersNote = json['orders_note'];
    ordersBranch = json['orders_branch'];
    addressId = json['address_id'];
    addressUserId = json['address_userId'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressNote = json['address_note'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    branchNameAr = json['branch_name_ar'];
    branchNameEn = json['branch_name_en'];
    couponName = json['coupon_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_delivery_fee'] = ordersDeliveryFee;
    data['orders_price'] = ordersPrice;
    data['orders_discount_ammount'] = ordersDiscountAmmount;
    data['orders_total_price'] = ordersTotalPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_state'] = ordersState;
    data['orders_time'] = ordersTime;
    data['orders_rating'] = ordersRating;
    data['orders_note'] = ordersNote;
    data['orders_branch'] = ordersBranch;
    data['address_id'] = addressId;
    data['address_userId'] = addressUserId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_note'] = addressNote;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['branch_name_ar'] = branchNameAr;
    data['branch_name_en'] = branchNameEn;
    data['coupon_name'] = couponName;
    return data;
  }
}
