import 'package:flutter/services.dart';

copyText(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
