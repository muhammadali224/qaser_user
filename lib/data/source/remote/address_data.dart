import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class AddressData {
  CRUD crud;
  AddressData(this.crud);

  addAddress(
    String userId,
    String name,
    String city,
    String street,
    String note,
    String long,
    String lat,
  ) async {
    var response = await crud.postData(AppLink.addAddress, {
      'user_id': userId,
      'name': name,
      'city': city,
      'street': street,
      'note': note,
      'long': long,
      'lat': lat,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(
    String addressId,
  ) async {
    var response =
        await crud.postData(AppLink.deleteAddress, {'address_id': addressId});
    return response.fold((l) => l, (r) => r);
  }

  getAddress(String userId) async {
    var response =
        await crud.postData(AppLink.getAddresses, {'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }

  editAddress(
    String addressId,
    String name,
    String city,
    String street,
    String note,
    String long,
    String lat,
  ) async {
    var response = await crud.postData(AppLink.editAddress, {
      'address_id': addressId,
      'name': name,
      'city': city,
      'street': street,
      'note': note,
      'long': long,
      'lat': lat,
    });
    return response.fold((l) => l, (r) => r);
  }
}
