import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../../controller/settings_controller/settings_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/function/view_select_languages_bottom_sheet.dart';
import '../../../../data/shared/anonymous_user.dart';
import '../../../widget/settings/header_card_setting.dart';
import '../../../widget/settings/setting_group.dart';
import '../../../widget/settings/setting_icon_style.dart';
import '../../../widget/settings/setting_tile.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('setting'.tr),
        leading: IconButton(
          onPressed: controller.goToHome,
          icon: const Icon(
            IconBroken.Home,
            size: 35,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SettingsController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: ListView(
              children: [
                HeaderCardSetting(
                  imageUrl: user.usersImage ?? "",
                  cardColor: Colors.red,
                  userName: controller.userName,
                  onTap: controller.goToUserSettings,
                ),
                CustomSettingGroup(
                  settingsGroupTitle: 'general'.tr,
                  items: [
                    SettingsTileItem(
                      icons: Icons.notifications_rounded,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.red,
                      ),
                      title: 'notification'.tr,
                      subtitle: controller.switchVal ? "on".tr : "off".tr,
                      trailing: Switch.adaptive(
                        value: controller.switchVal,
                        onChanged: (value) {
                          controller.toggleSwitchVal(value);
                        },
                      ),
                    ),
                    SettingsTileItem(
                      onTap: () {
                        viewSelectLanguage(
                            onTapAr: () => controller.setLanguage('ar'),
                            onTapEn: () => controller.setLanguage('en'));
                      },
                      icons: Icons.translate_outlined,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.deepPurpleAccent,
                      ),
                      title: 'lang'.tr,
                      trailing: Text(
                        "${controller.lang}".tr,
                        style: Theme.of(context).textTheme.bodyMedium!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                CustomSettingGroup(
                  settingsGroupTitle: 'myInfo'.tr,
                  items: [
                    SettingsTileItem(
                      onTap: controller.goToFavorite,
                      icons: IconBroken.Heart,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.red,
                      ),
                      title: 'favorite'.tr,
                    ),
                    SettingsTileItem(
                      onTap: controller.goToAddressView,
                      icons: Icons.pin_drop_rounded,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.cyan,
                      ),
                      title: 'allAddress'.tr,
                    ),
                    SettingsTileItem(
                      onTap: controller.goToOrders,
                      icons: Icons.receipt_rounded,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.orange,
                      ),
                      title: 'myOrders'.tr,
                    ),
                    SettingsTileItem(
                      onTap: controller.goToOrdersRating,
                      icons: Icons.star_rate_rounded,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.amber,
                        withBackground: true,
                        backgroundColor: Colors.grey,
                      ),
                      title: 'ratings'.tr,
                    ),
                  ],
                ),
                CustomSettingGroup(
                  settingsGroupTitle: 'support'.tr,
                  items: [
                    SettingsTileItem(
                      onTap: () {},
                      icons: Icons.call_rounded,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.brown,
                      ),
                      title: 'contactUs'.tr,
                    ),
                    SettingsTileItem(
                      onTap: () {},
                      icons: Icons.info,
                      iconStyle: SettingIconStyle(
                        iconsColor: Colors.white,
                        withBackground: true,
                        backgroundColor: Colors.indigo,
                      ),
                      title: 'aboutUs'.tr,
                    ),
                  ],
                ),
                CustomSettingGroup(items: [
                  SettingsTileItem(
                    onTap: () {
                      controller.logout();
                    },
                    icons: Icons.logout,
                    iconStyle: SettingIconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.blueGrey,
                    ),
                    title: 'logout'.tr,
                    titleStyle: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
