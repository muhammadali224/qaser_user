import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/function/request_location_permission.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/address_data.dart';
import '../user_controller/user_controller.dart';

class AddLocationDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  Rx<UserModel> user = Get.find<UserController>().user.obs;

  double? lat;
  double? long;
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController note = TextEditingController();
  AddressData addressData = AddressData(Get.find());

  List<Placemark>? placeMarks;

  initData() async {
    await requestLocationPermissions();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    getAddressInfo();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
      user.value.usersId!,
      name.text,
      city.text,
      street.text,
      note.text,
      long!,
      lat!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.home);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  getAddressInfo() async {
    statusRequest = StatusRequest.loading;
    update();
    placeMarks = await placemarkFromCoordinates(lat!, long!);
    statusRequest = StatusRequest.none;
    update();
    Placemark place = placeMarks![0];
    Placemark place2 = placeMarks![2];
    city.text = place.locality ?? "";
    street.text = place2.street ?? "";
    name.text = place.administrativeArea ?? "";
    update();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
