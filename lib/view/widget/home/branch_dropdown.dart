import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/function/translate_database.dart';

class BranchDropDownList extends GetView<HomeControllerImp> {
  const BranchDropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            // translateDatabase(ar, en)
            controller.getBranchName(),
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: [
            ...List.generate(
                controller.branches.length,
                (index) => DropdownMenuItem(
                      value: controller.branches[index].branchId,
                      child: Text(
                        "${translateDatabase(controller.branches[index].branchNameAr!, controller.branches[index].branchNameEn!)}",
                      ),
                    )),
          ],
          value: controller.selectedValue,
          onChanged: (String? value) => controller.onChangeDropButton(value!),
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: double.infinity,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      );
    });
  }
}
