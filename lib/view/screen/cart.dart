import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:qaser_user/data/shared/anonymous_user.dart';

import '../../controller/cart_controller/cart_controller.dart';
import '../../core/class/handling_data_view.dart';
import '../../core/function/open_select_location_bottom_sheet.dart';
import '../../data/shared/branches.dart';
import '../widget/back_appbar.dart';
import '../widget/bottom_cart_button.dart';
import '../widget/cart/checkout_coupon.dart';
import '../widget/cart/checkout_order_list.dart';
import '../widget/cart/checkout_title.dart';
import '../widget/cart/custom_total_text.dart';
import '../widget/cart/deliver_to.dart';
import '../widget/cart/items_count_text.dart';
import '../widget/cart/list_cart_items.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    // CartControllerImp  Get.find();
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("cart".tr),
          leading: BackAppBar(),
          actions: const [
            ItemsCountText(),
          ],
        ),
        bottomNavigationBar: selectedBranch.branchIsOpen == 1 &&
                user.usersIsAnonymous == 0 &&
                controller.data.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ButtomNavigatButton(
                    icon: IconBroken.Wallet,
                    color: Colors.red,
                    title: 'checkout',
                    onPressed: () => controller.checkout(),
                  ),
                ],
              )
            : Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                height: 40,
                width: double.infinity,
                child: Text(
                  selectedBranch.branchIsOpen == 0
                      ? "closeBranch"
                      : user.usersIsAnonymous == 0
                          ? "signInFirst"
                          : "addToCartFirst",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ...List.generate(
                  controller.data.length,
                  (index) => CustomListCartItems(
                        cartModel: controller.data[index],
                      )),
              // SizedBox(height: 20),

              const Divider(
                endIndent: 10,
                indent: 10,
                thickness: 1,
                color: Colors.red,
                height: 40,
              ),
              const CheckoutCoupon(),
              const CheckoutTitle(title: 'chooseOrderType'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                      controller.orderMethod.length,
                      (i) => CheckoutOrderList(
                            onChanged: () {
                              controller.selectOrderMethod(i);
                              if (i == 1) {
                                openLocationBottomSheet();
                              }
                            },
                            value: i,
                            title: controller.orderMethod[i]['title'],
                            icon: controller.orderMethod[i]['icon'],
                          )),
                ],
              ),
              if (controller.selectedOrderType == 1 &&
                  controller.selectedLocation != null)
                const DeliverTo(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: const DottedDashedLine(
                    width: 100,
                    axis: Axis.horizontal,
                    height: 0,
                  )),
              const CustomTotalPriceText(),
            ],
          ),
        ),
      );
    });
  }
}
