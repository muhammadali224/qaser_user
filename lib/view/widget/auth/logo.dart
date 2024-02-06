import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        Assets.imagesAppIcon,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
