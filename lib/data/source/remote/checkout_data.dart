import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class CheckoutData {
  CRUD crud;

  CheckoutData(this.crud);

  checkout(
    int userId,
    String addressId,
    String orderType,
    String deliveryFee,
    String orderPrice,
    String discountAmount,
    String totalPrice,
    int couponId,
    int branchId,
  ) async {
    var response = await crud.postData(AppLink.checkout, {
      'userid': userId.toString(),
      'address_id': addressId,
      'type': orderType,
      'delevery_fee': deliveryFee,
      'order_price': orderPrice,
      'discount_ammount': discountAmount,
      'total_price': totalPrice,
      'couponid': couponId.toString(),
      'order_state': "0",
      'order_time': DateTime.now().toString(),
      'branch_id': branchId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName, int branchId) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      'name': couponName,
      'branch_id': branchId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
