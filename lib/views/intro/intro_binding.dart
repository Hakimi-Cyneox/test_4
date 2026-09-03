import 'package:get/get.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
    Get.lazyPut(() => IntroThreeController());
  }
}

class IntroController extends BaseController {
  final currentPage = 0.obs;
}

class IntroThreeController extends BaseController {
  RxBool isAgreeToTerm = false.obs;
}
