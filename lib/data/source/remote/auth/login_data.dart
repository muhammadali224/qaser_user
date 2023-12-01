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

  loginAnonymous(String email, int branchId, String userName) async {
    var response = await crud.postData(AppLink.loginAnonymous, {
      'id': email,
      'branchId': branchId.toString(),
      'userName': userName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
