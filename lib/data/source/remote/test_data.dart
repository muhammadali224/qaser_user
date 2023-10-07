import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class TestData {
  CRUD crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
