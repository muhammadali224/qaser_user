import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaser_user/controller/cart_controller/cart_controller.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/get_box_key.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/branches_model/branches_model.dart';
import '../../data/model/categories_model.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/offers_image_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/shared/anonymous_user.dart';
import '../../data/shared/branches.dart';
import '../../data/source/remote/auth/login_data.dart';
import '../search_controller/search_mixin_controller.dart';

abstract class HomeController extends SearchMixController {
  Future<void> initData();

  Future<void> getData(int branchId);

  Future<void> loginAnonymous();

  void goToSettings();

  void goToCart();

  void goToNotifications();

  @override
  getSearchResult();

  void goToItems(List categories, int selectedCategories, int categoriesId);

  @override
  onSearchItems();

  Future<void> updateUserBranch();

  Future<void> getUserDetails();
}

//
//   getUserDetails() async {
//     statusRequest = StatusRequest.loading;
//     update();
//
//     var response = await homeData.getUserDetails(userId);
//     statusRequest = handlingData(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == 'success') {
//         final loginData = UserModel.fromJson(response['data']);
//         userManagement.setUser(loginData);
//         if (loginData.branchIsOpen == 0) {
//           SmartDialog.show(
//               builder: (_) => Container(
//                     width: double.infinity,
//                     // height: Get.height / 3,
//                     color: Colors.grey[200],
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: Lottie.asset(
//                             Assets.lottieBranchClose,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             "branchClose".tr,
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                             padding: const EdgeInsets.symmetric(vertical: 40),
//                             child: ElevatedButton(
//                                 onPressed: () => SmartDialog.dismiss(),
//                                 child: Text("back".tr)))
//                       ],
//                     ),
//                   ));
//           selectedValue = "1";
//           updateUserBranch(1);
//           update();
//         }
//       } else {
//         statusRequest = StatusRequest.failed;
//       }
//     }
//
//     update();
//   }
//

//

// }

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  final LoginData _loginData = LoginData(Get.find());
  int notificationsCount = 0;
  bool isLoading = false;
  String? branchName;
  late CartControllerImp cartControllerImp;

  List<CategoriesModel> categoriesList = [];
  List<ItemModel> topSellingList = [];
  List<ItemModel> itemsOfferList = [];
  List<OffersImageModel> offerImagesList = [];

  @override
  getData(int branchId) async {
    try {
      clearAllList();
      statusRequest = StatusRequest.loading;
      update();
      var response = await homeData.getData(
          branchId,
          "${myServices.getBox.read(GetBoxKey.isSigned) ?? "false"}",
          user.usersId!);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['branches']['status'] == 'success') {
            List responseDataBranches = response['branches']['data'];
            branchesList.addAll(
                responseDataBranches.map((e) => BranchesModel.fromJson(e)));
            if (branchId != 0) {
              selectedValue = user.userFavBranchId!;
              selectedBranch = branchesList
                  .singleWhere((element) => element.branchId == selectedValue);
            } else {
              selectedValue = branchesList[0].branchId!;
              selectedBranch = branchesList
                  .singleWhere((element) => element.branchId == selectedValue);
            }
          }
          if (response['categories']['status'] == 'success') {
            List responseDataCategories = response['categories']['data'];
            categoriesList.addAll(
                responseDataCategories.map((e) => CategoriesModel.fromJson(e)));
          }
          if (response['items']['status'] == 'success') {
            List responseData = response['items']['data'];
            itemsOfferList
                .addAll(responseData.map((e) => ItemModel.fromJson(e)));
          }
          if (response['topSelling']['status'] == 'success') {
            List responseDataTop = response['topSelling']['data'];
            topSellingList
                .addAll(responseDataTop.map((e) => ItemModel.fromJson(e)));
          }

          if (response['offer_images']['status'] == 'success') {
            List responseOffers = response['offer_images']['data'];
            offerImagesList.addAll(
                responseOffers.map((e) => OffersImageModel.fromJson(e)));
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    update();
  }

  @override
  initData() async {
    initLocalJiffy();
    if (myServices.getBox.read(GetBoxKey.user) != null) {
      user = userModelFromJson(await myServices.getBox.read(GetBoxKey.user));
      getData(user.userFavBranchId!);
      selectedValue = user.userFavBranchId!;
      if (user.usersIsAnonymous == 0) {
        getUserDetails();
      }
    } else {
      getData(0);
    }
  }

  @override
  updateUserBranch() async {
    try {
      var response = await homeData.updateBranch(selectedValue, user.usersId!);
      if (response['status'] == 'success') {
        user = UserModel.fromJson(response['data']);
        myServices.getBox.write(GetBoxKey.user, userModelToJson(user));
      }
    } catch (e) {
      throw Exception(e);
    }
    update();
  }

  @override
  Future<void> loginAnonymous() async {
    try {
      var response = await _loginData.loginAnonymous(
        myServices.androidDeviceInfo.id,
        selectedValue,
        myServices.androidDeviceInfo.type,
      );
      if (response['status'] == 'success') {
        user = UserModel.fromJson(response['data']);
        myServices.getBox.write(GetBoxKey.user, userModelToJson(user));
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  @override
  Future<void> getUserDetails() async {
    try {
      var response = await homeData.getUserDetails(user.usersId!);
      if (response['status'] == 'success') {
        user = UserModel.fromJson(response['data']);
        myServices.getBox.write(GetBoxKey.user, userModelToJson(user));
        if (user.usersApprove == 2) {
          SmartDialog.showNotify(
              msg: "userBlocked".tr,
              notifyType: NotifyType.warning,
              onDismiss: () {
                myServices.getBox.erase();
                Get.offAllNamed(AppRoutes.login);
              });
          // myServices.getBox.erase();
          // Get.offAllNamed(AppRoutes.login);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    update();
  }

  clearAllList() {
    branchesList.clear();
    categoriesList.clear();
    topSellingList.clear();
    itemsOfferList.clear();
    offerImagesList.clear();
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
    var lang = myServices.getBox.read(GetBoxKey.language);
    lang == GetBoxKey.arLanguage
        ? await Jiffy.setLocale('ar_sa')
        : await Jiffy.setLocale('en_us');
  }

  goToOffers() {
    Get.toNamed(AppRoutes.offers);
  }

  @override
  goToCart() {
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

  onChangeDropButton(int? value) async {
    if (value != selectedValue) {
      selectedValue = value!;

      await updateUserBranch();
      getData(selectedValue);
      update();
    }
  }

  @override
  void onInit() async {
    if (myServices.getBox.read(GetBoxKey.isSigned) != true) {
      await loginAnonymous();
    }
    initData();
    cartControllerImp = Get.put(CartControllerImp(), permanent: true);
    super.onInit();
  }
}
