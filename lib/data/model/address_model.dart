class AddressModel {
  String? addressId;
  String? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressNote;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUserId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressNote,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserId = json['address_userId'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressNote = json['address_note'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address_id'] = addressId;
    data['address_userId'] = addressUserId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_note'] = addressNote;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
