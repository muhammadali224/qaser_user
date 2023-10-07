import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

viewSelectLanguage(
    {required void Function() onTapAr, required void Function() onTapEn}) {
  Get.bottomSheet(
      Container(
        margin: const EdgeInsets.all(15),
        height: Get.height / 4,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "chooseLang".tr,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor),
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)),
                    child: Text(
                      'ar'.tr,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => onTapAr(),
                ),
                const SizedBox(height: 10),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)),
                    child: Text(
                      'en'.tr,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => onTapEn(),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColor.backgroundColor);
}
