import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qaser_user/controller/items_controller/item_details_controller.dart';

class ButtomNaviBar extends GetView<ItemDetailsControllerImpl> {
  const ButtomNaviBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                height: 60,
                onPressed: () {
                  controller.cartController.addCart(
                    controller.itemsModel.itemsId!.toString(),
                    controller.selectedSubItems?.subItemId.toString(),
                    controller.totalPrice.toStringAsFixed(2),
                    controller.itemsCount.value.toString(),
                    controller.totalPoint.value.toString(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("addToCart".tr,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Icon(
                      Bootstrap.cart_plus,
                      color: Colors.white,
                    )
                  ],
                ),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
