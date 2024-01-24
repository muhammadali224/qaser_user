import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/shared/branches.dart';

class BranchDropDownList extends GetView<HomeControllerImp> {
  const BranchDropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Obx(() {
        return controller.isLoading.value
            ? const CircularProgressIndicator()
            : DropdownButtonHideUnderline(
                child: DropdownButton2<int>(
                  isExpanded: true,
                  items: branchesList
                      .map((e) => DropdownMenuItem(
                            value: e.branchId,
                            child: Text(
                              "${translateDatabase(e.branchNameAr!, e.branchNameEn!)}",
                            ),
                          ))
                      .toList(),
                  value: controller.selectedValue,
                  onChanged: controller.onChangeDropButton,
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
    });
  }
}
