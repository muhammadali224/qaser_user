class AppLink {
  static const String server =
      "https://ecommerce-arabicoders.000webhostapp.com/ecommerce";
  static const String test = "$server/test.php";

//============================== Images ==============================//
  static const String images = "$server/upload";
  static const String imagesCategories = "$images/categories/";
  static const String imageUserProfile = "$images/user_profile/";
  static const String imageOffer = "$images/offers/";
  static const String imagesItems = "$images/items/";

//=============================== Auth ===============================//
  static const String signup = "$server/auth/signup.php";
  static const String verify = "$server/auth/verify_code.php";
  static const String login = "$server/auth/login.php";
  static const String resendVerify = "$server/auth/resend_verify.php";
  static const String getUserDetails = "$server/auth/get_user_details.php";

//========================= Forget Password =========================//
  static const String checkEmail = "$server/forgetPassword/check_email.php";
  static const String resetPassword =
      "$server/forgetPassword/reset_password.php";
  static const String verifyResetCode =
      "$server/forgetPassword/verify_reset_code.php";

//============================== Home  ==============================//
  static const String homePage = '$server/home.php';
  static const String notifications = '$server/notifications/view.php';
  static const String makeNotificationRead =
      '$server/notifications/mark_read.php';
  static const String makeAllNotificationRead =
      '$server/notifications/mark_all_read.php';

//============================== Items ==============================//
  static const String items = '$server/items/items.php';
  static const String searchItems = '$server/items/search.php';
  static const String offersItems = '$server/items/offers.php';
  static const String subItems = '$server/items/sub_items.php';

//============================ Favorite =============================//
  static const String addFavorite = '$server/favorite/add.php';
  static const String removeFavorite = '$server/favorite/remove.php';
  static const String getFavorite = '$server/favorite/view.php';
  static const String deleteFromFavorite = '$server/favorite/delete_fav.php';

//============================== Cart ===============================//
  static const String addCart = '$server/cart/add.php';
  static const String removeCartItems = '$server/cart/remove.php';
  static const String getCart = '$server/cart/view.php';
  static const String getCount = '$server/cart/get_count.php';
  static const String addNoteToItem = '$server/cart/add_note_to_item.php';

//============================ Address ==============================//
  static const String addAddress = '$server/address/add.php';
  static const String deleteAddress = '$server/address/delete.php';
  static const String getAddresses = '$server/address/view.php';
  static const String editAddress = '$server/address/edit.php';

//============================ Coupon ==============================//
  static const String checkCoupon = '$server/coupon/check_coupon.php';

//   static const String addAddress = '$server/coupon/add.php';
//   static const String deleteAddress = '$server/coupon/delete.php';
//   static const String getAddresses = '$server/coupon/view.php';
//   static const String editAddress = '$server/coupon/edit.php';

//============================ Orders ==============================//
  static const String checkout = '$server/orders/checkout.php';
  static const String allOrders = '$server/orders/all_orders.php';
  static const String orderDetails = '$server/orders/details.php';
  static const String orderDelete = '$server/orders/delete.php';
  static const String orderCancel = '$server/orders/cancel.php';
  static const String ratedOrders = '$server/orders/get_unrated.php';
  static const String rateOrder = '$server/orders/rate_order.php';

//============================ User Setting ==============================//
  static const String getUserData = '$server/userSetting/get_user.php';
  static const String changePassword =
      '$server/userSetting/change_password.php';
  static const String changeEmail = '$server/userSetting/change_email.php';
  static const String changePIN = '$server/userSetting/change_pin.php';
  static const String changePhone = '$server/userSetting/change_phone.php';
  static const String changeImage = '$server/userSetting/change_image.php';
  static const String deleteImage = '$server/userSetting/delete_image.php';
  static const String changeUserName =
      '$server/userSetting/change_userName.php';
  static const String checkChangedEmail =
      '$server/userSetting/check_changed_email.php';
  static const String verifyChangedEmail =
      '$server/userSetting/verify_changed_email.php';
  static const String changeUserBranch =
      '$server/userSetting/change_fav_branch.php';
}
