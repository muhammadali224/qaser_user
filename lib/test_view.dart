import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/test_data_controller.dart';
import 'core/class/handling_data_view.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
              itemCount: controller.data.length,
            ));
      }),
    );
  }
}
