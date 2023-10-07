import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class SignupData {
  CRUD crud;
  SignupData(this.crud);
  postData(String userName, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      'userName': userName,
      'password': password,
      'email': email,
      'phone': phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
