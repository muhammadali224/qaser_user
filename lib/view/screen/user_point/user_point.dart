import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qaser_user/controller/user_point_controller/user_point_controller.dart';
import 'package:qaser_user/core/class/handling_data_view.dart';
import 'package:qaser_user/core/function/translate_database.dart';

import '../../widget/user_point/user_point_header_card.dart';

class UserPoint extends StatelessWidget {
  const UserPoint({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserPointController());
    return Scaffold(
      appBar: AppBar(title: Text("myPoints".tr)),
      body: GetBuilder<UserPointController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PointHeaderCard(),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: controller.userPointList
                    .map((e) => Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: ListTile(
                            title: Text(
                              "${e.pointsCount.toString()}  [${Jiffy.parseFromDateTime(e.createDate!).format(pattern: "dd-MM-yyyy")}] ",
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: e.isExpired == 1
                                ? Text(
                                    "expired".tr,
                                    style: TextStyle(color: Colors.red),
                                  )
                                : null,
                            subtitle: Text(
                                "${translateDatabase(e.pointDescreption!, e.pointDescreptionEn!)}"),
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
