import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:qaser_user/controller/user_controller/user_controller.dart';
import 'package:qaser_user/core/function/show_snackbar.dart';
import 'package:qaser_user/core/services/app.service.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/cart_model/cart_model.dart';
import '../../data/shared/branches.dart';
import '../../data/source/remote/cart_data.dart';
import '../../data/source/remote/checkout_data.dart';
import '../../generated/assets.dart';
import '../address_controller/view_address_controller.dart';

abstract class CartController extends GetxController {
  Future<void> addCart(String itemsId, String? weightAndSizeId,
      String cartItemPrice, String itemCount, String itemPointCount);

  Future<void> deleteFromCart(int itemsId);

  Future<void> getCart();

  void resetCart();

  Future<void> refreshCart();

  Future<void> addNoteToItem(int cartId);

  void selectOrderMethod(int val);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  TextEditingController couponController = TextEditingController();
  late TextEditingController noteController;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CheckoutData checkoutData = CheckoutData(Get.find());
  ViewAddressController addressController = Get.put(ViewAddressController());
  String deliveryFee = "0";
  RxBool isLoading = false.obs;
  double totalPrice = 0.0;
  double discount = 0.0;
  RxInt ordersCount = 0.obs;
  RxDouble price = 0.0.obs;
  String totalPoint = "0";

  int couponValue = 0;
  String? couponName;
  int? couponId;
  double distance = 0.0;

  int selectedOrderType = 0;
  int locationList = 0;
  int? selectedLocation;

  List orderMethod = [
    {
      "title": "pickup",
      'icon': Assets.lottiePickup,
    },
    {
      "title": "delivery",
      'icon': Assets.lottieDelivery,
    },
  ];

  String? address;

  @override
  addCart(itemsId, weightAndSizeId, cartItemPrice, itemCount,
      itemPointCount) async {
    if (int.parse(itemCount) > 0) {
      try {
        SmartDialog.showLoading(msg: "loading".tr);

        var response = await cartData.addToCart(
          UserController().user.usersId!.toString(),
          itemsId,
          weightAndSizeId,
          cartItemPrice,
          itemCount,
          itemPointCount,
        );
        statusRequest = handlingData(response);

        if (response['status'] == 'success') {
          SmartDialog.dismiss();

          Get.rawSnackbar(
            backgroundColor: Colors.green,
            message: "addCart".tr,
            icon: const Icon(Icons.add_shopping_cart),
            snackStyle: SnackStyle.GROUNDED,
            duration: const Duration(seconds: 1),
          );

          await refreshCart();
        }
      } catch (e) {
        throw Exception("Error ADD To Cart : $e");
      }
      SmartDialog.dismiss();
      update();
    }
  }

  @override
  selectOrderMethod(int val) {
    if (val == 0) {
      deliveryFee = "0";
      selectedLocation = null;
    }
    selectedOrderType = val;

    update();
  }

  @override
  deleteFromCart(cartId) async {
    try {
      var response = await cartData.removeFromCart(cartId);

      if (response['status'] == 'success') {
        !Get.isSnackbarOpen
            ? Get.rawSnackbar(
                message: "removeCart".tr,
                backgroundColor: Colors.red,
                icon: const Icon(
                  Icons.remove_shopping_cart,
                  color: Colors.white,
                ),
                snackStyle: SnackStyle.GROUNDED,
              )
            : null;
        refreshCart();
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception("Error Delete From Cart : $e");
    }
    update();
  }

  @override
  getCart() async {
    try {
      data.clear();
      statusRequest = StatusRequest.loading;
      isLoading.value = true;
      update();
      var response = await cartData.getCart(UserController().user.usersId!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          if (response['data']['status'] == 'success') {
            List responseData = response['data']['data'];
            data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          } else {
            statusRequest = StatusRequest.emptyCart;
            update();
          }
          if (response['total']['status'] == 'success') {
            price.value = (response['total']['data']['totalPrice']).toDouble();
            ordersCount.value = response['total']['data']['totalCount'];
            totalPoint = response['total']['data']['totalPoint'];
          } else {
            ordersCount.value = 0;
            price.value = 0.0;
            totalPoint = "0";
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
      isLoading.value = false;
    } catch (e) {
      throw Exception("Error Get Cart : $e");
    }
    update();
  }

  @override
  void onInit() async {
    noteController = TextEditingController();
    await getCart();

    super.onInit();
  }

  calculateDeliveryCharge() {
    try {
      if (selectedBranch.value.branchIsFixed == 1 &&
          selectedBranch.value.branchZone! <= distance) {
        deliveryFee = (distance * selectedBranch.value.branchDeliveryCharge! +
                selectedBranch.value.branchStartDelivery!)
            .toStringAsFixed(2);
      } else if (selectedBranch.value.branchIsFixed == 1 &&
          selectedBranch.value.branchZone! >= distance) {
        deliveryFee = selectedBranch.value.branchDeliveryFixCharge.toString();
      } else if (selectedBranch.value.branchIsFixed == 0) {
        deliveryFee = (distance * selectedBranch.value.branchDeliveryCharge! +
                selectedBranch.value.branchStartDelivery!)
            .toStringAsFixed(2);
      }
    } catch (e) {
      throw Exception("Error Calculate Delivery Charge : $e");
    }
    update();
  }

  @override
  resetCart() {
    couponValue = 0;
    deliveryFee = "0";
    isLoading = false.obs;
    totalPrice = 0.0;
    discount = 0.0;
    ordersCount = 0.obs;
    price = 0.0.obs;
    totalPoint = "0";
    couponName = null;
    couponId = null;
    distance = 0.0;
    selectedOrderType = 0;
    locationList = 0;
    selectedLocation = null;
    couponController.clear();
    data.clear();
  }

  @override
  refreshCart() async {
    try {
      resetCart();
      await getCart();
    } catch (e) {
      throw Exception("Error Refresh Cart : $e");
    }
  }

  @override
  void dispose() {
    noteController.dispose();
    couponController.dispose();
    super.dispose();
  }

  @override
  addNoteToItem(int cartId) async {
    try {
      var response = await cartData.addNoteToItem(
        UserController().user.usersId!,
        cartId,
        noteController.text,
      );
      if (response['status'] == 'success') {
        !Get.isSnackbarOpen
            ? Get.rawSnackbar(
                message: "noteDone".tr,
                backgroundColor: Colors.blue,
                icon: const Icon(
                  IconBroken.Edit,
                  color: Colors.white,
                ),
                snackStyle: SnackStyle.GROUNDED,
              )
            : null;
        update();
        refreshCart();
        noteController.clear();
      } else {
        SmartDialog.showToast(
          "notDontSave".tr,
          displayType: SmartToastType.onlyRefresh,
        );
      }
    } catch (e) {
      throw Exception("Error Add Note To Item : $e");
    }
    update();
  }

  checkout() async {
    try {
      if (data.isEmpty) {
        showSnackBar('emptyCart'.tr,
            color: Colors.red,
            widget: Icon(Icons.error_outline, color: Colors.white));
      } else {
        var response;
        if (selectedOrderType == 1) {
          if (selectedLocation != null || selectedLocation != 0) {
            response = await checkoutDelivery();
          } else {
            showSnackBar('emptyCart'.tr,
                color: Colors.red,
                widget: Icon(Icons.error_outline, color: Colors.white));
          }
        } else if (selectedOrderType == 0) {
          response = await checkoutPickup();
        }

        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            refreshCart();
            Get.offAllNamed(AppRoutes.home);
            resetCart();
            showSnackBar('orderSuccess'.tr,
                color: Colors.green,
                widget:
                    Icon(Icons.local_shipping_outlined, color: Colors.white));
          } else if (response['status'] == 'failed' &&
              response['message'] == 'branch_401') {
            SmartDialog.showNotify(
              msg: "branch_401".tr,
              notifyType: NotifyType.error,
              displayTime: const Duration(seconds: 3),
            );
          } else {
            statusRequest = StatusRequest.none;
            showSnackBar('tryAgain'.tr,
                color: Colors.red,
                widget: Icon(Icons.error_outline, color: Colors.white));
          }
        }
      }
    } catch (e) {
      throw Exception("Error Checkout : $e");
    }
    update();
  }

  checkoutPickup() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkoutData.checkout(
        userId: UserController().user.usersId!,
        addressId: "0",
        orderType: "0",
        deliveryFee: "0",
        orderPrice: price.toStringAsFixed(2),
        discountAmount: discount.toStringAsFixed(2),
        totalPrice: getTotalOrderPrice(),
        couponId: couponId ?? 0,
        branchId: UserController().user.userFavBranchId!,
        totalPoints: totalPoint,
      );
      return response;
    } catch (e) {
      throw Exception("Error Checkout Pickup : $e");
    }
  }

  checkoutDelivery() async {
    try {
      var response = await checkoutData.checkout(
        userId: UserController().user.usersId!,
        addressId: selectedLocation.toString(),
        orderType: "1",
        deliveryFee: deliveryFee,
        orderPrice: price.toStringAsFixed(2),
        discountAmount: discount.toStringAsFixed(2),
        totalPrice: getTotalOrderPrice(),
        couponId: couponId ?? 0,
        branchId: UserController().user.userFavBranchId!,
        totalPoints: totalPoint,
      );
      return response;
    } catch (e) {
      throw Exception("Error Checkout Delivery : $e");
    }
  }

  getTotalOrderPrice() {
    try {
      totalPrice = (price.value -
          (price * (couponValue / 100)) +
          double.parse(deliveryFee));

      return totalPrice.toStringAsFixed(2);
    } catch (e) {
      throw Exception("Error Get Total Order Price : $e");
    }
  }

  getDiscountAmount() {
    try {
      discount = (price * (couponValue / 100));
      return discount.toStringAsFixed(2);
    } catch (e) {
      throw Exception("Error Get Discount Ammount : $e");
    }
  }

  checkCoupon() async {
    try {
      SmartDialog.showLoading(msg: "loading".tr);
      var response = await checkoutData.checkCoupon(
          couponController.text.trim(), UserController().user.userFavBranchId!);

      if (response['status'] == 'success') {
        couponValue = response['data']['coupon_discount'];
        couponName = response['data']['coupon_name'];
        couponId = response['data']['coupon_id'];
        getDiscountAmount();
        SmartDialog.dismiss();
      } else {
        couponValue = 0;
        couponName = null;
        couponId = null;
        !Get.isSnackbarOpen
            ? Get.rawSnackbar(
                message: "couponError".tr,
                icon: const Icon(
                  IconBroken.Discount,
                  color: Colors.red,
                ),
                duration: const Duration(seconds: 2),
              )
            : null;
        SmartDialog.dismiss();
      }
    } catch (e) {
      throw Exception("Error Check Coupon : $e");
    }
    update();
  }

  selectLocationDeliver(Object val) {
    locationList = val as int;
    selectedLocation = addressController.data[locationList].addressId!;

    update();
  }
}
