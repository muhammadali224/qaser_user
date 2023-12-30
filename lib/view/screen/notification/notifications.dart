import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/notification_controller/notifications_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/back_appbar.dart';

class MyNotifications extends StatelessWidget {
  const MyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationsController controller = Get.put(NotificationsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("notification".tr),
        leading: BackAppBar(),
        actions: [
          if (controller.user.value.usersIsAnonymous == 0)
            IconButton(
              onPressed: controller.markAllRead,
              icon: const Icon(
                Icons.clear_all,
                // color: Colors.red,
                size: 30,
              ),
            ),
        ],
      ),
      body: GetBuilder<NotificationsController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => ListTile(
                          onTap: () => controller.markRead(
                              controller.data[index].notificationsId!),
                          title: Text(
                            "${controller.data[index].notificationsTitle}".tr,
                            style: TextStyle(
                                color: controller
                                            .data[index].notificationsIsRead ==
                                        0
                                    ? Colors.black
                                    : Colors.grey.shade600),
                          ),
                          subtitle: Text(
                            "${controller.data[index].notificationsBody}".tr,
                            style: TextStyle(
                                color: controller
                                            .data[index].notificationsIsRead ==
                                        0
                                    ? Colors.black
                                    : Colors.grey.shade600),
                          ),
                          trailing: Text(
                            Jiffy.parseFromDateTime(
                              controller.data[index].notificationsTime!,
                            ).fromNow(),
                            style: TextStyle(
                                color: controller
                                            .data[index].notificationsIsRead ==
                                        0
                                    ? Colors.black
                                    : Colors.grey.shade600),
                          ),
                          leading: controller.user.value.usersIsAnonymous == 0
                              ? controller.data[index].notificationsIsRead ==
                                          0 &&
                                      controller.data[index]
                                              .notificationsUserid !=
                                          0
                                  ? Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue,
                                      ),
                                    )
                                  : null
                              : null,
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
