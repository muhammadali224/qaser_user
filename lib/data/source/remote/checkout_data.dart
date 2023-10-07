import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../shared/user_details.dart';

class CheckoutData {
  CRUD crud;

  CheckoutData(this.crud);

  checkout(
    String userId,
    String addressId,
    String orderType,
    String deliveryFee,
    String orderPrice,
    String discountAmount,
    String totalPrice,
    String couponId,
    String branchId,
  ) async {
    var response = await crud.postData(AppLink.checkout, {
      'userid': userId,
      'address_id': addressId,
      'type': orderType,
      'delevery_fee': deliveryFee,
      'order_price': orderPrice,
      'discount_ammount': discountAmount,
      'total_price': totalPrice,
      'couponid': couponId,
      'order_state': "0",
      'order_time': DateTime.now().toString(),
      'branch_id': branchId,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      'name': couponName,
      'branch_id': userData.userFavBranchId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
