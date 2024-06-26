import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/search_controller/search_result_controller.dart';
import '../../../core/constant/api_link.dart';
import '../../../core/function/translate_database.dart';
import '../../widget/back_appbar.dart';
import '../../widget/home/no_result_search.dart';

class SearchListResult extends StatelessWidget {
  const SearchListResult({super.key});

  @override
  Widget build(BuildContext context) {
    SearchResultController controller = Get.put(SearchResultController());
    return Scaffold(
      appBar: AppBar(
        title: Text("search".tr),
        leading: BackAppBar(),
      ),
      body: controller.listData.isEmpty
          ? const NoResultSearch()
          : ListView.builder(
              shrinkWrap: true,
              itemCount: controller.listData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                  child: InkWell(
                    onTap: () =>
                        controller.goToDetails(controller.listData[index]),
                    child: Container(
                      height: 170,
                      child: Card(
                        elevation: 20,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: CacheNetworkImagePlus(
                                imageUrl:
                                    "${AppLink.imagesItems}${controller.listData[index].itemsImage}",
                                boxFit: BoxFit.fill,
                              )),
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
                  ),
                );
              }),
    );
  }
}
