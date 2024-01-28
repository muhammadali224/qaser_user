import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jiffy/jiffy.dart';

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
    Get.put(OrderDetailsController());

    return GetBuilder<OrderDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ordersDetails'.tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_right,
              size: 30,
            ),
          ),
        ),
        bottomNavigationBar: controller.getTimeDifference() <= 2 &&
                (controller.ordersModel.ordersState! <= 3)
            ? ButtomNavigatButton(
                color: Colors.red,
                title: 'cancel',
                textColor: Colors.white,
                onPressed: controller.orderCancel,
                icon: Icons.cancel,
              )
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
                          "${controller.orderType[controller.ordersModel.ordersType]}"),
                  SubtitleDetails(
                      title: 'orderTime',
                      subtitle: Jiffy.parseFromDateTime(
                              controller.ordersModel.ordersTime!)
                          .format(pattern: "dd/MM/yyyy  HH:mm a")),
                  SubtitleDetails(
                      title: 'branch',
                      subtitle: translateDatabase(
                          controller.ordersModel.branchNameAr!,
                          controller.ordersModel.branchNameEn!)),
                  const SizedBox(height: 20),
                  const HeadersOrderDetails(title: 'ordersDetails'),
                  const OrderTableDetails(),
                  const SizedBox(height: 20),
                  if (controller.ordersModel.ordersType == 1)
                    const HeadersOrderDetails(title: 'deliverTo'),
                  if (controller.ordersModel.ordersType == 1)
                    ListTile(
                      title: Text(
                          "${controller.ordersModel.addressName}, ${controller.ordersModel.addressCity}, ${controller.ordersModel.addressStreet}",
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColor.black,
                          )),
                    ),
                  if (controller.ordersModel.ordersType == 1)
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
                  if (controller.ordersModel.ordersType == 1)
                    SubtitleDetails(
                        title: 'deliveryCharge',
                        subtitle:
                            "${controller.ordersModel.ordersDeliveryFee}"),
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
    });
  }
}
