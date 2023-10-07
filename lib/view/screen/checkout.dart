// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:icon_broken/icon_broken.dart';
//
// import '../../controller/checkout_controller.dart';
// import '../../core/class/handling_data_view.dart';
// import '../widget/checkout/checkout_bottom_navigation.dart';
//
// class Checkout extends StatelessWidget {
//   const Checkout({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('checkout'.tr),
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: const Icon(
//             IconBroken.Arrow___Right_2,
//             size: 30,
//           ),
//         ),
//       ),
//       bottomNavigationBar: const CheckoutBottomNavigation(),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         child: GetBuilder<CheckoutController>(
//             builder: (controller) => HandlingDataView(
//                   statusRequest: controller.statusRequest,
//                   widget: ListView(
//                     children: [
//                       // const CheckoutCoupon(),
//                       // const CheckoutTitle(title: 'chooseOrderType'),
//                       // Row(
//                       //   mainAxisAlignment: MainAxisAlignment.start,
//                       //   mainAxisSize: MainAxisSize.min,
//                       //   children: [
//                       //     ...List.generate(
//                       //         controller.orderMethod.length,
//                       //         (i) => CheckoutOrderList(
//                       //               onChanged: (val) {
//                       //                 controller.selectOrderMethod(val!);
//                       //               },
//                       //               groupValue: controller.orderType,
//                       //               value: i,
//                       //               title: controller.orderMethod[i]['title'],
//                       //               icon: controller.orderMethod[i]['icon'],
//                       //               activeRadio: i,
//                       //             )),
//                       //   ],
//                       // ),
//                       // const SizedBox(height: 10),
//                       // if (controller.orderType == 1 &&
//                       //     controller.addressController.data.isNotEmpty)
//                       //   Column(
//                       //     crossAxisAlignment: CrossAxisAlignment.start,
//                       //     mainAxisAlignment: MainAxisAlignment.start,
//                       //     mainAxisSize: MainAxisSize.min,
//                       //     children: [
//                       //       const CheckoutTitle(title: 'chooseLocation'),
//                       //       ...List.generate(
//                       //           controller.addressController.data.length,
//                       //           (index) => CheckoutLocation(
//                       //                 addressModel: controller
//                       //                     .addressController.data[index],
//                       //                 value: index,
//                       //                 activeRadio: index,
//                       //                 groupValue: controller.locationList,
//                       //                 onChanged: (val) {
//                       //                   controller.selectLocationDeliver(val!);
//                       //                 },
//                       //               ))
//                       //     ],
//                       //   ),
//                       // if (controller.addressController.data.isEmpty &&
//                       //     controller.orderType == 1)
//                       //   Column(
//                       //     children: [
//                       //       Text(
//                       //         "noLocation".tr,
//                       //         style: const TextStyle(fontSize: 20),
//                       //       ),
//                       //       TextButton(
//                       //           onPressed: () {
//                       //             Get.toNamed(AppRoutes.addressAdd);
//                       //           },
//                       //           child: Text(
//                       //             "goToLocation".tr,
//                       //             style: const TextStyle(
//                       //                 fontWeight: FontWeight.bold),
//                       //           )),
//                       //     ],
//                       //   ),
//                     ],
//                   ),
//                 )),
//       ),
//     );
//   }
// }
