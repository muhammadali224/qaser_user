import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../controller/orders/order_details_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';

class OrderTableDetails extends GetView<OrderDetailsController> {
  const OrderTableDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.lerp(
          TableBorder(top: BorderSide(width: 2, color: AppColor.primaryColor)),
          TableBorder(
              bottom: BorderSide(width: 4, color: AppColor.primaryColor)),
          0.5),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        // 0: FixedColumnWidth(150),
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      children: [
        TableRow(
            decoration: BoxDecoration(color: AppColor.fifthColor),
            children: [
              Text('product'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold)),
              Text('quantity'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold)),
              Text('price'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold)),
              Text("tot".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold))
            ]),
        ...List.generate(
          controller.data.length,
          (index) => TableRow(
              decoration: BoxDecoration(color: AppColor.cardGrey),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                      "${translateDatabase(controller.data[index].itemsNameAr!, controller.data[index].itemsName!)}"
                          .capitalizeEach(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18)),
                ),
                Text(controller.data[index].countitems!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18)),
                Text(controller.data[index].itemDiscounntPrice!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18)),
                Text(
                    "${int.parse(controller.data[index].itemDiscounntPrice!) * int.parse(controller.data[index].countitems!)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18))
              ]),
        )
      ],
    );
  }
}
