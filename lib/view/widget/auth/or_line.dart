import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrSection extends StatelessWidget {
  const OrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: Divider()),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text(
              "or".tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )),
      Expanded(child: Divider()),
    ]);
  }
}
