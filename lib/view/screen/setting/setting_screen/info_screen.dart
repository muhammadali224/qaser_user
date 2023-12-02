import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/controller/settings_controller/info_controller.dart';

import '../../../widget/back_appbar.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    // InfoController controller = Get.put(InfoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('appInfo'.tr),
        leading: BackAppBar(),
      ),
      body: GetX<InfoController>(
        init: InfoController(),
        initState: (_) {},
        builder: (controller) {
          return ListView(
            children: [
              _infoTile('App name', controller.packageInfo.appName),
              _infoTile('App version', controller.packageInfo.version),
              _infoTile(
                'Installer store',
                controller.packageInfo.installerStore ?? 'not available',
              ),
            ],
          );
        },
      ),
    );
  }
}
