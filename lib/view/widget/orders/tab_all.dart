import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orders_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../data/model/orders_model.dart';
import 'order_custom_card.dart';

class TabAll extends GetView<OrdersController> {
  final List<OrdersModel> data;

  const TabAll({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => OrdersCard(
            ordersModel: data[index],
          ),
        ),
      ),
    );
  }
}
