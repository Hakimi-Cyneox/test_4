import 'package:yayasan_app/base/base_controller.dart';

class PageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageOneController());
  }
}

class PageOneController extends BaseController {}
