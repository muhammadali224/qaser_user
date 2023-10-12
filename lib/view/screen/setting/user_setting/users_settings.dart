import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../../controller/user_settings_controller/user_setting_controller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../widget/settings/setting_group.dart';
import '../../../widget/settings/setting_icon_style.dart';
import '../../../widget/settings/setting_tile.dart';
import '../../../widget/settings/user_setting/user_setting_header.dart';

class UserSetting extends StatelessWidget {
  const UserSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserSettingController());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('userSettings'.tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconBroken.Arrow___Right_2,
            size: 30,
          ),
        ),
        backgroundColor: Colors.grey[200],
      ),
      body: GetBuilder<UserSettingController>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: WillPopScope(
                  onWillPop: () => controller.getData(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: [
                        const UserSettingHeader(),
                        const SizedBox(height: 50),
                        CustomSettingGroup(
                          items: [
                            SettingsTileItem(
                              onTap: controller.goToChangeUserName,
                              icons: IconBroken.Profile,
                              iconStyle: SettingIconStyle(
                                iconsColor: Colors.white,
                                withBackground: true,
                                backgroundColor: Colors.red,
                              ),
                              title: 'userName'.tr,
                              subtitle:
                                  controller.userManagement.user.usersName,
                            ),
                            SettingsTileItem(
                              onTap: controller.goToChangePassword,
                              icons: IconBroken.Password,
                              iconStyle: SettingIconStyle(
                                iconsColor: Colors.white,
                                withBackground: true,
                                backgroundColor: Colors.grey,
                              ),
                              title: 'password'.tr,
                            ),
                            SettingsTileItem(
                              onTap: controller.goToChangeEmail,
                              icons: Icons.alternate_email_rounded,
                              iconStyle: SettingIconStyle(
                                iconsColor: Colors.white,
                                withBackground: true,
                                backgroundColor: Colors.cyan,
                              ),
                              title: 'email'.tr,
                              subtitle:
                                  controller.userManagement.user.usersEmail,
                            ),
                            SettingsTileItem(
                              onTap: controller.goToChangePhone,
                              icons: Icons.phone_android_rounded,
                              iconStyle: SettingIconStyle(
                                iconsColor: Colors.white,
                                withBackground: true,
                                backgroundColor: Colors.amber,
                              ),
                              title: 'phone'.tr,
                              subtitle:
                                  controller.userManagement.user.usersPhone,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
