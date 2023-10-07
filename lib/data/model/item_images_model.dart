class ItemImagesModel {
  String? itemImageId;
  String? itemImageItemId;
  String? itemImageName;

  ItemImagesModel({
    this.itemImageId,
    this.itemImageItemId,
    this.itemImageName,
  });

  ItemImagesModel.fromJson(Map<String, dynamic> json) {
    itemImageId = json['item_image_id'];
    itemImageItemId = json['item_image_item_id'];
    itemImageName = json['item_image_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['item_image_id'] = itemImageId;
    data['item_image_item_id'] = itemImageItemId;
    data['item_image_name'] = itemImageName;
    return data;
  }
}
