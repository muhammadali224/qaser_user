import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class HeadersOrderDetails extends StatelessWidget {
  final String title;
  const HeadersOrderDetails({Key? key, required this.title}) : super(key: key);

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
            ]),
      ],
    );
  }
}
