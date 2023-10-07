import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final IconData icon;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final TextInputType? type;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final void Function(String?)? onSubmit;

  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hint,
    required this.icon,
    required this.myController,
    required this.valid,
    this.type,
    this.obscureText,
    this.onTapIcon,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        obscureText: obscureText == null || obscureText == false ? false : true,
        validator: valid,
        controller: myController,
        decoration: InputDecoration(
            hintText: hint.tr,
            hintStyle: const TextStyle(fontSize: 16),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(title.tr)),
            suffixIcon: InkWell(
              onTap: onTapIcon,
              child: Icon(
                icon,
                color: AppColor.grey,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
