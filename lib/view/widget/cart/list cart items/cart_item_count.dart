import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/cart_controller/cart_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../data/model/cart_model/cart_model.dart';

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
            var count = cartModel.cartItemCount! + 1;
            var price = (cartModel.cartItemPrice! / cartModel.cartItemCount!);
            var totalPrice = price * count;
            var points = (cartModel.cartItemPoint! / cartModel.cartItemPrice!);
            var totalPoints = points * totalPrice;

            controller.addCart(
              cartModel.itemsId.toString(),
              cartModel.weightSizeId.toString(),
              totalPrice.toStringAsFixed(2),
              count.toString(),
              totalPoints.toString(),
            );
          },
          child: Icon(Icons.add_circle, color: AppColor.primaryColor),
        ),
        GetBuilder<CartControllerImp>(builder: (controller) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: AnimatedFlipCounter(
              textStyle: const TextStyle(fontSize: 22),
              duration: const Duration(milliseconds: 500),
              value: cartModel.cartItemCount!, // pass in a value like 2014
            ),
          );
        }),
        InkWell(
          onTap: () {
            if (cartModel.cartItemCount! > 0) {
              var count = cartModel.cartItemCount! - 1;
              var price = (cartModel.cartItemPrice! / cartModel.cartItemCount!);
              var totalPrice = price * count;
              var points =
                  (cartModel.cartItemPoint! / cartModel.cartItemPrice!);
              var totalPoints = points * totalPrice;

              controller.addCart(
                cartModel.itemsId.toString(),
                cartModel.weightSizeId.toString(),
                totalPrice.toStringAsFixed(2),
                count.toString(),
                totalPoints.toString(),
              );
            } else if (cartModel.cartItemCount == 0) {
              controller.deleteFromCart(cartModel.cartId!);
            }
          },
          child: Icon(Icons.remove_circle, color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
