import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class UserPointData {
  CRUD crud;

  UserPointData(this.crud);

  getPoint(int userId) async {
    var response = await crud.postData(AppLink.getPoint, {
      'id': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
