import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/home/action_appbar_widget.dart';
import '../../widget/home/branch_dropdown.dart';
import '../../widget/home/custom_home_title.dart';
import '../../widget/home/discount_card.dart';
import '../../widget/home/header_hello_text.dart';
import '../../widget/home/leading_appbar.dart';
import '../../widget/home/list_home_categories.dart';
import '../../widget/home/list_home_items.dart';
import '../../widget/home/list_home_top_selling.dart';
import '../../widget/search_form_field.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return RefreshIndicator(
      onRefresh: () => controller.initData(),
      child: Scaffold(
        appBar: AppBar(
          title: const BranchDropDownList(),
          leading: LeadingAppbar(
            onTap: () => controller.goToCart(),
          ),
          actions: actionList,
        ),
        body: GetBuilder<HomeControllerImp>(
          builder: (controller) => ListView(
            children: [
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HeaderHelloText(
                        name: controller.userName,
                        onTapped: () => controller.goToSettings(),
                      ),
                      SearchFormField(
                        controller: controller.search,
                        hintTitle: 'findProduct',
                        onSearchTap: () => controller.onSearchItems(),
                        onSearchSubmitted: (val) => controller.onSearchItems(),
                        // onChanged: (val) => controller.checkSearch(val),
                      ),
                      const SwiperCard(),
                      const CustomHomeTitle(title: 'categories'),
                      const HomeCategoriesList(),
                      CustomHomeTitle(
                        title: 'offers',
                        withSeeAll: true,
                        seeAllOnPressed: () => controller.goToOffers(),
                      ),
                      const ListOffersHome(),
                      const CustomHomeTitle(title: 'topSelling'),
                      const ListTopSellingHome(),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
