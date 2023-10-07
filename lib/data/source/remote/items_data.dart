import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../shared/user_details.dart';

class ItemsData {
  CRUD crud;

  ItemsData(this.crud);

  getData(String id, String userId) async {
    var response = await crud.postData(AppLink.items, {
      'id': id.toString(),
      'userid': userId,
      'branch_id': userData.userFavBranchId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getOffers() async {
    var response = await crud.postData(AppLink.offersItems, {
      'branch_id': userData.userFavBranchId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getSubItems(String itemId) async {
    var response = await crud.postData(AppLink.subItems, {
      'item_id': itemId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
