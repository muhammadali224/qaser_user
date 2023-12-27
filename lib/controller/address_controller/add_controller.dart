import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes.dart';
import '../../core/function/request_location_permission.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController>? completerController;
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  double? lat;
  double? long;

  getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 17,
      );
      addMarkers(LatLng(position!.latitude, position!.longitude));
      statusRequest = StatusRequest.none;
      lat = position!.latitude;
      long = position!.longitude;
    } catch (e) {
      throw Exception("Error Get Current Location : $e");
    }

    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    update();
  }

  @override
  void onInit() async {
    await requestLocationPermissions();
    completerController = Completer<GoogleMapController>();
    getCurrentLocation();
    super.onInit();
  }

  goToAddLocation() {
    Get.toNamed(AppRoutes.addLocationDetails, arguments: {
      'lat': lat,
      'long': long,
    });
  }
}
