import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';

class HeaderHelloText extends StatelessWidget {
  final String name;
  final String imageUrl;
  final void Function()? onTapped;

  const HeaderHelloText(
      {super.key, required this.name, this.onTapped, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "${"hello".tr} , ",
                            style: const TextStyle(
                              color: Colors.red,
                              fontFamily: 'Almarai',
                              fontSize: 20,
                            )),
                        TextSpan(
                            text: name,
                            style: TextStyle(
                              color: AppColor.black,
                              fontFamily: 'Almarai',
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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: onTapped,
                child: CacheNetworkImagePlus(
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: Get.height / 15),
                    imageUrl: "${AppLink.imageUserProfile}$imageUrl",
                    errorWidget: const Center(
                      child: Icon(
                        IconBroken.Setting,
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
