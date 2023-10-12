import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class HomeData {
  CRUD crud;

  HomeData(this.crud);

  getData(int branchId, int userId) async {
    var response = await crud.postData(AppLink.homePage, {
      'branch_id': branchId.toString(),
      'user_id': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getUserDetails(int id) async {
    var response = await crud.postData(AppLink.getUserDetails, {
      'id': id.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  updateBranch(int branchId, int userId) async {
    var response = await crud.postData(AppLink.changeUserBranch, {
      'id': userId.toString(),
      'branch_id': branchId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  searchItems(String search, int branchId) async {
    var response = await crud.postData(AppLink.searchItems, {
      'search': search,
      'branch_id': branchId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
