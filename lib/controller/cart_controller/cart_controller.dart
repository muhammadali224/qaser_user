import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/item_count_model.dart';
import '../../data/shared/anonymous_user.dart';
import '../../data/shared/branches.dart';
import '../../data/source/remote/cart_data.dart';
import '../../data/source/remote/checkout_data.dart';
import '../../generated/assets.dart';
import '../address_controller/view_address_controller.dart';

abstract class CartController extends GetxController {
  addCart(int itemsId, String? weightAndSizeId, num cartItemPrice);

  deleteFromCart(int itemsId);

  getCart();

  getCount(int itemsId);

  resetCart();

  refreshCart();

  addNoteToItem(int cartId);

  selectOrderMethod(int val);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  TextEditingController couponController = TextEditingController();
  TextEditingController? noteController;

  StatusRequest statusRequest = StatusRequest.none;
  CheckoutData checkoutData = CheckoutData(Get.find());
  ViewAddressController addressController = Get.put(ViewAddressController());

  String deliveryFee = "0";

  double totalPrice = 0.0;
  double discount = 0.0;
  int ordersCount = 0;
  num price = 0;

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
  ItemCountModel itemCount = ItemCountModel();

  @override
  addCart(itemsId, weightAndSizeId, cartItemPrice) async {
    var response = await cartData.addToCart(
      user.usersId!,
      itemsId,
      weightAndSizeId,
      cartItemPrice,
    );

    if (response['status'] == 'success') {
      !Get.isSnackbarOpen
          ? Get.rawSnackbar(
              backgroundColor: Colors.green,
              message: "addCart".tr,
              icon: const Icon(
                Icons.add_shopping_cart,
              ),
              snackStyle: SnackStyle.GROUNDED,
              duration: const Duration(seconds: 2),
            )
          : null;

      await refreshCart();
    } else {
      statusRequest = StatusRequest.failed;
    }

    update();
  }

  @override
  selectOrderMethod(int val) {
    selectedOrderType = val;
    update();
  }

  @override
  deleteFromCart(itemsId) async {
    var response = await cartData.removeFromCart(
      user.usersId!,
      itemsId,
    );

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

    update();
  }

  @override
  getCart() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCart(user.usersId!);
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
          price = response['total']['data']['totalprice'];
          ordersCount = response['total']['data']['totalcount'];
        } else {
          ordersCount = 0;
          price = 0.0;
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  getCount(itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountItem(user.usersId!, itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemCount = ItemCountModel.fromJson(response['data']);
        update();
        return itemCount;
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
  }

  @override
  void onInit() async {
    noteController = TextEditingController();
    await getCart();

    super.onInit();
  }

  calculateDeliveryCharge() {
    if (selectedBranch.branchIsFixed == 1 &&
        selectedBranch.branchZone! <= distance) {
      deliveryFee =
          (distance * selectedBranch.branchDeliveryCharge!).toStringAsFixed(2);
    } else if (selectedBranch.branchIsFixed == 1 &&
        selectedBranch.branchZone! >= distance) {
      deliveryFee = selectedBranch.branchDeliveryFixCharge.toString();
    } else if (selectedBranch.branchIsFixed == 0) {
      deliveryFee =
          (distance * selectedBranch.branchDeliveryCharge!).toStringAsFixed(2);
    }
    update();
  }

  @override
  resetCart() {
    totalPrice = 0;
    couponId = null;
    couponValue = 0;
    couponName = null;
    couponController.clear();
    data.clear();
  }

  @override
  refreshCart() {
    resetCart();
    getCart();
  }

  @override
  void dispose() {
    noteController!.dispose();
    couponController.dispose();
    super.dispose();
  }

  @override
  addNoteToItem(int cartId) async {
    var response = await cartData.addNoteToItem(
      user.usersId!,
      cartId,
      noteController?.text ?? "",
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
    } else {
      SmartDialog.showToast(
        "notDontSave".tr,
        displayType: SmartToastType.onlyRefresh,
      );
    }

    update();
  }

  checkout() async {
    if (data.isEmpty) {
      return Get.isSnackbarOpen
          ? null
          : Get.snackbar(
              'attention'.tr,
              'emptyCart'.tr,
              icon: const Icon(
                Icons.error_outline,
                color: Colors.red,
              ),
              snackStyle: SnackStyle.GROUNDED,
            );
    } else {
      statusRequest = StatusRequest.loading;
      update();
      // print("""
      //   ${myServices.sharedPref.getString('userId')!},
      //   $selectedLocation,
      //   ${selectedOrderType.toString()},
      //   $deliveryFee,
      //   ${price.toStringAsFixed(2)},
      //   ${discount.toStringAsFixed(2)},
      //   ${getTotalOrderPrice()},
      //   ${couponId ?? "0"},
      //   ${userData.userFavBranchId!},""");
      if (selectedOrderType == 0) {
        selectedLocation = 0;
      }

      var response = await checkoutData.checkout(
        user.usersId!,
        selectedLocation.toString(),
        selectedOrderType.toString(),
        deliveryFee,
        price.toStringAsFixed(2),
        discount.toStringAsFixed(2),
        getTotalOrderPrice(),
        couponId ?? 0,
        user.userFavBranchId!,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          refreshCart();
          Get.offAllNamed(AppRoutes.home);
          resetCart();
          Get.snackbar(
            'success'.tr,
            'orderSuccess'.tr,
            icon: const Icon(
              Icons.local_shipping_outlined,
              color: Colors.green,
            ),
          );
        } else if (response['status'] == 'failed' &&
            response['message'] == 'branch_401') {
          SmartDialog.showNotify(
            msg: "branch_401".tr,
            notifyType: NotifyType.error,
            displayTime: const Duration(seconds: 3),
          );
        } else {
          statusRequest = StatusRequest.none;
          Get.isSnackbarOpen
              ? null
              : Get.snackbar(
                  'error'.tr,
                  'tryAgain'.tr,
                  icon: Icon(
                    Icons.error_outline,
                    color: AppColor.primaryColor,
                  ),
                );
        }
      }
      update();
    }
  }

  getTotalOrderPrice() {
    totalPrice =
        (price - (price * (couponValue / 100)) + double.parse(deliveryFee));

    return totalPrice.toStringAsFixed(2);
  }

  getDiscountAmount() {
    discount = (price * (couponValue / 100));
    return discount.toStringAsFixed(2);
  }

  checkCoupon() async {
    SmartDialog.showLoading(msg: "loading".tr);
    var response = await checkoutData.checkCoupon(
        couponController.text.trim(), user.userFavBranchId!);

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

    update();
  }

  selectLocationDeliver(Object val) {
    locationList = val as int;
    selectedLocation = addressController.data[locationList].addressId!;

    update();
  }
}
