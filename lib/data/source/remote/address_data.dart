import '../../../core/class/crud.dart';
import '../../../core/constant/api_link.dart';

class AddressData {
  CRUD crud;

  AddressData(this.crud);

  addAddress(
    int userId,
    String name,
    String city,
    String street,
    String note,
    double long,
    double lat,
  ) async {
    var response = await crud.postData(AppLink.addAddress, {
      'user_id': userId.toString(),
      'name': name,
      'city': city,
      'street': street,
      'note': note,
      'long': long.toString(),
      'lat': lat.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(int addressId) async {
    var response = await crud.postData(
      AppLink.deleteAddress,
      {
        'address_id': addressId.toString(),
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getAddress(int userId) async {
    var response = await crud
        .postData(AppLink.getAddresses, {'user_id': userId.toString()});
    return response.fold((l) => l, (r) => r);
  }

  editAddress(
    int addressId,
    String name,
    String city,
    String street,
    String note,
    double long,
    double lat,
  ) async {
    var response = await crud.postData(AppLink.editAddress, {
      'address_id': addressId.toString(),
      'name': name,
      'city': city,
      'street': street,
      'note': note,
      'long': long.toString(),
      'lat': lat.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
