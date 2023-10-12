import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/address_model.dart';
import '../../data/model/user_detail_model.dart';
import '../../data/source/remote/address_data.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;
  final UserPreferences userManagement = Get.find<UserPreferences>();
  late UserModel user;

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
    await userManagement.initUser();
    user = userManagement.user;
    getData();
    super.onInit();
  }
}
