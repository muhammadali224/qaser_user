import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class AwardsData {
  CRUD crud;

  AwardsData(this.crud);

  getAwardsView(int userId) async {
    var response = await crud.postData(AppLink.getAwards, {
      'id': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
