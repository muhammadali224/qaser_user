import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../shared/user_details.dart';

class HomeData {
  CRUD crud;

  HomeData(this.crud);

  getData(String branchId, String userId) async {
    var response = await crud.postData(AppLink.homePage, {
      'branch_id': branchId,
      'user_id': userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getUserDetails(String id) async {
    var response = await crud.postData(AppLink.getUserDetails, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateBranch(String branchId, String userId) async {
    var response = await crud.postData(AppLink.changeUserBranch, {
      'id': userId,
      'branch_id': branchId,
    });
    return response.fold((l) => l, (r) => r);
  }

  searchItems(String search) async {
    var response = await crud.postData(AppLink.searchItems, {
      'search': search,
      'branch_id': userData.userFavBranchId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
