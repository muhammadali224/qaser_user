import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/model/branches_model/branches_model.dart';
import '../../data/model/categories_model.dart';
import '../../data/model/items_model.dart';
import '../../data/model/offers_image_model.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/shared/branches.dart';
import '../../data/source/remote/auth/login_data.dart';
import '../cart_controller/cart_controller.dart';
import '../search_controller/search_mixin_controller.dart';

abstract class HomeController extends SearchMixController {
  Future<void> initData();

  Future<void> getBranches();

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

  @override
  goToDetails(ItemsModel itemsModel);

  void goToOffers();

  Future<void> updateUserBranch(int branchId);
}
//
// class HomeControllerImp extends HomeController {
//   @override
//   initData() async {
//     // await userManagement.initUser();
//
//     search = TextEditingController();
//     // userName = userManagement.user.usersName!;
//     // userId = userManagement.user.usersId!;
//     await getUserDetails();
//     initLocalJiffy();
//     // cartController.getCart();
//     getData(1);
//   }
//
//
//   @override
//   updateUserBranch(branchId) async {
//     var response = await homeData.updateBranch(branchId, userId);
//     statusRequest = handlingData(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == 'success') {
//         await getUserDetails();
//         getData(branchId);
//         // cartController.getCart();
//         update();
//       } else {
//         statusRequest = StatusRequest.failed;
//       }
//     }
//     update();
//   }
//

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

  CartControllerImp cartController =
      Get.put<CartControllerImp>(CartControllerImp());
  // late int selectedValue;
  bool isLoading = false;
  String? branchName;

  List<CategoriesModel> categoriesList = [];
  List<ItemsModel> topSellingList = [];
  List<ItemsModel> itemsOfferList = [];
  List<OffersImageModel> offerImagesList = [];

  @override
  getData(int branchId) async {
    try {
      clearAllList();
      statusRequest = StatusRequest.loading;
      update();
      var response = await homeData.getData(branchId, "false");
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['categories']['status'] == 'success') {
            List responseDataCategories = response['categories']['data'];
            categoriesList.addAll(
                responseDataCategories.map((e) => CategoriesModel.fromJson(e)));
          }
          if (response['items']['status'] == 'success') {
            List responseData = response['items']['data'];
            itemsOfferList
                .addAll(responseData.map((e) => ItemsModel.fromJson(e)));
          }
          if (response['topSelling']['status'] == 'success') {
            List responseDataTop = response['topSelling']['data'];
            topSellingList
                .addAll(responseDataTop.map((e) => ItemsModel.fromJson(e)));
          }

          if (response['offer_images']['status'] == 'success') {
            List responseOffers = response['offer_images']['data'];
            offerImagesList.addAll(
                responseOffers.map((e) => OffersImageModel.fromJson(e)));
          }
          if (response['notifications']['status'] == 'success') {
            notificationsCount =
                response['notifications']['count']['countNotification'];
          }
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  @override
  initData() async {}

  @override
  updateUserBranch(int branchId) async {}

  @override
  Future<void> loginAnonymous() async {
    try {
      var response = await _loginData.loginAnonymous(
          myServices.fireUser!.uid, selectedValue);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          final loginUser = UserModel.fromJson(response['data']);
          userManagement.setUser(loginUser);

          print(loginUser.toString());
        } else {
          statusRequest = StatusRequest.failed;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  @override
  Future<void> getBranches() async {
    try {
      branchesList.clear();
      isLoading = true;
      update();
      var response = await homeData.getBranches();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          List responseData = response['data'];
          branchesList
              .addAll(responseData.map((e) => BranchesModel.fromJson(e)));
          selectedValue = branchesList[0].branchId!;
          selectedBranch = branchesList
              .firstWhere((element) => element.branchId == selectedValue);
          isLoading = false;
          update();
        }
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  clearAllList() {
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
    var lang = myServices.sharedPref.getString("language");
    lang == 'ar'
        ? await Jiffy.setLocale('ar_sa')
        : await Jiffy.setLocale('en_us');
  }

  @override
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

  onChangeDropButton(int? value) {
    if (value != selectedValue) {
      selectedValue = value!;
      getData(selectedValue);
      selectedBranch =
          branchesList.firstWhere((element) => element.branchId == value);

      // userManagement.user.userFavBranchId = int.parse(selectedValue);
      // updateUserBranch(int.parse(selectedValue));

      update();
    }
  }

  @override
  void onInit() async {
    await userManagement.initUser();
    await getBranches();
    await loginAnonymous();
    getData(selectedValue);

    super.onInit();
  }
}
