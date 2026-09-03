import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../repository/repositories.dart';
import 'widget_state.dart';
export 'package:get/get.dart';

///
/// --------------------------------------------
/// [Example]
///
/// class HomeController extends BaseController {
///
///   var count = 0.obs;
///
///   @override
///   void onInit() {
///     super.onInit();
///   }
///
///   void increment() => count ++;
///
/// }
///
/// RECOMMENDED FOR your [Controller].
/// Please extends to your [Controller].
/// read the [Example] above.
class BaseController extends GetxController with ScreenState, Repositories {
  final box = GetStorage();
  bool isLoadMore = false;
  bool withScrollController = false;
  late ScrollController scrollController;
  int page = 1;
  int lastPage = 1;

  set setEnableScrollController(bool value) => withScrollController = value;

  static final Map<String, BaseController> _activeControllers = {};

  @override
  void onInit() {
    super.onInit();
    final route = Get.currentRoute;
    _activeControllers[route] = this;
    Utilities.showLogWhenDebug("🟢 Controller registered", "$runtimeType → $route");

    if (withScrollController) {
      Utilities().logWhenDebug("SCROLL CONTROLLER ENABLE on ${Get.currentRoute}", withScrollController.toString());
      scrollController = ScrollController();
      scrollController.addListener(_scrollListener);
    }
  }

  @override
  void onClose() {
    final route = Get.currentRoute;
    _activeControllers.remove(route);
    Utilities.showLogWhenDebug("🔴 Controller removed", "$runtimeType → $route");
    super.onClose();
  }

  /// Gets the controller currently active on a route
  static BaseController? getControllerByRoute(String route) {
    return _activeControllers[route];
  }

  /// Gets the latest visible controller
  static BaseController? get currentActiveController {
    if (_activeControllers.isEmpty) return null;
    return _activeControllers.values.last;
  }

  Future<void> onReconnect() async {
    await onRefresh();
  }

  Future onRefresh() async {
    page = 1;
    update();
  }

  void showLoading() {
    setScreenState = screenStateLoading;
    update();
  }

  void hideLoading() {
    setScreenState = screenStateOk;
    update();
  }

  void onLoadMore() {
    update();
  }

  void _scrollListener() {
    if (lastPage > 1 && (page < lastPage)) {
      if (scrollController.offset >= scrollController.position.maxScrollExtent) {
        if (!isLoadMore) {
          isLoadMore = true;
          // page = page + 1;
          // print('debug print : load more is called');
          onLoadMore();
          update();
        }
      }
    }
  }

  // void _innerBoxScrolled() {
  //   if (scrollController.offset <= 60 && scrollController.offset > 40) {
  //     // if(!innerBoxIsScrolled) {
  //     //   innerBoxIsScrolled = true;
  //     //   update();
  //     // }
  //   }
  //   if (scrollController.offset >= 0 && scrollController.offset <= 40) {
  //     // if(innerBoxIsScrolled) {
  //     //   innerBoxIsScrolled = false;
  //     //   update();
  //     // }
  //   }
  // }
}
