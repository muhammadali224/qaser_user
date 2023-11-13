import 'package:get/get.dart';

import 'binding/cart_binding.dart';
import 'binding/initial_binding.dart';
import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';
import 'view/screen/address/add.dart';
import 'view/screen/address/add_location_details.dart';
import 'view/screen/address/view.dart';
import 'view/screen/auth/forget%20Password/forget_password.dart';
import 'view/screen/auth/forget%20Password/reset_password.dart';
import 'view/screen/auth/forget%20Password/success_reset_password.dart';
import 'view/screen/auth/forget%20Password/verification_code.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/auth/verification_signup.dart';
import 'view/screen/cart.dart';
import 'view/screen/home/home.dart';
import 'view/screen/home/search_result.dart';
import 'view/screen/item_details.dart';
import 'view/screen/items.dart';
import 'view/screen/language.dart';
import 'view/screen/my_favorite.dart';
import 'view/screen/notifications.dart';
import 'view/screen/offers.dart';
import 'view/screen/onboarding.dart';
import 'view/screen/orders/order_rating.dart';
import 'view/screen/orders/orders.dart';
import 'view/screen/orders/orders_details.dart';
import 'view/screen/setting/setting_screen/settings.dart';
import 'view/screen/setting/user_setting/change_user_email.dart';
import 'view/screen/setting/user_setting/change_user_password.dart';
import 'view/screen/setting/user_setting/change_user_phone.dart';
import 'view/screen/setting/user_setting/change_username.dart';
import 'view/screen/setting/user_setting/users_settings.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: '/',
    page: () => const LanguageScreen(),
    middlewares: [
      MyMiddleWare(),
    ],
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const Home(),
    bindings: [
      CartBindings(),
      InitBindings(),
    ],
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
    binding: InitBindings(),
  ),
  GetPage(name: AppRoutes.signUp, page: () => const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoutes.verificationCode, page: () => const VerificationCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successReset, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.verificationSignup,
      page: () => const VerificationSignUp()),
  GetPage(name: AppRoutes.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.itemDetails, page: () => const ItemDetails()),
  GetPage(name: AppRoutes.myFavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoutes.cart, page: () => const Cart()),
  GetPage(name: AppRoutes.addressView, page: () => const AddressView()),
  GetPage(name: AppRoutes.addressAdd, page: () => const AddressAdd()),
  GetPage(name: AppRoutes.addressEdit, page: () => const AddressView()),
  GetPage(
      name: AppRoutes.addLocationDetails,
      page: () => const AddLocationDetails()),
  // GetPage(name: AppRoutes.checkout, page: () => const Checkout()),
  GetPage(name: AppRoutes.orders, page: () => const Orders()),
  GetPage(name: AppRoutes.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.offers, page: () => const Offers()),
  GetPage(name: AppRoutes.ordersRating, page: () => const OrdersRating()),
  GetPage(name: AppRoutes.userSettings, page: () => const UserSetting()),
  GetPage(name: AppRoutes.changeUserName, page: () => const ChangeUserName()),
  GetPage(name: AppRoutes.changePassword, page: () => const ChangePassword()),
  GetPage(name: AppRoutes.changeEmail, page: () => const ChangeEmail()),
  GetPage(name: AppRoutes.changeUserPhone, page: () => const ChangeUserPhone()),
  GetPage(name: AppRoutes.notifications, page: () => const MyNotifications()),
  GetPage(name: AppRoutes.appSettings, page: () => const AppSettings()),
  GetPage(name: AppRoutes.searchResult, page: () => const SearchListResult()),
];