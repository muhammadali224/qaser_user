import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/address_controller/add_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../widget/back_appbar.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("addAddress".tr),
        centerTitle: true,
        leading: BackAppBar(),
      ),
      body: GetBuilder<AddAddressController>(
          builder: (myController) => HandlingDataView(
                statusRequest: myController.statusRequest,
                widget: Column(
                  children: [
                    if (myController.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              fortyFiveDegreeImageryEnabled: true,
                              myLocationEnabled: true,
                              mapToolbarEnabled: true,
                              myLocationButtonEnabled: true,
                              markers: myController.markers.toSet(),
                              onTap: (latlong) {
                                print(latlong);
                                myController.addMarkers(latlong);
                              },
                              mapType: MapType.normal,
                              initialCameraPosition: myController.kGooglePlex!,
                              onMapCreated:
                                  (GoogleMapController mapController) {
                                myController.completerController!
                                    .complete(mapController);
                              },
                            ),
                            Positioned(
                              bottom: 10,
                              child: MaterialButton(
                                minWidth: 250,
                                height: 50,
                                color: AppColor.fifthColor,
                                onPressed: myController.goToAddLocation,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "confirm".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(width: 10),
                                      const Icon(
                                        IconBroken.Location,
                                        color: Colors.green,
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              )),
    );
  }
}
