class BranchesModel {
  int? branchId;
  String? branchNameAr;
  String? branchNameEn;
  int? branchIsOpen;
  double? branchLang;
  double? branchLat;
  String? branchPhone1;
  String? branchPhone2;
  String? branchFacebookUrl;
  num? branchDeliveryCharge;
  int? branchIsFixed;
  int? branchZone;
  int? branchDeliveryFixCharge;

  BranchesModel(
      {this.branchId,
      this.branchNameAr,
      this.branchNameEn,
      this.branchIsOpen,
      this.branchLang,
      this.branchLat,
      this.branchPhone1,
      this.branchPhone2,
      this.branchFacebookUrl,
      this.branchDeliveryCharge,
      this.branchIsFixed,
      this.branchZone,
      this.branchDeliveryFixCharge});

  BranchesModel.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    branchNameAr = json['branch_name_ar'];
    branchNameEn = json['branch_name_en'];
    branchIsOpen = json['branch_is_open'];
    branchLang = json['branch_lang'];
    branchLat = json['branch_lat'];
    branchPhone1 = json['branch_phone1'];
    branchPhone2 = json['branch_phone2'];
    branchFacebookUrl = json['branch_facebook_url'];
    branchDeliveryCharge = json['branch_delivery_charge'];
    branchIsFixed = json['branch_isFixed'];
    branchZone = json['branch_zone'];
    branchDeliveryFixCharge = json['branch_delivery_fix_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['branch_id'] = branchId;
    data['branch_name_ar'] = branchNameAr;
    data['branch_name_en'] = branchNameEn;
    data['branch_is_open'] = branchIsOpen;
    data['branch_lang'] = branchLang;
    data['branch_lat'] = branchLat;
    data['branch_phone1'] = branchPhone1;
    data['branch_phone2'] = branchPhone2;
    data['branch_facebook_url'] = branchFacebookUrl;
    data['branch_delivery_charge'] = branchDeliveryCharge;
    data['branch_isFixed'] = branchIsFixed;
    data['branch_zone'] = branchZone;
    data['branch_delivery_fix_charge'] = branchDeliveryFixCharge;
    return data;
  }
}
