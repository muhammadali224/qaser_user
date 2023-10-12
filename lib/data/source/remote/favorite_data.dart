import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

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
    var response =
        await crud.postData(AppLink.getFavorite, {'id': userId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavoriteItems(int id) async {
    var response =
        await crud.postData(AppLink.deleteFromFavorite, {'id': id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
