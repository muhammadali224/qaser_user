import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class OrdersData {
  CRUD crud;

  OrdersData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.allOrders, {'userid': id});
    return response.fold((l) => l, (r) => r);
  }

  ordersDetails(String id) async {
    var response = await crud.postData(AppLink.orderDetails, {'id': id});
    return response.fold((l) => l, (r) => r);
  }

  ordersDelete(String id) async {
    var response = await crud.postData(AppLink.orderDelete, {'order_id': id});
    return response.fold((l) => l, (r) => r);
  }

  ordersCancel(String id) async {
    var response = await crud.postData(AppLink.orderCancel, {'order_id': id});
    return response.fold((l) => l, (r) => r);
  }
}
