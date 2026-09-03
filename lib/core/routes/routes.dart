import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yayasan_app/base/base_tab_bar_screen.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/views/dashboard/dashboard_binding.dart';
import 'package:yayasan_app/views/dashboard/dashboard_screen.dart';
import 'package:yayasan_app/views/entry/login_binding.dart';
import 'package:yayasan_app/views/entry/login_v3_screen.dart';
import 'package:yayasan_app/views/entry/main_start_screen.dart';
import 'package:yayasan_app/views/splashscreen/splash_screen.dart';
import 'package:yayasan_app/views/splashscreen/splash_binding.dart';
import 'package:yayasan_app/views/language/language_screen.dart';
import 'package:yayasan_app/views/language/language_binding.dart';
import 'package:yayasan_app/views/intro/intro_screen.dart';
import 'package:yayasan_app/views/intro/intro_three_screen.dart';
import 'package:yayasan_app/views/intro/intro_binding.dart';

class Routes {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouteName.splashScreenRoute,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: RouteName.baseTabBarScreenRoute,
        page: () => BaseTabBarScreen(),
        binding: BaseTabBarBinding(),
      ),
      GetPage(
        name: RouteName.dashboardScreenRoute,
        page: () => const DashboardScreen(),
        binding: DashboardBinding(),
      ),
      GetPage(
        name: RouteName.loginScreenRoute,
        page: () => const LoginV3Screen(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RouteName.languageScreenRoute,
        page: () => const LanguageScreen(),
        binding: LanguageBinding(),
      ),
      GetPage(
        name: RouteName.introScreenRoute,
        page: () => const IntroScreen(),
        binding: IntroBinding(),
      ),
      GetPage(
        name: RouteName.introThreeScreenRoute,
        page: () => const IntroThreeScreen(),
        binding: IntroBinding(),
      ),
      GetPage(
        name: RouteName.mainStartScreenRoute,
        page: () => const MainStartScreen(),
        binding: IntroBinding(),
      ),
    ];
  }
}
