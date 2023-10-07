import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class CartData {
  CRUD crud;

  CartData(this.crud);

  addToCart(String userId, String itemId, String? weightAndSizeId,
      String cartItemPrice) async {
    var response = await crud.postData(AppLink.addCart, {
      'userid': userId,
      'itemid': itemId,
      'weight_size_id': weightAndSizeId ?? "",
      'cart_item_price': cartItemPrice,
    });
    return response.fold((l) => l, (r) => r);
  }

  addNoteToItem(String userId, String itemId, String note) async {
    var response = await crud.postData(AppLink.addNoteToItem, {
      'userid': userId,
      'cartid': itemId,
      'cart_item_note': note,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromCart(String userId, String itemId) async {
    var response = await crud.postData(
        AppLink.removeCartItems, {'userid': userId, 'itemid': itemId});
    return response.fold((l) => l, (r) => r);
  }

  getCountItem(String userId, String itemId) async {
    var response = await crud
        .postData(AppLink.getCount, {'userid': userId, 'itemid': itemId});
    return response.fold((l) => l, (r) => r);
  }

  getOrderCount(
    String userId,
  ) async {
    var response = await crud.postData(AppLink.getCount, {
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCart(String userId) async {
    var response = await crud.postData(AppLink.getCart, {'id': userId});
    return response.fold((l) => l, (r) => r);
  }
}
