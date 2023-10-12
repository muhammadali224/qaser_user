import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class RateOrdersData {
  CRUD crud;

  RateOrdersData(this.crud);

  getData(int id) async {
    var response =
        await crud.postData(AppLink.ratedOrders, {'userid': id.toString()});
    return response.fold((l) => l, (r) => r);
  }

  rateOrders(int orderId, String rate, String rateNote) async {
    var response = await crud.postData(AppLink.rateOrder, {
      'id': orderId.toString(),
      'rate': rate,
      'rate_note': rateNote,
    });
    return response.fold((l) => l, (r) => r);
  }
}
