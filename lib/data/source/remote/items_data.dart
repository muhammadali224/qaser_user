import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class ItemsData {
  CRUD crud;

  ItemsData(this.crud);

  getData(int id, int userId, int branchId) async {
    var response = await crud.postData(AppLink.items, {
      'id': id.toString(),
      'userid': userId.toString(),
      'branch_id': branchId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getOffers(int branchId, int userId) async {
    var response = await crud.postData(AppLink.offersItems, {
      'branch_id': branchId.toString(),
      'userid': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getSubItems() async {
    var response = await crud.postData(AppLink.subItems, {});
    return response.fold((l) => l, (r) => r);
  }
}
