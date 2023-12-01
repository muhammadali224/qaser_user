import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController>? completerController;
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  List<Marker> markers = [];
  CameraPosition? kGooglePlex;
  double? lat;
  double? long;

  getCurrentLocation() async {
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

    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    update();
  }

  requestLocationPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.rawSnackbar(
          duration: const Duration(seconds: 5),
          messageText: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('enableLocation'.tr),
              TextButton(
                onPressed: () {
                  // AppSettings.openLocationSettings();
                },
                child: Text(
                  'goToSetting'.tr,
                  style: TextStyle(color: AppColor.backgroundColor),
                ),
              )
            ],
          ));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.rawSnackbar(messageText: Text('enableLocationAccess'.tr));
    }
  }

  @override
  void onInit() {
    requestLocationPermissions();
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
