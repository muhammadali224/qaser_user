import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/address_model.dart';
import '../../data/source/remote/address_data.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getAddress(myServices.sharedPref.getString('userId')!);
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

  deleteAddress(String addressId) {
    addressData.deleteAddress(addressId);
    data.removeWhere((element) => element.addressId.toString() == addressId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
