import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../controller/orders/orders_controller.dart';
import '../../controller/orders/rate_order_controller.dart';
import '../../generated/assets.dart';

showRatingDialog(BuildContext context, String orderId,
    {bool isOrderScreen = false}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
            initialRating: 3.0,
            title: Text(
              'ratingDialog'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            message: Text(
              'rateDialogBody'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Lottie.asset(Assets.lottieRating, height: 200, width: 200),
            submitButtonText: 'submit'.tr,
            commentHint: 'rateHint'.tr,
            onSubmitted: (response) {
              if (isOrderScreen == true) {
                OrdersController orderController = Get.find();

                orderController.rateOrder(
                    response.rating.toString(), response.comment, orderId);
              } else {
                RateOrdersController controller = Get.find();
                controller.rateOrder(
                    response.rating.toString(), response.comment, orderId);
              }
            },
          ));
}
