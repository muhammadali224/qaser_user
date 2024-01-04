import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaser_user/controller/awards_controller/awards_controller.dart';
import 'package:qaser_user/core/class/handling_data_view.dart';
import 'package:qaser_user/core/constant/api_link.dart';
import 'package:qaser_user/core/constant/color.dart';
import 'package:qaser_user/core/function/translate_database.dart';

import '../../widget/cached_network.dart';

class AwardsView extends StatelessWidget {
  const AwardsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AwardsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("rewards".tr),
      ),
      body: GetBuilder<AwardsController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "yourPoints".tr,
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  Text(
                    controller.totalPoint.toString(),
                    style:
                        TextStyle(fontSize: 22, color: AppColor.primaryColor),
                  ),
                ],
              ),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: controller.awardsList
                    .map((e) => Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 290,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: .5, color: AppColor.primaryColor)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedImage(
                                imageUrl:
                                    "${AppLink.imagesAwards}${e.itemsPointImage}",
                                imageBuilder: (_, imageProvider) => Container(
                                  height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    translateDatabase(
                                      e.itemsPointNameAr!,
                                      e.itemsPointName!,
                                    ),
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    "${e.itemsPointPrice} ${"point".tr}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: AppColor.primaryColor),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  if (!e.itemsPointStartDate!
                                      .isAfter(DateTime.now()))
                                    Text(
                                        "${"expireIn".tr} ${Jiffy.parseFromDateTime(e.itemsPointExpireDate!).fromNow()}"),
                                  if (e.itemsPointStartDate!
                                      .isAfter(DateTime.now()))
                                    Text(
                                        "${"startIn".tr} ${Jiffy.parseFromDateTime(e.itemsPointStartDate!).fromNow()}"),
                                  Text(
                                    "${"remaining".tr} ${e.itemsPointCount}",
                                    style:
                                        TextStyle(color: AppColor.primaryColor),
                                  )
                                ],
                              ),
                              controller.totalPoint >= e.itemsPointPrice!
                                  ? Expanded(
                                      child: TextButton(
                                      onPressed: () => controller
                                          .showQRCode(e.itemsPointId!),
                                      child: AutoSizeText(
                                        "redeem".tr,
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ))
                                  : AutoSizeText("pointsNotEnough".tr,
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: AppColor.primaryColor))
                            ],
                          ),
                        ))
                    .toList(),
              ))
            ],
          ),
        );
      }),
    );
  }
}
