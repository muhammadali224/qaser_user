import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/app.service.dart';

import 'setting_icon_style.dart';
import 'setting_utils.dart';

class SettingsTileItem extends StatelessWidget {
  final IconData icons;
  final SettingIconStyle? iconStyle;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const SettingsTileItem(
      {super.key,
      required this.icons,
      this.iconStyle,
      required this.title,
      this.titleStyle,
      this.subtitle,
      this.subtitleStyle,
      this.backgroundColor,
      this.trailing,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        onTap: onTap,
        leading: (iconStyle != null && iconStyle!.withBackground!)
            ? Container(
                decoration: BoxDecoration(
                  color: iconStyle!.backgroundColor,
                  borderRadius: BorderRadius.circular(iconStyle!.borderRadius!),
                ),
                padding: const EdgeInsets.all(5),
                child: Icon(
                  icons,
                  size: SettingsUtils.settingsGroupIconSize,
                  color: iconStyle!.iconsColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  icons,
                  size: SettingsUtils.settingsGroupIconSize,
                ),
              ),
        title: Text(
          title,
          style: titleStyle ?? const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: (subtitle != null)
            ? Text(
                subtitle!,
                style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: (trailing != null)
            ? trailing
            : Icon(myServices.getBox.read(GetBoxKey.language) ==
                    GetBoxKey.arLanguage
                ? IconBroken.Arrow___Left_2
                : IconBroken.Arrow___Right_2),
      ),
    );
  }
}
