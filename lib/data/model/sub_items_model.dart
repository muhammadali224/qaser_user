class SubItemsModel {
  String? subItemId;
  String? itemId;
  String? isActive;
  String? weightSizeId;
  String? subItemName;
  String? subItemNameAr;
  String? subItemValue;

  SubItemsModel(
      {this.subItemId,
      this.itemId,
      this.isActive,
      this.weightSizeId,
      this.subItemName,
      this.subItemNameAr,
      this.subItemValue});

  SubItemsModel.fromJson(Map<String, dynamic> json) {
    subItemId = json['sub_item_id'];
    itemId = json['item_id'];
    isActive = json['isActive'];
    weightSizeId = json['weight_size_id'];
    subItemName = json['sub_item_name'];
    subItemNameAr = json['sub_item_name_ar'];
    subItemValue = json['sub_item_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sub_item_id'] = subItemId;
    data['item_id'] = itemId;
    data['isActive'] = isActive;
    data['weight_size_id'] = weightSizeId;
    data['sub_item_name'] = subItemName;
    data['sub_item_name_ar'] = subItemNameAr;
    data['sub_item_value'] = subItemValue;
    return data;
  }
}
