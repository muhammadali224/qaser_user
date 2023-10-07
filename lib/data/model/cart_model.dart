class CartModel {
  String? subItemsPrice;
  String? countitems;
  String? cartId;
  String? cartUserid;
  String? cartItemid;
  String? cartItemNote;
  String? cartOrders;
  String? cartSizeWeightId;
  String? cartItemPrice;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsImage;
  String? itemsActive;
  String? weightSizeId;
  String? subItemName;
  String? subItemNameAr;
  String? subItemValue;

  CartModel(
      {this.subItemsPrice,
      this.countitems,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.cartItemNote,
      this.cartOrders,
      this.cartSizeWeightId,
      this.cartItemPrice,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsImage,
      this.itemsActive,
      this.weightSizeId,
      this.subItemName,
      this.subItemNameAr,
      this.subItemValue});

  CartModel.fromJson(Map<String, dynamic> json) {
    subItemsPrice = json['subItemsPrice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    cartItemNote = json['cart_item_note'];
    cartOrders = json['cart_orders'];
    cartSizeWeightId = json['cart_size_weight_id'];
    cartItemPrice = json['cart_item_price'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    weightSizeId = json['weight_size_id'];
    subItemName = json['sub_item_name'];
    subItemNameAr = json['sub_item_name_ar'];
    subItemValue = json['sub_item_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['subItemsPrice'] = subItemsPrice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['cart_item_note'] = cartItemNote;
    data['cart_orders'] = cartOrders;
    data['cart_size_weight_id'] = cartSizeWeightId;
    data['cart_item_price'] = cartItemPrice;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_image'] = itemsImage;
    data['items_active'] = itemsActive;
    data['weight_size_id'] = weightSizeId;
    data['sub_item_name'] = subItemName;
    data['sub_item_name_ar'] = subItemNameAr;
    data['sub_item_value'] = subItemValue;
    return data;
  }
}
