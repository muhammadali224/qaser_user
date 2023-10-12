import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/branches_model.dart';
import '../../data/model/categories_model.dart';
import '../../data/model/items_model.dart';
import '../../data/model/offers_image_model.dart';
import '../../data/model/user_detail_model.dart';
import '../../generated/assets.dart';
import '../cart_controller/cart_controller.dart';
import '../search_controller/search_mixin_controller.dart';

abstract class HomeController extends SearchMixController {
  initData();

  getData(int branchId);

  goToSettings();

  goToCart();

  goToNotifications();

  @override
  getSearchResult();

  goToItems(List categories, int selectedCategories, int categoriesId);

  @override
  onSearchItems();

  @override
  goToDetails(ItemsModel itemsModel);

  goToOffers();

  updateUserBranch(int branchId);
}

class HomeControllerImp extends HomeController {
  // UserPreferences userManagement = Get.find<UserPreferences>();

  MyServices myServices = Get.find();
  int notificationsCount = 0;
  late String userName;
  late int userId;
  CartControllerImp cartController =
      Get.put<CartControllerImp>(CartControllerImp());
  String selectedValue = "1";
  String? branchName;
  List<BranchesModel> branches = [];
  List<CategoriesModel> categories = [];
  List<ItemsModel> topSelling = [];
  List<ItemsModel> itemsOffer = [];
  List<OffersImageModel> offerImages = [];

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    await userManagement.initUser();

    search = TextEditingController();
    userName = userManagement.user.usersName!;
    userId = userManagement.user.usersId!;
    await getUserDetails();
    initLocalJiffy();

    cartController.getCart();
    getData(userManagement.user.userFavBranchId!);
  }

  @override
  getData(int branchId) async {
    clearAllList();
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData(branchId, userId);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (response['categories']['status'] == 'success') {
          List responseDataCategories = response['categories']['data'];
          categories.addAll(
              responseDataCategories.map((e) => CategoriesModel.fromJson(e)));
        }
        if (response['items']['status'] == 'success') {
          List responseData = response['items']['data'];
          itemsOffer.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        }
        if (response['topSelling']['status'] == 'success') {
          List responseDataTop = response['topSelling']['data'];
          topSelling.addAll(responseDataTop.map((e) => ItemsModel.fromJson(e)));
        }

        if (response['branches']['status'] == 'success') {
          List responseDataBranches = response['branches']['data'];
          branches.addAll(
              responseDataBranches.map((e) => BranchesModel.fromJson(e)));
        }
        if (response['offer_images']['status'] == 'success') {
          List responseOffers = response['offer_images']['data'];
          offerImages
              .addAll(responseOffers.map((e) => OffersImageModel.fromJson(e)));
        }
        if (response['notifications']['status'] == 'success') {
          notificationsCount =
              response['notifications']['count']['countNotification'];
          print(notificationsCount);
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  @override
  updateUserBranch(branchId) async {
    var response = await homeData.updateBranch(branchId, userId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        await getUserDetails();
        getData(branchId);
        cartController.getCart();
        update();
      } else {
        statusRequest = StatusRequest.failed;
      }
    }
    update();
  }

  clearAllList() {
    branches.clear();
    categories.clear();
    topSelling.clear();
    itemsOffer.clear();
    offerImages.clear();
  }

  getUserDetails() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await homeData.getUserDetails(userId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        final loginData = UserModel.fromJson(response['data']);
        userManagement.setUser(loginData);
        if (loginData.branchIsOpen == 0) {
          SmartDialog.show(
              builder: (_) => Container(
                    width: double.infinity,
                    // height: Get.height / 3,
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Lottie.asset(
                            Assets.lottieBranchClose,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "branchClose".tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: ElevatedButton(
                                onPressed: () => SmartDialog.dismiss(),
                                child: Text("back".tr)))
                      ],
                    ),
                  ));
          selectedValue = "1";
          updateUserBranch(1);
          update();
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    }

    update();
  }

  onChangeDropButton(String value) {
    if (value != selectedValue) {
      selectedValue = value;
      userManagement.user.userFavBranchId = int.parse(selectedValue);
      updateUserBranch(int.parse(selectedValue));

      update();
    }
  }

  @override
  goToItems(categories, selectedCategories, categoriesId) {
    Get.toNamed(AppRoutes.items, arguments: {
      'categories': categories,
      'selectedCategories': selectedCategories,
      'id': categoriesId,
    });
  }

  initLocalJiffy() async {
    var lang = myServices.sharedPref.getString("language");
    if (lang == 'ar') {
      await Jiffy.setLocale('ar_sa');
    } else {
      await Jiffy.setLocale('en_us');
    }
  }

  @override
  goToOffers() {
    Get.toNamed(AppRoutes.offers);
  }

  @override
  goToCart() {
    cartController.refreshCart();
    Get.toNamed(AppRoutes.cart);
  }

  @override
  goToNotifications() {
    Get.toNamed(AppRoutes.notifications);
  }

  @override
  goToSettings() {
    Get.toNamed(AppRoutes.appSettings);
  }
}
