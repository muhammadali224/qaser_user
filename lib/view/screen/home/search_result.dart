import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../controller/search_controller/search_result_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/function/translate_database.dart';
import '../../widget/home/no_result_search.dart';

class SearchListResult extends StatelessWidget {
  const SearchListResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchResultController controller = Get.put(SearchResultController());
    return Scaffold(
      appBar: AppBar(
        title: Text("search".tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            IconBroken.Arrow___Right_2,
            size: 30,
          ),
        ),
      ),
      body: controller.listData.isEmpty
          ? const NoResultSearch()
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      controller.goToDetails(controller.listData[index]),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "${AppLink.imagesItems}${controller.listData[index].itemsImage}"),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                title: Text(
                                  "${translateDatabase(controller.listData[index].itemsNameAr!, controller.listData[index].itemsName!)}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  "${translateDatabase(controller.listData[index].categoriesNameAr!, controller.listData[index].categoriesName!)}",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
