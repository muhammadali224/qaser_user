import 'dart:convert';

import 'package:get/get.dart';
import 'package:qaser_user/core/services/services.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/get_box_key.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/address_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/shared/anonymous_user.dart';
import '../../data/source/remote/address_data.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddress(user.usersId!);
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

  @override
  void onInit() async {
    user =
        UserModel.fromJson(jsonDecode(myServices.getBox.read(GetBoxKey.user)));
    getData();
    super.onInit();
  }
}
