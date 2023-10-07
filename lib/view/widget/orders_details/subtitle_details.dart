import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SubtitleDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? name;

  const SubtitleDetails(
      {Key? key, required this.title, required this.subtitle, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title.tr, style: TextStyle(fontSize: 16, color: AppColor.black)),
          if (name != null)
            Text(name!, style: TextStyle(fontSize: 16, color: AppColor.black)),
          Text(subtitle.tr,
              textAlign: TextAlign.center, style: const TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}
