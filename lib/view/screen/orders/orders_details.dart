import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/orders/order_details_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../widget/bottom_cart_button.dart';
import '../../widget/orders_details/header_order_number.dart';
import '../../widget/orders_details/headers_order_details.dart';
import '../../widget/orders_details/subtitle_details.dart';
import '../../widget/orders_details/table_order_details.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController myController = Get.put(OrderDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: Text('ordersDetails'.tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconBroken.Arrow___Right_2,
            size: 30,
          ),
        ),
      ),
      bottomNavigationBar: myController.ordersModel.ordersState == "0"
          ? ButtomNavigatButton(
              onPressed: () => myController.orderCancel(),
              color: AppColor.primaryColor,
              title: 'cancel',
              icon: Icons.cancel_outlined)
          : myController.ordersModel.ordersState == "4"
              ? ButtomNavigatButton(
                  onPressed: () => myController.orderDelete(),
                  color: AppColor.primaryColor,
                  title: 'delete',
                  icon: Icons.delete_forever_outlined)
              : null,
      body: GetBuilder<OrderDetailsController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                HeaderOrderNumber(
                  title: 'orderNumber',
                  number: controller.ordersModel.ordersId!,
                ),
                SubtitleDetails(
                    title: 'orderType',
                    subtitle:
                        "${controller.orderType[controller.ordersModel.ordersType!]}"),
                SubtitleDetails(
                    title: 'orderTime',
                    subtitle: controller.ordersModel.ordersTime!),
                SubtitleDetails(
                    title: 'branch',
                    subtitle: translateDatabase(
                        controller.ordersModel.branchNameAr!,
                        controller.ordersModel.branchNameEn!)),
                const SizedBox(height: 20),
                const OrderTableDetails(),
                const SizedBox(height: 20),
                if (controller.ordersModel.ordersType == "1")
                  const HeadersOrderDetails(title: 'deliverTo'),
                if (controller.ordersModel.ordersType == "1")
                  ListTile(
                    title: Text(
                        "${controller.ordersModel.addressName}, ${controller.ordersModel.addressCity}, ${controller.ordersModel.addressStreet}",
                        style: TextStyle(
                          fontSize: 17,
                          color: AppColor.black,
                        )),
                  ),
                if (controller.ordersModel.ordersType == "1")
                  SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: GoogleMap(
                        markers: controller.markers.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated: (GoogleMapController mapController) {
                          controller.completerController!
                              .complete(mapController);
                        },
                      )),
                const SizedBox(height: 20),
                const HeadersOrderDetails(title: 'paymentInfo'),
                SubtitleDetails(
                    title: 'deliveryCharge',
                    subtitle: "${controller.ordersModel.ordersDeliveryFee}"),
                SubtitleDetails(
                    title: 'discount',
                    name: controller.ordersModel.couponName,
                    subtitle:
                        "${controller.ordersModel.ordersDiscountAmmount}"),
                SubtitleDetails(
                    title: 'orderPrice',
                    subtitle: "${controller.ordersModel.ordersPrice}"),
                SubtitleDetails(
                    title: 'tot',
                    subtitle: "${controller.ordersModel.ordersTotalPrice}"),
              ],
            ),
          ),
        );
      }),
    );
  }
}
