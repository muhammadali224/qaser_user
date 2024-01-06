import '../../../../../core/class/crud.dart';
import '../../../../../core/constant/api_link.dart';

class CheckSMSData {
  CRUD crud;

  CheckSMSData(this.crud);

  sendSMS(String phoneNumber) async {
    var response = await crud.postData(AppLink.sendSMSVerify, {
      'phoneNumber': phoneNumber,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkSMS(String phoneNumber, int verifyCode, String id) async {
    var response = await crud.postData(AppLink.verifySMS, {
      'phoneNumber': phoneNumber,
      'verifyCode': verifyCode.toString(),
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
