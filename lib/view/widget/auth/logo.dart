import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesLogo,
      height: 175,
    );
  }
}
