import 'package:flutter/material.dart';

import '../../../core/constant/image_assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAssets.logoImage,
      height: 175,
    );
  }
}
