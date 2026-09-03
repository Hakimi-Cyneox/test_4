import 'package:yayasan_app/base/base_tab_bar_screen.dart';
import 'package:yayasan_app/core/services/device_info_services.dart';
import 'package:yayasan_app/views/entry/login_binding.dart';
import 'package:yayasan_app/views/intro/intro_binding.dart';
import 'package:yayasan_app/views/language/language_binding.dart';
import 'package:get/get.dart';

import '../views/dashboard/dashboard_binding.dart';

class AppBinding extends Bindings {
  AppBinding();

  /// [Usage]
  /// 1. controller that you want to bind permanently when the apps started to run
  @override
  void dependencies() {
    Get.put(IntroThreeController(), permanent: true);
    Get.put(BaseTabBarViewModel(), permanent: true);
    Get.put(AppsLifeCycleController(), permanent: true);
    Get.put(LanguageController(), permanent: true);
    Get.put(DashboardController(), permanent: true);
    Get.put(LoginController(), permanent: true);
  }

}

class AsyncBindingsServices {
  Future<void> setupDependencies() async {
    // Get.lazyPut<PushyService>(
    //       () => AppPushyService(),
    // );
    await Get.putAsync<DeviceInfoServices>(() async {
      final DeviceInfoServices deviceInfoServices = DeviceInfoServices();
      await deviceInfoServices.initialize();
      return deviceInfoServices;
    });
  }
}