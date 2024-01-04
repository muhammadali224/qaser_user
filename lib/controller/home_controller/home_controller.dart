import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaser_user/controller/cart_controller/cart_controller.dart';
import 'package:qaser_user/controller/user_controller/user_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/get_box_key.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handling_data_controller.dart';
import '../../core/services/app.service.dart';
import '../../data/model/branches_model/branches_model.dart';
import '../../data/model/categories_model.dart';
import '../../data/model/items_model/items_model.dart';
import '../../data/model/offers_image_model.dart';
import '../../data/model/user_model/user_model.dart';
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

  void goToOffers();

  @override
  getSearchResult();

  void goToItems(List<CategoriesModel> categories,
      CategoriesModel selectedCategory, int index);

  @override
  onSearchItems();

  Future<void> updateUserBranch();

  Future<void> getUserDetails();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  final LoginData _loginData = LoginData(Get.find());
  int notificationsCount = 0;
  bool isLoading = false;
  String? branchName;
  Rx<UserModel> user = Get.find<UserController>().user.obs;
  UserController userController = Get.find<UserController>();
  List<CategoriesModel> categoriesList = [];
  List<ItemModel> topSellingList = [];
  List<ItemModel> itemsOfferList = [];
  List<ItemModel> suggestItem = [];
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
          user.value.usersId!);
      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['branches']['status'] == 'success') {
            List responseDataBranches = response['branches']['data'];
            branchesList.addAll(
                responseDataBranches.map((e) => BranchesModel.fromJson(e)));
            if (branchId != 0) {
              selectedBranch.value = branchesList
                  .singleWhere((element) => element.branchId == selectedValue);
            } else {
              selectedValue = branchesList[0].branchId!;
              selectedBranch.value = branchesList
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
          if (response['suggestItems']['status'] == 'success') {
            List responseData = response['suggestItems']['data'];
            suggestItem.addAll(responseData.map((e) => ItemModel.fromJson(e)));
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
      throw Exception("Error Get Home : $e");
    }
    update();
  }

  @override
  initData() async {
    initLocalJiffy();
    getData(user.value.userFavBranchId!);
    selectedValue = user.value.userFavBranchId!;
  }

  @override
  updateUserBranch() async {
    try {
      var response =
          await homeData.updateBranch(selectedValue, user.value.usersId!);
      if (response['status'] == 'success') {
        var newUser = UserModel.fromJson(response['data']);
        userController.user = newUser;
        selectedValue = newUser.userFavBranchId!;
      }
    } catch (e) {
      throw Exception("Error Update User Branch : $e");
    }
    update();
  }

  @override
  Future<void> loginAnonymous() async {
    try {
      var response = await _loginData.loginAnonymous(
        user.value.usersEmail!,
        user.value.userFavBranchId!,
        user.value.usersName!,
      );
      if (response['status'] == 'success') {
        UserModel loginUser = UserModel.fromJson(response['data']);
        print(loginUser.toString());
        userController.user = loginUser;
      } else {
        statusRequest = StatusRequest.failed;
      }
    } catch (e) {
      throw Exception("Error Login Anonymous : $e");
    }
    update();
  }

  @override
  Future<void> getUserDetails() async {
    try {
      var response = await homeData.getUserDetails(user.value.usersId!);
      if (response['status'] == 'success') {
        var newUser = UserModel.fromJson(response['data']);
        userController.user = newUser;

        if (user.value.usersApprove == 2) {
          SmartDialog.showNotify(
              msg: "userBlocked".tr,
              notifyType: NotifyType.warning,
              onDismiss: () {
                myServices.getBox.erase();
                Get.offAllNamed(AppRoutes.login);
                userController.clearUser();
              });
        }
      }
    } catch (e) {
      throw Exception("Error GGet User Details : $e");
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
  goToItems(categories, selectedCategories, index) {
    Get.toNamed(AppRoutes.items, arguments: {
      'categories': categories,
      'selectedCategories': selectedCategories,
      'index': index,
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

  goToFavorite() {
    Get.toNamed(AppRoutes.myFavorite);
  }

  goToMyPoint() {
    Get.toNamed(AppRoutes.userPoint);
  }

  goToAwards() {
    Get.toNamed(AppRoutes.awardsView);
  }

  @override
  goToCart() {
    CartControllerImp controller = Get.put(CartControllerImp());
    controller.refreshCart();
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
      updateUserBranch();
      await getData(selectedValue);

      update();
    }
    print(selectedBranch.toString());
  }

  launchFacebook() async {
    final url = Uri.parse(selectedBranch.value.branchFacebookUrl!);
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  launchCall() async {
    final url = Uri.parse('tel:${selectedBranch.value.branchPhone1}');
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  launchWhatsApp() async {
    final url = Uri.parse(
        'whatsapp://send?phone=962${selectedBranch.value.branchPhone2}');
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  @override
  void onInit() async {
    if (myServices.getBox.read(GetBoxKey.isSigned) != true) {
      await loginAnonymous();
    }
    initData();

    super.onInit();
  }
}
