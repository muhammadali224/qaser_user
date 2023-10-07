import 'package:flutter/material.dart';

class SettingIconStyle {
  Color? iconsColor;
  bool? withBackground;
  Color? backgroundColor;
  double? borderRadius;

  SettingIconStyle({
    this.iconsColor = Colors.white,
    this.withBackground = true,
    this.backgroundColor = Colors.blue,
    borderRadius = 8,
  }) : borderRadius = double.parse(borderRadius!.toString());
}
