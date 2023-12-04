import 'package:qaser_user/data/shared/branches.dart';

import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class CartData {
  CRUD crud;

  CartData(this.crud);

  addToCart(String userId, String itemId, String? weightAndSizeId,
      String cartItemPrice, String itemCount, String itemPointCount) async {
    var response = await crud.postData(AppLink.addCart, {
      'userid': userId,
      'itemid': itemId,
      'weight_size_id': weightAndSizeId ?? "",
      'cart_item_price': cartItemPrice,
      'cart_item_count': itemCount,
      "item_point_count": itemPointCount,
      "branch_id": selectedBranch.value.branchId.toString(),
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

  removeFromCart(int cartId) async {
    var response = await crud.postData(
      AppLink.deleteCartItems,
      {
        'id': cartId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getOrderCount(int userId) async {
    var response = await crud.postData(AppLink.getCount, {
      'userid': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getCart(int userId) async {
    var response = await crud.postData(AppLink.getCart, {
      'id': userId.toString(),
      "branch_id": selectedBranch.value.branchId.toString(),
    });
    print(selectedBranch.value.branchId);
    return response.fold((l) => l, (r) => r);
  }
}
