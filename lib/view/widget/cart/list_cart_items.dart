import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/cart_controller/cart_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/cart_model/cart_model.dart';
import '../bottom_cart_button.dart';
import 'list cart items/cart_item_count.dart';

class CustomListCartItems extends GetView<CartControllerImp> {
  final CartModel cartModel;

  const CustomListCartItems({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1.6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${translateDatabase(cartModel.itemsNameAr!, cartModel.itemsName!)}",
                          style: TextStyle(color: AppColor.black, fontSize: 17),
                        ),
                        Row(
                          children: [
                            Text(
                              "${cartModel.cartItemPrice!.toStringAsFixed(2)} ${"jd".tr}",
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            if (cartModel.subItemId != null)
                              Text(
                                "/${translateDatabase(cartModel.subItemsNameAr!, cartModel.subItemsName!)}",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            SmartDialog.show(
                                builder: (_) => Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.all(15),
                                      height: 250,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 1.6),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(15),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  hintText: "enterNote".tr),
                                              controller:
                                                  controller.noteController,
                                              minLines: 1,
                                              maxLines: 4,
                                            ),
                                          ),
                                          ButtomNavigatButton(
                                            onPressed: () {
                                              SmartDialog.dismiss();
                                              controller.addNoteToItem(
                                                  cartModel.cartId!);

                                              controller.update();
                                            },
                                            title: 'save',
                                            color: Colors.red,
                                            icon: IconBroken.Send,
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                          child: Row(
                            children: [
                              const Icon(IconBroken.Edit_Square,
                                  color: Colors.red),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "addNote".tr,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(cartModel.cartItemNote!),
                        GestureDetector(
                          child: Icon(
                            Icons.delete,
                            color: AppColor.red,
                          ),
                          onTap: () =>
                              controller.deleteFromCart(cartModel.cartId!),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: CacheNetworkImagePlus(
                          imageUrl:
                              "${AppLink.imagesItems}${cartModel.itemsImage}",
                          height: 100,
                          width: 120,
                          imageBuilder: (context, imageProvider) => Container(
                            // width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          errorWidget: const Icon(
                            Icons.broken_image_rounded,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    CartItemCount(cartModel: cartModel),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
