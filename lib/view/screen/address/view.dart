import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address_controller/view_address_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/routes.dart';
import '../../widget/address/listTile_view.dart';
import '../../widget/back_appbar.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("allAddress".tr),
        leading: BackAppBar(),
      ),
      body: GetBuilder<ViewAddressController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return AddressList(
                        addressModel: controller.data[index],
                        onDelete: () {
                          controller
                              .deleteAddress(controller.data[index].addressId!);
                        },
                      );
                    },
                  ),
                ),
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
