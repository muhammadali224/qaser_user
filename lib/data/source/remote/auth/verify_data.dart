import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class VerifyData {
  CRUD crud;
  VerifyData(this.crud);
  postData(String email, int verifyCode) async {
    var response = await crud.postData(AppLink.verify, {
      'email': email,
      'verifyCode': verifyCode.toString(),
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
