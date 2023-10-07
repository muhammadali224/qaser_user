import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class RateOrdersData {
  CRUD crud;

  RateOrdersData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ratedOrders, {'userid': id});
    return response.fold((l) => l, (r) => r);
  }

  rateOrders(String orderId, String rate, String rateNote) async {
    var response = await crud.postData(AppLink.rateOrder, {
      'id': orderId,
      'rate': rate,
      'rate_note': rateNote,
    });
    return response.fold((l) => l, (r) => r);
  }
}
