import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/source/remote/address_data.dart';

class AddLocationDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  double? lat;
  double? long;
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController note = TextEditingController();
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<Placemark>? placemarks;

  initData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    getAddressInfo();
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
      myServices.sharedPref.getString('userId')!,
      name.text,
      city.text,
      street.text,
      note.text,
      long.toString(),
      lat.toString(),
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
    placemarks = await placemarkFromCoordinates(lat!, long!);
    statusRequest = StatusRequest.none;
    update();
    Placemark place = placemarks![0];
    Placemark place2 = placemarks![2];
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
