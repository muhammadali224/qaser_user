import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/services/app.service.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/color.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/address_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/address_data.dart';
import '../user_controller/user_controller.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  RxList<AddressModel> data = <AddressModel>[].obs;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Rx<UserModel> user = Get.find<UserController>().user.obs;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddress(user.value.usersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failed;
          update();
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  deleteAddress(int addressId) {
    addressData.deleteAddress(addressId);
    data.removeWhere((element) => element.addressId == addressId);
    update();
  }

  requestLocationPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.rawSnackbar(
          duration: const Duration(seconds: 5),
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('enableLocation'.tr),
              TextButton(
                onPressed: () {
                  // AppSettings.openLocationSettings();
                },
                child: Text(
                  'goToSetting'.tr,
                  style: TextStyle(color: AppColor.backgroundColor),
                ),
              )
            ],
          ));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
    }
  }

  @override
  void onInit() async {
    // user =
    //     UserModel.fromJson(jsonDecode(myServices.getBox.read(GetBoxKey.user)));
    if (Get.currentRoute == "/addressView") {
      await requestLocationPermissions();
    }

    getData();
    super.onInit();
  }
}
