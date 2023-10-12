class ItemCountModel {
  int? countItems;
  int? weightSizeId;
  String? subItemName;
  String? subItemNameAr;
  num? subItemValue;
  num? cartItemPrice;

  ItemCountModel({
    this.countItems,
    this.weightSizeId,
    this.subItemName,
    this.subItemNameAr,
    this.subItemValue,
    this.cartItemPrice,
  });

  ItemCountModel.fromJson(Map<String, dynamic> json) {
    countItems = json['countItems'];
    weightSizeId = json['weight_size_id'];
    subItemName = json['sub_item_name'];
    subItemNameAr = json['sub_item_name_ar'];
    subItemValue = json['sub_item_value'];
    cartItemPrice = json['cart_item_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['countItems'] = countItems;
    data['weight_size_id'] = weightSizeId;
    data['sub_item_name'] = subItemName;
    data['sub_item_name_ar'] = subItemNameAr;
    data['sub_item_value'] = subItemValue;
    data['cart_item_price'] = cartItemPrice;
    return data;
  }

  @override
  toString() {
    return '''
      $countItems,
      $weightSizeId,
      $subItemName,
      $subItemNameAr,
      $subItemValue,
      $cartItemPrice,
    ''';
  }
}
