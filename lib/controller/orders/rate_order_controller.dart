import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/orders_model.dart';
import '../../data/source/remote/rate_orders_data.dart';

class RateOrdersController extends GetxController {
  Map orderStatus = {
    '0': 'pending',
    '1': 'approved',
    '2': 'onTheRoad',
    '3': 'completed',
    '4': 'canceled',
  };
  Map orderType = {
    '0': 'pickup',
    '1': 'delivery',
  };
  Map paymentType = {
    '0': 'cash',
    '1': 'creditCard',
    '2': 'paypal',
  };

  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];
  MyServices myServices = Get.find();
  RateOrdersData ordersData = RateOrdersData(Get.find());

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersData.getData(myServices.sharedPref.getString('userId')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  rateOrder(String rate, String comment, String id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.rateOrders(
      id,
      rate,
      comment,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getOrders();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
