import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/settings_controller/info_controller.dart';
import 'package:qaser_user/generated/assets.dart';

import '../../../widget/back_appbar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  Widget _infoTile(String title, String subtitle, {void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(InfoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('appInfo'.tr),
        leading: BackAppBar(),
      ),
      body: GetBuilder<InfoController>(builder: (controller) {
        return ListView(
          children: [
            Center(
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 50),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    image: DecorationImage(
                        image: AssetImage(Assets.imagesMhj), fit: BoxFit.fill)),
                // child: Image.asset(Assets.imagesMhj),
              ),
            ),
            _infoTile(
                'program_by'.tr, "MHJ Code  For Mobile Application Solution"),
            _infoTile('phone'.tr, "+962787860080",
                onTap: controller.launchCall),
            _infoTile('App_name'.tr, controller.packageInfo.appName),
            _infoTile('App_version'.tr, controller.packageInfo.version),
          ],
        );
      }),
    );
  }
}
