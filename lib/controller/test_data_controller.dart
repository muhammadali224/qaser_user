import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/function/handling_data_controller.dart';
import '../data/source/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
