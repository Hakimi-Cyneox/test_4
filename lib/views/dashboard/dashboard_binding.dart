import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:yayasan_app/main.dart';
import 'package:yayasan_app/views/dashboard/model/get_dashboard_response.dart';

import '../../base/base_common_widgets.dart';
import '../../base/base_controller.dart';
import '../../base/networking/api_result.dart';
import '../../core/manager/user_manager.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class DashboardController extends BaseController {
  bool isDataLoaded = false;

  @override
  Future<void> onReady() async {
    if (UserManager.instance.isUserLogged) {
      getDashboard(showGifLoading: true);
    }
    super.onReady();
  }

  @override
  Future onRefresh() async {
    super.onRefresh();
  }

  Future<bool> getDashboard({bool showGifLoading = false}) async {
    isColdStart = false;
    Utilities.showLogWhenDebug('dashboard wasColdStart', '$isColdStart');
    if (showGifLoading) {
      BaseCommonWidgets().showLoadingDialog();
    }
    return await getDashboardRepo().then((Result value) async {
      return _handleGetDashboardResponse(value, showGifLoading);
    }).onError((error, stackTrace) {
      if (showGifLoading) {
        BaseCommonWidgets().hideDialog();
      }
      BaseCommonWidgets().customSnackBarShowAlert(
          message: error.toString()
      );
    });
  }

  _handleGetDashboardResponse(Result response, bool showGifLoading) async {
    if (showGifLoading) {
      BaseCommonWidgets().hideDialog();
    }
    if (response.status ?? false) {
      if (!Utilities.isStringNullOrEmpty(response.body)) {
        // GetDashboardResponse getDashboardResponse = GetDashboardResponse.fromJson(response.body);
      }

      update();
      return true;
    } else {
      BaseCommonWidgets().customShowAlert(
        title: LangTranslation().string.error,
        message: response.error != null ? response.error.toString(): LangTranslation().string.errorMessageOpps,
        onConfirmCallBack: () {
          BaseCommonWidgets().hideDialog();
        },
      );
    }
    return false;
  }


}