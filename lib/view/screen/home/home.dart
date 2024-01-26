import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:qaser_user/core/constant/routes.dart';
import 'package:qaser_user/core/function/exit_alert.dart';
import 'package:qaser_user/data/shared/branches.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../controller/user_controller/user_controller.dart';
import '../../../core/class/handling_data_view.dart';
import '../../widget/home/action_appbar_widget.dart';
import '../../widget/home/branch_dropdown.dart';
import '../../widget/home/chips_section.dart';
import '../../widget/home/custom_home_title.dart';
import '../../widget/home/discount_card.dart';
import '../../widget/home/expandable_floating.dart';
import '../../widget/home/header_hello_text.dart';
import '../../widget/home/leading_appbar.dart';
import '../../widget/home/list_home_categories.dart';
import '../../widget/home/list_home_offers_items.dart';
import '../../widget/home/list_home_top_selling.dart';
import '../../widget/home/timer_prize.dart';
import '../../widget/login_container.dart';
import '../../widget/search_form_field.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());

    return PopScope(
      onPopInvoked: exitAlert,
      child: RefreshIndicator(
        onRefresh: () => controller.getData(controller.selectedValue),
        child: GetBuilder<HomeControllerImp>(builder: (controller) {
          return Scaffold(
            floatingActionButtonLocation: ExpandableFab.location,
            floatingActionButton: ExpandFloating(),
            appBar: AppBar(
              title: branchesList.length < 2
                  ? InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.selectBranch);
                      },
                      child: AutoSizeText(
                        "القصر الشرقي - ش.فلسطين",
                        maxFontSize: 20,
                      ),
                    )
                  : BranchDropDownList(),
              leading: LeadingAppbar(onTap: controller.goToCart),
              actions: [NotificationIcon()],
            ),
            body: ListView(
              children: [
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HeaderHelloText(
                          imageUrl: UserController().user.usersImage ?? "null",
                          name: UserController().user.usersIsAnonymous == 0
                              ? UserController().user.usersName!
                              : "user".tr,
                          onTapped: controller.goToSettings,
                        ),
                        if (UserController().user.usersIsAnonymous == 1)
                          const LoginContainer(),
                        SearchFormField(
                          controller: controller.search,
                          hintTitle: 'findProduct',
                          onSearchTap: () => controller.onSearchItems(),
                          onSearchSubmitted: (val) =>
                              controller.onSearchItems(),
                          // onChanged: (val) => controller.checkSearch(val),
                        ),
                        const SwiperCard(),
                        TimerPrize(),
                        ChipsSection(),
                        const CustomHomeTitle(title: 'categories'),
                        const HomeCategoriesList(),
                        if (controller.itemsOfferList.isNotEmpty)
                          CustomHomeTitle(
                            title: 'offers',
                            withSeeAll: true,
                            seeAllOnPressed: () => controller.goToOffers(),
                          ),
                        if (controller.itemsOfferList.isNotEmpty)
                          const ListOffersHome(),
                        const CustomHomeTitle(title: 'suggestProduct'),
                        ListTopSellingHome(
                          itemList: controller.suggestItem,
                          tag: 'suggestProduct',
                        ),
                        if (controller.topSellingList.isNotEmpty)
                          const CustomHomeTitle(title: 'topSelling'),
                        if (controller.topSellingList.isNotEmpty)
                          ListTopSellingHome(
                            itemList: controller.topSellingList,
                            tag: 'topSelling',
                          ),
                      ],
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
