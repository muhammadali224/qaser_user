import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../core/constant/api_link.dart';
import '../../../data/shared/user_details.dart';

class HeaderCardSetting extends StatelessWidget {
  final Color? cardColor;
  final double? cardRadius;
  final Color? backgroundMotifColor;
  final VoidCallback? onTap;
  final String? userName;

  // final String? userEmail;
  final Widget? userMoreInfo;

  const HeaderCardSetting({
    super.key,
    required this.cardColor,
    this.cardRadius = 20,
    required this.userName,
    this.backgroundMotifColor = Colors.white,
    this.userMoreInfo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height / 6,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius:
              BorderRadius.circular(double.parse(cardRadius!.toString())),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: backgroundMotifColor!.withOpacity(.1),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 400,
                backgroundColor: backgroundMotifColor!.withOpacity(.05),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                              backgroundImage: imageProvider,
                              radius: Get.height / 15,
                            ),
                        imageUrl:
                            "${AppLink.imageUserProfile}${userData.usersImage}",
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Center(
                              child: Icon(
                                IconBroken.Setting,
                              ),
                            )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
