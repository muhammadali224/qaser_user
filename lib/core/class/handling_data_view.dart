import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../constant/color.dart';
import '../constant/image_assets.dart';
import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppImageAssets.loading, height: 250, width: 250),
              Text("loading".tr,
                  style: Theme.of(context).textTheme.displayLarge),
            ],
          ))
        : statusRequest == StatusRequest.offline
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppImageAssets.offline,
                        height: 250, width: 250),
                    Text("statusOffline".tr,
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverFail
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(AppImageAssets.serverError,
                            height: 250, width: 250),
                        Text("statusServer".tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColor.primaryColor)),
                      ],
                    ),
                  )
                : statusRequest == StatusRequest.failed
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(AppImageAssets.noData,
                                height: 250, width: 250, repeat: false),
                            Text("statusFailed".tr,
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ],
                        ),
                      )
                    : statusRequest == StatusRequest.emptyCart
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(Assets.lottieEmptyCart,
                                    height: 250, width: 250, repeat: false),
                                Text("emptyCart".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                              ],
                            ),
                          )
                        : statusRequest == StatusRequest.searching
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(Assets.lottieSearch,
                                        height: 250, width: 250, repeat: false),
                                    Text("searching".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge),
                                  ],
                                ),
                              )
                            : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppImageAssets.loading, height: 250, width: 250),
              Text("loading".tr,
                  style: Theme.of(context).textTheme.displayLarge),
            ],
          ))
        : statusRequest == StatusRequest.offline
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppImageAssets.offline,
                        height: 250, width: 250),
                    Text("statusOffline".tr,
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverFail
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(AppImageAssets.serverError,
                            height: 250, width: 250),
                        Text("statusServer".tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: AppColor.primaryColor)),
                      ],
                    ),
                  )
                : widget;
  }
}
