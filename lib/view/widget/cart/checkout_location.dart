import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/address_model.dart';

class CheckoutLocation extends StatelessWidget {
  final void Function()? onTap;
  final AddressModel addressModel;

  const CheckoutLocation({
    super.key,
    this.onTap,
    required this.addressModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          // color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              addressModel.addressName!.capitalizeFirst!,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text("${addressModel.addressCity} ,${addressModel.addressStreet}"),
          ],
        ),
      ),
    );
  }
}
