import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class LoginData {
  CRUD crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
