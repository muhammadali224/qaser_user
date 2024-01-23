import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/order_details_controller.dart';
import '../../../core/function/translate_database.dart';

class OrderTableDetails extends GetView<OrderDetailsController> {
  const OrderTableDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          controller.data.length,
          (index) => Column(
            children: [
              ListTile(
                isThreeLine: true,
                title: AutoSizeText(
                    "${controller.data[index].cartItemCount!} X ${translateDatabase(controller.data[index].itemsNameAr!, controller.data[index].itemsName!)}",
                    maxLines: 20,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.data[index].subItemsNameAr != null)
                      AutoSizeText(controller.data[index].subItemsNameAr!,
                          maxFontSize: 18,
                          style: TextStyle(color: Colors.grey.shade600)),
                    if (controller.data[index].cartItemNote! != "  ")
                      AutoSizeText(controller.data[index].cartItemNote!,
                          maxFontSize: 18,
                          style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
                leading: AutoSizeText(
                    "${controller.data[index].cartItemPrice! / controller.data[index].cartItemCount!}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                trailing: AutoSizeText(
                    controller.data[index].cartItemPrice.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              if (index != controller.data.length - 1) const Divider(),
            ],
          ),
        )
      ],
    );
  }
}
