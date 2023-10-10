class OrderDetailsModel {
  String? itemsprice;
  String? countitems;
  String? cartItemid;
  String? cartUserid;
  String? cartItemNote;
  String? cartOrders;
  String? cartSizeWeightId;
  String? cartItemPrice;
  String? itemsName;
  String? itemsNameAr;
  String? itemsImage;
  String? branchId;

  OrderDetailsModel(
      {this.itemsprice,
      this.countitems,
      this.cartItemid,
      this.cartUserid,
      this.cartItemNote,
      this.cartOrders,
      this.cartSizeWeightId,
      this.cartItemPrice,
      this.itemsName,
      this.itemsNameAr,
      this.itemsImage,
      this.branchId});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartItemid = json['cart_itemid'];
    cartUserid = json['cart_userid'];
    cartItemNote = json['cart_item_note'];
    cartOrders = json['cart_orders'];
    cartSizeWeightId = json['cart_size_weight_id'];
    cartItemPrice = json['cart_item_price'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImage = json['items_image'];
    branchId = json['branch_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_itemid'] = cartItemid;
    data['cart_userid'] = cartUserid;
    data['cart_item_note'] = cartItemNote;
    data['cart_orders'] = cartOrders;
    data['cart_size_weight_id'] = cartSizeWeightId;
    data['cart_item_price'] = cartItemPrice;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_image'] = itemsImage;
    data['branch_id'] = branchId;
    return data;
  }
}
