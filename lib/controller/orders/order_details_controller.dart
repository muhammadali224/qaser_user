import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/orders_model.dart';
import '../../data/source/remote/orders_data.dart';
import 'orders_controller.dart';

class OrderDetailsController extends GetxController {
  Completer<GoogleMapController>? completerController;
  OrdersController ordersController = Get.find();
  late OrdersModel ordersModel;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
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
  List<OrderDetailsModel> data = [];
  OrdersData ordersData = OrdersData(Get.find());

  initData() {
    completerController = Completer<GoogleMapController>();
    if (ordersModel.ordersType == "1") {
      kGooglePlex = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 17,
      );
      markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(
          double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!),
        ),
      ));
    }
  }

  orderDelete() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersDelete(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.back();
        ordersController.refreshOrders();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  orderCancel() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersCancel(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.back();
        ordersController.refreshOrders();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  getOrderDetails() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.ordersDetails(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrderDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    getOrderDetails();
    initData();
    super.onInit();
  }
}
