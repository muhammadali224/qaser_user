import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/address_controller/add_location_details_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/function/valid_input.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/custom_text_form_field.dart';

class AddLocationDetails extends StatelessWidget {
  const AddLocationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddLocationDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: Text("addAddress".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              IconBroken.Arrow___Right_2,
              size: 30,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddLocationDetailsController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        CustomTextFormField(
                            title: 'name'.tr,
                            hint: 'name'.tr,
                            icon: Icons.near_me_outlined,
                            myController: controller.name,
                            valid: (val) {
                              return validInput(val!, 4, 50, 'name');
                            }),
                        CustomTextFormField(
                            title: 'city'.tr,
                            hint: 'city'.tr,
                            icon: Icons.location_city_outlined,
                            myController: controller.city,
                            valid: (val) {
                              return validInput(val!, 4, 50, 'city');
                            }),
                        CustomTextFormField(
                            title: 'street'.tr,
                            hint: 'street'.tr,
                            icon: Icons.streetview_rounded,
                            myController: controller.street,
                            valid: (val) {
                              return validInput(val!, 4, 50, 'street');
                            }),
                        CustomTextFormField(
                            title: 'note'.tr,
                            hint: 'note'.tr,
                            icon: Icons.note_add_outlined,
                            myController: controller.note,
                            valid: (valid) {
                              return null;
                            }),
                        CustomAuthButton(
                            text: 'add'.tr,
                            onPressed: () {
                              controller.addAddress();
                            })
                      ],
                    ),
                  )),
        ));
  }
}
