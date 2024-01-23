import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/orders_controller.dart';
import '../../widget/back_appbar.dart';
import '../../widget/orders/orders_appbar_tabs.dart';
import '../../widget/orders/tab_all.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return GetBuilder<OrdersController>(builder: (controller) {
      return DefaultTabController(
        length: controller.orderTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('myOrders'.tr),
            leading: BackAppBar(),
            bottom: TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              tabs: [
                ...List.generate(
                    controller.orderTabs.length,
                    (index) => OrdersTabStatus(
                          icon: controller.orderTabs[index]['icon'],
                          title: controller.orderTabs[index]['title'],
                        )),
              ],
            ),
          ),
          body: TabBarView(children: [
            TabAll(data: controller.dataAll),
            TabAll(data: controller.dataPending),
            TabAll(data: controller.dataOnTheRoad),
            TabAll(data: controller.dataCompleted),
            TabAll(data: controller.dataCanceled),
          ]),
        ),
      );
    });
  }
}
