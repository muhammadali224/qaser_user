class OffersImageModel {
  int? id;
  String? offerImageUrl;
  int? isActive;

  OffersImageModel({this.id, this.offerImageUrl, this.isActive});

  OffersImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerImageUrl = json['offer_image_url'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['offer_image_url'] = offerImageUrl;
    data['isActive'] = isActive;
    return data;
  }
}
