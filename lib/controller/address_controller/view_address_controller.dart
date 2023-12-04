import 'package:get/get.dart';
import 'package:qaser_user/core/services/app.service.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/function/request_location_permission.dart';
import '../../data/model/address_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/source/remote/address_data.dart';
import '../user_controller/user_controller.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  RxList<AddressModel> data = RxList<AddressModel>([]);
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

  @override
  void onInit() async {
    if (Get.currentRoute == "/addressView") {
      await requestLocationPermissions();
    }

    getData();
    super.onInit();
  }
}
