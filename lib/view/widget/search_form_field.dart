import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

class SearchFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintTitle;
  final void Function()? onSearchTap;
  final void Function(String)? onSearchSubmitted;
  final void Function(String)? onChanged;

  const SearchFormField({
    super.key,
    this.controller,
    required this.hintTitle,
    this.onSearchTap,
    this.onChanged,
    this.onSearchSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        onSubmitted: onSearchSubmitted,
        decoration: InputDecoration(
          hintText: hintTitle.tr,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.green, width: 1.2),
          ),
          suffixIcon: IconButton(
            onPressed: onSearchTap,
            icon: const Icon(
              IconBroken.Search,
              color: Colors.green,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.green, width: 1.2),
          ),
        ),
      ),
    );
  }
}
