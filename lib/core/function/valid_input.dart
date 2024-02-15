import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  // if (type == "userName" && val.length ) {
  //   return 'userNameValidError'.tr;
  // }

  if (type == "email") {
    if (!GetUtils.isEmail(val.trim())) {
      return 'emailValidError'.tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val.trim().removeAllWhitespace)) {
      return 'phoneValidError'.tr;
    }
  }

  if (val.trim().isEmpty) {
    return 'emptyValidError'.tr;
  }
  if (val.trim().length < min) {
    return 'minValidError'.tr + min.toString();
  }
  if (val.trim().length > max) {
    return 'maxValidError'.tr + max.toString();
  }
}
