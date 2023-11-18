import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppLink {
  static String server = dotenv.env['SERVER']!;
  static String test = "$server/test.php";

//============================== Images ==============================//
  static String images = "$server/upload";
  static String imagesCategories = "$images/categories/";
  static String imageUserProfile = "$images/user_profile/";
  static String imageOffer = "$images/offers/";
  static String imagesItems = "$images/items/";

//=============================== Auth ===============================//
  static String signup = "$server/auth/signup.php";
  static String verify = "$server/auth/verify_code.php";
  static String login = "$server/auth/login.php";
  static String loginAnonymous = "$server/auth/login_anon.php";
  static String resendVerify = "$server/auth/resend_verify.php";
  static String getUserDetails = "$server/auth/get_user_details.php";

//========================= Forget Password =========================//
  static String checkEmail = "$server/forgetPassword/check_email.php";
  static String resetPassword = "$server/forgetPassword/reset_password.php";
  static String verifyResetCode =
      "$server/forgetPassword/verify_reset_code.php";

//============================== Home  ==============================//
  static String homePage = '$server/home.php';
  static String notifications = '$server/notifications/view.php';
  static String makeNotificationRead = '$server/notifications/mark_read.php';
  static String makeAllNotificationRead =
      '$server/notifications/mark_all_read.php';

//============================== Items ==============================//
  static String items = '$server/items/items.php';
  static String searchItems = '$server/items/search.php';
  static String offersItems = '$server/items/offers.php';
  static String subItems = '$server/items/sub_items.php';

//============================ Favorite =============================//
  static String addFavorite = '$server/favorite/add.php';
  static String removeFavorite = '$server/favorite/remove.php';
  static String getFavorite = '$server/favorite/view.php';
  static String deleteFromFavorite = '$server/favorite/delete_fav.php';

//============================== Cart ===============================//
  static String addCart = '$server/cart/add.php';
  static String removeCartItems = '$server/cart/remove.php';
  static String getCart = '$server/cart/view.php';
  static String getCount = '$server/cart/get_count.php';
  static String addNoteToItem = '$server/cart/add_note_to_item.php';

//============================ Address ==============================//
  static String addAddress = '$server/address/add.php';
  static String deleteAddress = '$server/address/delete.php';
  static String getAddresses = '$server/address/view.php';
  static String editAddress = '$server/address/edit.php';

//============================ Coupon ==============================//
  static String checkCoupon = '$server/coupon/check_coupon.php';

//============================ Orders ==============================//
  static String checkout = '$server/orders/checkout.php';
  static String allOrders = '$server/orders/all_orders.php';
  static String orderDetails = '$server/orders/details.php';
  static String orderDelete = '$server/orders/delete.php';
  static String orderCancel = '$server/orders/cancel.php';
  static String ratedOrders = '$server/orders/get_unrated.php';
  static String rateOrder = '$server/orders/rate_order.php';

//============================ User Setting ==============================//
  static String getUserData = '$server/userSetting/get_user.php';
  static String changePassword = '$server/userSetting/change_password.php';
  static String changeEmail = '$server/userSetting/change_email.php';
  static String changePIN = '$server/userSetting/change_pin.php';
  static String changePhone = '$server/userSetting/change_phone.php';
  static String changeImage = '$server/userSetting/change_image.php';
  static String deleteImage = '$server/userSetting/delete_image.php';
  static String changeUserName = '$server/userSetting/change_userName.php';
  static String checkChangedEmail =
      '$server/userSetting/check_changed_email.php';
  static String verifyChangedEmail =
      '$server/userSetting/verify_changed_email.php';

//============================ Branches ==============================//
  static String changeUserBranch = '$server/branches/change_user_branch.php';
  static String viewBranches = '$server/branches/view.php';
}
