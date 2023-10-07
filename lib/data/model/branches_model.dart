class BranchesModel {
  String? branchId;
  String? branchNameAr;
  String? branchNameEn;
  String? branchIsOpen;
  String? branchLang;
  String? branchLat;
  String? branchPhone1;
  String? branchPhone2;
  String? branchFacebookUrl;

  BranchesModel(
      {this.branchId,
      this.branchNameAr,
      this.branchNameEn,
      this.branchIsOpen,
      this.branchLang,
      this.branchLat,
      this.branchPhone1,
      this.branchPhone2,
      this.branchFacebookUrl});

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
    return data;
  }
}
