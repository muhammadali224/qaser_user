import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  // if (type == "userName" && val.length ) {
  //   return 'userNameValidError'.tr;
  // }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return 'emailValidError'.tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'phoneValidError'.tr;
    }
  }

  if (val.isEmpty) {
    return 'emptyValidError'.tr;
  }
  if (val.length < min) {
    return 'minValidError'.tr + min.toString();
  }
  if (val.length > max) {
    return 'maxValidError'.tr + max.toString();
  }
}
