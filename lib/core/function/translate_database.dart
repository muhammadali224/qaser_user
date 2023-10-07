import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../services/services.dart';

translateDatabase(String ar, String en) {
  MyServices myServices = Get.find();
  if (myServices.sharedPref.getString('language') == 'ar') {
    return ar;
  } else {
    return en.capitalizeEach();
  }
}
