import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/constant/get_box_key.dart';
import 'package:qaser_user/core/services/services.dart';

import '../../../core/constant/color.dart';

class CustomAuthInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? Function(String?) validator;
  final bool? isDense;
  final bool? obscureText;
  final IconData icon;
  final void Function()? onTapIcon;
  final void Function(String?)? onSubmit;

  const CustomAuthInput(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.validator,
      this.isDense,
      this.obscureText,
      required this.icon,
      this.onTapIcon,
      this.onSubmit});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: myServices.getBox.read(GetBoxKey.language) ==
                    GetBoxKey.arLanguage
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              labelText.tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            obscureText:
                obscureText == null || obscureText == false ? false : true,
            decoration: InputDecoration(
              isDense: (isDense != null) ? isDense : false,
              hintText: hintText.tr,
              suffixIcon: InkWell(
                onTap: onTapIcon,
                child: Icon(
                  icon,
                  color: AppColor.red,
                ),
              ),
              suffixIconConstraints: (isDense != null)
                  ? const BoxConstraints(maxHeight: 33)
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
