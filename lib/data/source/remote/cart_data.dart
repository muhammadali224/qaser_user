import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class CartData {
  CRUD crud;

  CartData(this.crud);

  addToCart(int userId, int itemId, String? weightAndSizeId,
      num cartItemPrice) async {
    var response = await crud.postData(AppLink.addCart, {
      'userid': userId.toString(),
      'itemid': itemId.toString(),
      'weight_size_id': weightAndSizeId ?? "",
      'cart_item_price': cartItemPrice.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addNoteToItem(int userId, int itemId, String note) async {
    var response = await crud.postData(AppLink.addNoteToItem, {
      'userid': userId.toString(),
      'cartid': itemId.toString(),
      'cart_item_note': note,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromCart(int userId, int itemId) async {
    var response = await crud.postData(
      AppLink.removeCartItems,
      {
        'userid': userId.toString(),
        'itemid': itemId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getCountItem(int userId, int itemId) async {
    var response = await crud.postData(AppLink.getCount, {
      'userid': userId.toString(),
      'itemid': itemId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getOrderCount(int userId) async {
    var response = await crud.postData(AppLink.getCount, {
      'userid': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getCart(int userId) async {
    var response =
        await crud.postData(AppLink.getCart, {'id': userId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
