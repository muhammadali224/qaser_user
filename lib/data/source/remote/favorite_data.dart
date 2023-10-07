import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class FavoriteData {
  CRUD crud;
  FavoriteData(this.crud);
  addFavorite(String userId, String itemId) async {
    var response = await crud
        .postData(AppLink.addFavorite, {'userid': userId, 'itemid': itemId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userId, String itemId) async {
    var response = await crud
        .postData(AppLink.removeFavorite, {'userid': userId, 'itemid': itemId});
    return response.fold((l) => l, (r) => r);
  }

  getFavorite(String userId) async {
    var response = await crud.postData(AppLink.getFavorite, {'id': userId});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavoriteItems(String id) async {
    var response = await crud.postData(AppLink.deleteFromFavorite, {'id': id});
    return response.fold((l) => l, (r) => r);
  }
}
