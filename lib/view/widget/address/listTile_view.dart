// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:string_capitalize/string_capitalize.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/address_model.dart';

class AddressList extends StatelessWidget {
  final AddressModel addressModel;
  final void Function() onDelete;
  const AddressList({
    Key? key,
    required this.addressModel,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: IconButton(
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            onPressed: onDelete,
          ),
          title: Text(
            addressModel.addressName!.capitalizeEach(),
            textDirection: TextDirection.ltr,
            style: TextStyle(
                fontSize: 22,
                color: AppColor.black,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${addressModel.addressCity}, ${addressModel.addressStreet}",
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                addressModel.addressNote!,
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
