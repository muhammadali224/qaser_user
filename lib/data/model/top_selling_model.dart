class TopSellingModel {
  String? countItem;
  int? cartId;
  int? cartUserid;
  int? cartItemid;
  String? cartOrders;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsData;
  String? itemsCat;
  String? itemDiscountPrice;

  TopSellingModel(
      {this.countItem,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.cartOrders,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsData,
      this.itemsCat,
      this.itemDiscountPrice});

  TopSellingModel.fromJson(Map<String, dynamic> json) {
    countItem = json['countItem'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsData = json['items_data'];
    itemsCat = json['items_cat'];
    itemDiscountPrice = json['itemDiscounnt_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['countItem'] = countItem;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['cart_orders'] = cartOrders;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_data'] = itemsData;
    data['items_cat'] = itemsCat;
    data['itemDiscounnt_price'] = itemDiscountPrice;
    return data;
  }
}
