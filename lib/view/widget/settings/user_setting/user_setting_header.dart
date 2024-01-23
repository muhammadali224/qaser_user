import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../../controller/user_controller/user_controller.dart';
import '../../../../controller/user_settings_controller/user_setting_controller.dart';
import '../../../../core/constant/api_link.dart';
import '../../../../core/constant/color.dart';

class UserSettingHeader extends GetView<UserSettingController> {
  const UserSettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 4, color: Theme.of(context).scaffoldBackgroundColor),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 10))
              ],
            ),
            child: controller.file == null
                ? CacheNetworkImagePlus(
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      backgroundImage: imageProvider,
                      radius: 35,
                    ),
                    imageUrl:
                        "${AppLink.imageUserProfile}${UserController().user.usersImage}",
                    errorWidget: const Icon(
                      IconBroken.Profile,
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(controller.file!),
                    radius: 35,
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => controller.selectImage(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  shape: BoxShape.circle,
                  color: AppColor.fourthColor,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
