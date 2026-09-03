import 'dart:async';
import 'dart:io';

import 'package:yayasan_app/common/common_custom_bnb.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/views/dashboard/dashboard_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/base/networking/network_connectivity.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/manager/user_manager.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/language/lang_translation.dart';

import '../views/dashboard/dashboard_screen.dart';

class BaseTabBarScreen extends BaseView<BaseTabBarViewModel> {
  BaseTabBarScreen({Key? key}) : super(key: key);
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget vBuilder() {
    return Obx(() {
      final barItems = <BottomNavigatorItem>[
        BottomNavigatorItem(
          label: "Home",
          selectedIcon: ["dashboard/dashboard_history_v3"],
        ),
        BottomNavigatorItem(
          label: "Get Help",
          selectedIcon: ["dashboard/dashboard_remittance_v3_9"],
        ),
        BottomNavigatorItem(
          label: "Donate",
          selectedIcon: ["dashboard/dashboard_home_v3"],
        ),
        BottomNavigatorItem(
          label: "Community",
          selectedIcon: ["dashboard/dashboard_wallet_v3"],
        ),
        BottomNavigatorItem(
          label: "Profile",
          selectedIcon: ["dashboard/dashboard_profile_v3"],
        ),
      ];
      return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              IndexedStack(
                index: controller.selectedIndex,
                children: controller.getBottomNavScreen(),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: (Platform.isIOS && AppDimension.mediaQueryBottomPadding != 0)? (- AppDimension.mediaQueryBottomPadding + 14): 0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.brightGray),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        child: BottomNavigationBar(
                          backgroundColor: AppColors.white,
                          unselectedLabelStyle: TextStyles.regularStyle(
                            size: 0,
                            
                            color: AppColors.white,
                          ),
                          selectedLabelStyle: TextStyles.boldStyle(
                            size: 0,
                            
                            color: AppColors.white,
                          ),
                          selectedItemColor: AppColors.black,
                          unselectedItemColor: AppColors.beer,
                          type: BottomNavigationBarType.fixed,
                          items: List.generate(
                            barItems.length,
                                (index) {
                              BottomNavigatorItem barItem = barItems[index];
                              return BottomNavigationBarItem(
                                icon: CustomBottomNavigationBarItem(
                                  index: index,
                                  showDotIndicator: controller.showDotIndicator.value,
                                  iconData: barItem.selectedIcon[0],
                                  isSelected: controller.selectedIndex == index,
                                  selectedColor: AppColors.deepMossGreen,
                                  unselectedColor: AppColors.white.withOpacity(0.3),
                                  selectedBackground: AppColors.transparent,
                                ),
                                label: "",
                                tooltip: "",
                              );
                            },
                          ),
                          currentIndex: controller.selectedIndex,
                          onTap: controller.onItemTapped,
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        );
      }
        // )
      );
    });
  }
}

class BaseTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseTabBarViewModel());
    Get.lazyPut(() => AppsLifeCycleController());
  }
}

final dashboardController = Get.find<DashboardController>();

class BaseTabBarViewModel extends BaseController {
  bool isActive = false;
  String routeName = RouteName.baseTabBarScreenRoute;
  int selectedIndex = 2;
  int currentIndex = 2;
  RxBool showDotIndicator = false.obs;

  @override
  void onInit() {
    NetworkConnectivity.instance.myStream.listen((event) {
      /// online - event is true
      /// offline - event is false
      if (event) {
        // BaseCommonWidgets().hideDialog();
        isActive = false;
      } else {
        if (!isActive) {
          BaseCommonWidgets().showAlert(
            onWillPop: (bool didPop) {
              if (didPop) {
                return;
              }
            },
            title: LangTranslation().string.noInternetConnection,
            middleText: LangTranslation().string.errorMessage,
            onConfirm: () {}
          );
          isActive = true;
        }
      }
    });
    super.onInit();
  }

  Future<void> onItemTapped(int index, {bool showLoading = true, bool callDefaultApi = true}) async {
      selectedIndex = index;
      switch (index) {
        case 0:
          selectedIndex = currentIndex;
          return;
        case 1:
          selectedIndex = currentIndex;
          return;
        case 2:
          if (!UserManager.instance.isUserLogged) {
            Get.toNamed(RouteName.loginScreenRoute);
            return;
          } else {
            Get.find<DashboardController>().getDashboard(showGifLoading: showLoading);
          }
          break;
        case 3:
          break;
        case 4:
          break;
      }
    selectedIndex = index;
    currentIndex = index;
    update();
  }

  List<StatelessWidget> getBottomNavScreen() {
    final bottomNavScreen = [
      const DashboardScreen(),
      const DashboardScreen(),
      const DashboardScreen(),
      const DashboardScreen(),
      const DashboardScreen(),
    ];
    return bottomNavScreen;
  }

  void onFloatingButtonTapped() {
      selectedIndex = 2;
      currentIndex = 2;
      if (!UserManager.instance.isUserLogged) {
        Get.toNamed(RouteName.loginScreenRoute);
        return;
      } else {
        Get.find<DashboardController>().getDashboard(showGifLoading: true);
      }
      update();
  }

}

class BottomNavigatorItem {
  BottomNavigatorItem({
    required this.label,
    required this.selectedIcon,
  });

  String label;
  List<String> selectedIcon;

  factory BottomNavigatorItem.fromJson(Map<String, dynamic> json) =>
      BottomNavigatorItem(
        label: json["label"],
        selectedIcon: List<String>.from(json["selectedIcon"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "selectedIcon": List<dynamic>.from(selectedIcon.map((x) => x)),
      };
}

class AppsLifeCycleController extends FullLifeCycleController
    with FullLifeCycleMixin {
  // Mandatory
  @override
  void onDetached() {
    NetworkConnectivity.instance.disposeStream();
    Utilities.showLogWhenDebug(
        "AppsLifeCycleController - onDetached called", "SUCCESS");
  }

  // Mandatory
  @override
  void onInactive() {
    Utilities.showLogWhenDebug(
        "AppsLifeCycleController - onInative called", "SUCCESS");
  }

  // Mandatory
  @override
  void onPaused() {
    Utilities.showLogWhenDebug(
        "AppsLifeCycleController - onPaused called", "SUCCESS");
  }

  // Mandatory
  @override
  void onResumed() {
    Utilities.showLogWhenDebug(
        "AppsLifeCycleController - onResumed called", "SUCCESS");
  }

  // Optional
  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    Utilities.showLogWhenDebug(
        "AppsLifeCycleController - the route ${routeInformation.uri} will be open", "SUCCESS");
    return super.didPushRouteInformation(routeInformation);
  }

  // Optional
  @override
  Future<bool> didPopRoute() {
    Utilities.showLogWhenDebug(
        "AppsLifeCycleController - the current route will be closed",
        "SUCCESS");
    return super.didPopRoute();
  }

  // Optional
  @override
  void didChangeMetrics() {
    // Utilities.showLogWhenDebug("AppsLifeCycleController - the window size did change","SUCCESS");
    super.didChangeMetrics();
  }

  // Optional
  @override
  void didChangePlatformBrightness() {
    Utilities.showLogWhenDebug(
        "AppsLifeCycleController - platform change ThemeMode", "SUCCESS");
    super.didChangePlatformBrightness();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
