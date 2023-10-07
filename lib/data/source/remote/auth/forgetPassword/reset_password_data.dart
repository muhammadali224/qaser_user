import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/api_link.dart';

class ResetPasswordData {
  CRUD crud;
  ResetPasswordData(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
