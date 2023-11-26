import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/cart_controller/cart_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../data/model/cart_model.dart';

class CartItemCount extends GetView<CartControllerImp> {
  final CartModel cartModel;

  const CartItemCount({required this.cartModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            cartModel.countitems = cartModel.countitems! + 1;
            controller.update();

            // controller.addCart(
            //     cartModel.itemsId!,
            //     cartModel.weightSizeId.toString(),
            //     cartModel.cartItemPrice!,
            //     cartModel.countitems!);
          },
          child: Icon(
            Icons.add_circle,
            color: AppColor.primaryColor,
          ),
        ),
        GetBuilder<CartControllerImp>(builder: (controller) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: AnimatedFlipCounter(
              textStyle: const TextStyle(fontSize: 22),
              duration: const Duration(milliseconds: 500),
              value: cartModel.countitems!, // pass in a value like 2014
            ),
          );
        }),
        InkWell(
          onTap: () {
            if (cartModel.countitems! > 0) {
              cartModel.countitems = cartModel.countitems! - 1;
              controller.update();
              controller.deleteFromCart(cartModel.itemsId!);
            }
          },
          child: Icon(
            Icons.remove_circle,
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}
