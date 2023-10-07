import 'dart:io';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("www.google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (e) {
    SmartDialog.showToast("Error : ${e.message}");
    print(e.message);
    return false;
  }
}
