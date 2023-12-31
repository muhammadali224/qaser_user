import 'package:flutter/material.dart';

import '../../../../core/function/translate_database.dart';

class ItemsDetailsDesc extends StatelessWidget {
  final String title;
  final String titleAr;
  const ItemsDetailsDesc(
      {super.key, required this.title, required this.titleAr});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          "${translateDatabase(titleAr, title)}",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ));
  }
}
