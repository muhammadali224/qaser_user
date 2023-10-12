import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/user_preference.dart';
import '../../data/model/orders_model.dart';
import '../../data/source/remote/orders_data.dart';
import '../../data/source/remote/rate_orders_data.dart';

class OrdersController extends GetxController {
  List orderTabs = [
    {'title': 'all', 'icon': Icons.all_inbox},
    {'title': 'pending', 'icon': Icons.pending_actions_outlined},
    {'title': 'onTheRoad', 'icon': Icons.delivery_dining_outlined},
    {'title': 'completed', 'icon': Icons.done_rounded},
    {'title': 'canceled', 'icon': Icons.cancel_outlined},
  ];
  Map orderStatus = {
    '0': 'pending',
    '1': 'approved',
    '2': 'onTheRoad',
    '3': 'completed',
    '4': 'canceled',
    '5': 'canceled',
  };
  Map orderType = {
    '0': 'pickup',
    '1': 'delivery',
  };

  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> dataAll = [];
  List<OrdersModel> dataPending = [];
  List<OrdersModel> dataOnTheRoad = [];
  List<OrdersModel> dataCompleted = [];
  List<OrdersModel> dataCanceled = [];

  final UserPreferences userManagement = Get.find<UserPreferences>();

  OrdersData ordersData = OrdersData(Get.find());
  RateOrdersData ordersRateData = RateOrdersData(Get.find());

  getOrders() async {
    dataAll.clear();
    dataCanceled.clear();
    dataCompleted.clear();
    dataOnTheRoad.clear();
    dataPending.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getData(userManagement.user.usersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        dataAll.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
        dataPending.addAll(responseData
            .map((e) => OrdersModel.fromJson(e))
            .where((element) => element.ordersState == 0));
        dataOnTheRoad.addAll(responseData
            .map((e) => OrdersModel.fromJson(e))
            .where((element) => element.ordersState == 2));
        dataCompleted.addAll(responseData
            .map((e) => OrdersModel.fromJson(e))
            .where((element) => element.ordersState == 3));
        dataCanceled.addAll(responseData
            .map((e) => OrdersModel.fromJson(e))
            .where((element) =>
                element.ordersState == 4 || element.ordersState == 5));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  rateOrder(String rate, String comment, int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersRateData.rateOrders(
      id,
      rate,
      comment,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        refreshOrders();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  refreshOrders() {
    getOrders();
  }

  @override
  void onInit() async {
    await userManagement.initUser();
    getOrders();
    super.onInit();
  }
}
