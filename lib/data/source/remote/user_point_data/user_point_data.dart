import 'package:qaser_user/data/model/user_point_model/user_point_model.dart';

import '../../../../core/class/crud.dart';
import '../../../../core/constant/api_link.dart';

class UserPointData {
  CRUD crud;

  UserPointData(this.crud);

  getPoint(int userId) async {
    var response = await crud.postData(AppLink.getPoint, {
      'id': userId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addPoint(int userId, UserPointModel pointModel) async {
    var response = await crud.postData(AppLink.addPoint, {
      'id': userId.toString(),
      'count': pointModel.pointsCount.toString(),
      'desc': pointModel.pointDescreptionEn,
      'descAr': pointModel.pointDescreption,
      'createDate': pointModel.createDate.toString(),
      'expireDate': pointModel.expireDate.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
