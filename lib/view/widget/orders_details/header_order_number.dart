import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class HeaderOrderNumber extends StatelessWidget {
  final String title;
  final int number;
  const HeaderOrderNumber({Key? key, required this.title, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration: BoxDecoration(color: AppColor.fifthColor),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(title.tr,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("$number #",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 20, color: AppColor.black)),
              )
            ]),
      ],
    );
  }
}
