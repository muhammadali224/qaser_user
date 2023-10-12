import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/api_link.dart';

class VerifyResetCodeData {
  CRUD crud;
  VerifyResetCodeData(this.crud);
  postData(String email, int code) async {
    var response = await crud.postData(AppLink.verifyResetCode, {
      'email': email,
      'verifyCode': code.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  resendVerify(String email) async {
    var response = await crud.postData(AppLink.resendVerify, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
