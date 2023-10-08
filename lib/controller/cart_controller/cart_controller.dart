import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/item_count_model.dart';
import '../../data/shared/user_details.dart';
import '../../data/source/remote/cart_data.dart';
import '../../data/source/remote/checkout_data.dart';
import '../../generated/assets.dart';
import '../address_controller/view_address_controller.dart';

abstract class CartController extends GetxController {
  addCart(String itemsId, String? weightAndSizeId, String cartItemPrice);

  deleteFromCart(String itemsId);

  getCart();

  getCount(String itemsId);

  resetCart();

  refreshCart();

  addNoteToItem(String cartId);

  selectOrderMethod(int val);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  TextEditingController couponController = TextEditingController();
  TextEditingController? noteController;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CheckoutData checkoutData = CheckoutData(Get.find());
  ViewAddressController addressController = Get.put(ViewAddressController());

  String deliveryFee = "0";

  double totalPrice = 0.0;
  double discount = 0.0;
  int ordersCount = 0;
  double price = 0;
  late String userId;

  String couponValue = "0";
  String? couponName;
  String? couponId;
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
      myServices.sharedPref.getString('userId')!,
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
      myServices.sharedPref.getString('userId')!,
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
    var response = await cartData.getCart(userId.trim());
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
          price = double.parse(response['total']['data']['totalprice']);
          ordersCount = int.parse(response['total']['data']['totalcount']);
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
    var response = await cartData.getCountItem(
        myServices.sharedPref.getString('userId')!, itemsId);
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
    userId = myServices.sharedPref.getString('userId') ?? "";
    noteController = TextEditingController();
    await getCart();

    super.onInit();
  }

  calculateDeliveryCharge() {
    if (userData.branchIsFixed == "1" &&
        double.parse(userData.branchZone!) <= distance) {
      deliveryFee = (distance * double.parse(userData.branchDeliveryCharge!))
          .toStringAsFixed(2);
    } else if (userData.branchIsFixed == "1" &&
        double.parse(userData.branchZone!) >= distance) {
      deliveryFee = userData.branchDeliveryChargeFix!;
    } else if (userData.branchIsFixed == "0") {
      deliveryFee = (distance * double.parse(userData.branchDeliveryCharge!))
          .toStringAsFixed(2);
    }
    update();
  }

  @override
  resetCart() {
    totalPrice = 0;
    couponId = null;
    couponValue = "0";
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
  addNoteToItem(String cartId) async {
    var response = await cartData.addNoteToItem(
      myServices.sharedPref.getString('userId')!,
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
        myServices.sharedPref.getString('userId')!,
        selectedLocation.toString(),
        selectedOrderType.toString(),
        deliveryFee,
        price.toStringAsFixed(2),
        discount.toStringAsFixed(2),
        getTotalOrderPrice(),
        couponId ?? "0",
        userData.userFavBranchId!,
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
    totalPrice = (price -
        (price * (int.parse(couponValue) / 100)) +
        double.parse(deliveryFee));

    return totalPrice.toStringAsFixed(2);
  }

  getDiscountAmount() {
    discount = (price * (int.parse(couponValue) / 100));
    return discount.toStringAsFixed(2);
  }

  checkCoupon() async {
    SmartDialog.showLoading(msg: "loading".tr);
    var response = await checkoutData.checkCoupon(couponController.text.trim());

    if (response['status'] == 'success') {
      couponValue = response['data']['coupon_discount'];
      couponName = response['data']['coupon_name'];
      couponId = response['data']['coupon_id'].toString();
      getDiscountAmount();
      SmartDialog.dismiss();
    } else {
      couponValue = "0";
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
    selectedLocation =
        int.parse(addressController.data[locationList].addressId!);

    update();
  }
}
