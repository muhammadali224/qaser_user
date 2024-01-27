import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalRowSection extends StatelessWidget {
  final String title;
  final String description;

  const TotalRowSection(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          "${title.tr} :",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        AutoSizeText(
          description,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
