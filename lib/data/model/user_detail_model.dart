class UserModel {
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;
  String? usersImage;
  int? usersVerifycode;
  int? usersApprove;
  String? usersCreate;
  int? userFavBranchId;
  int? branchId;
  String? branchNameAr;
  String? branchNameEn;
  int? branchIsOpen;
  double? branchLang;
  double? branchLat;
  String? branchPhone1;
  String? branchPhone2;
  String? branchFacebookUrl;
  double? branchDeliveryCharge;
  int? branchIsFixed;
  int? branchZone;
  int? branchDeliveryFixCharge;

  UserModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPassword,
      this.usersPhone,
      this.usersImage,
      this.usersVerifycode,
      this.usersApprove,
      this.usersCreate,
      this.userFavBranchId,
      this.branchId,
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

  UserModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersPhone = json['users_phone'];
    usersImage = json['users_image'];
    usersVerifycode = json['users_verifycode'];
    usersApprove = json['users_approve'];
    usersCreate = json['users_create'];
    userFavBranchId = json['user_fav_branch_id'];
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
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_password'] = usersPassword;
    data['users_phone'] = usersPhone;
    data['users_image'] = usersImage;
    data['users_verifycode'] = usersVerifycode;
    data['users_approve'] = usersApprove;
    data['users_create'] = usersCreate;
    data['user_fav_branch_id'] = userFavBranchId;
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
