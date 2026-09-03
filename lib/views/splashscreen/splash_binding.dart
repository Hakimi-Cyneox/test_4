import 'package:yayasan_app/base/base_controller.dart';
import 'package:yayasan_app/core/manager/user_manager.dart';
import 'package:yayasan_app/core/routes/route_name.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

class SplashController extends BaseController {
  @override
  void onReady() {
    super.onReady();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    await UserManager.instance.checkAuthStatus();

    if (UserManager.instance.isUserLogged) {
      Get.offAllNamed(RouteName.baseTabBarScreenRoute);
    } else {
      Get.offAllNamed(RouteName.languageScreenRoute);
    }
  }
}
