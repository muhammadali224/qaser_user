import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../data/shared/user_details.dart';

class HeaderHelloText extends StatelessWidget {
  final String name;
  final void Function()? onTapped;

  const HeaderHelloText({super.key, required this.name, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "${"hello".tr} , ",
                              style: const TextStyle(
                                color: Colors.red,
                                fontFamily: 'Cairo',
                                fontSize: 20,
                              )),
                          TextSpan(
                              text: name,
                              style: TextStyle(
                                color: AppColor.black,
                                fontFamily: 'Cairo',
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                    AnimatedTextKit(
                      totalRepeatCount: 3,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "howHelp".tr,
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            color: AppColor.black,
                          ),
                        ),
                      ],
                      stopPauseOnTap: true,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: onTapped,
                child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                    radius: 35,
                  ),
                  imageUrl: "${AppLink.imageUserProfile}${userData.usersImage}",
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(
                    IconBroken.Setting,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
