import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/api_link.dart';

class CheckEmailData {
  CRUD crud;
  CheckEmailData(this.crud);
  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
