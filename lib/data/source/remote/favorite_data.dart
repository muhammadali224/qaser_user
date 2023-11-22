import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';
import '../../shared/branches.dart';

class FavoriteData {
  CRUD crud;

  FavoriteData(this.crud);

  addFavorite(int userId, int itemId) async {
    var response = await crud.postData(AppLink.addFavorite,
        {'userid': userId.toString(), 'itemid': itemId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int userId, int itemId) async {
    var response = await crud.postData(AppLink.removeFavorite, {
      'userid': userId.toString(),
      'itemid': itemId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  getFavorite(int userId) async {
    var response = await crud.postData(AppLink.getFavorite, {
      'id': userId.toString(),
      'branchId': selectedBranch.branchId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
