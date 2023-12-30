import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoController extends GetxController {
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    packageInfo = info;
    update();
  }

  launchCall() async {
    final url = Uri.parse('tel:+962787860080');
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }

  @override
  void onInit() {
    _initPackageInfo();
    super.onInit();
  }
}
