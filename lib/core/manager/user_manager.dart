import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/core/manager/storage_box_manager.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/core/utils/const.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:yayasan_app/views/entry/model/login_response.dart';

class UserManager {
  UserManager._privateConstructor();

  static final UserManager instance = UserManager._privateConstructor();

  bool isUserLogged = false;
  bool isFirstLaunch = true;
  String userType = "";
  String? changePassword;

  /// function to check user login status
  Future checkAuthStatus() async {
    String? token = await StorageBoxManager.instance.read(StorageKeyName.authToken);
    // String? changePasswordFlag = await StorageBoxManager.instance.read(StorageKeyName.changePassword);
    // if(changePasswordFlag != null && changePasswordFlag == "1") {
    //   changePassword = changePasswordFlag;
    //   return;
    // }
    if(!Utilities.isStringNullOrEmpty(token)) {
      isUserLogged = token!.isNotEmpty;
    }
  }

  /// function that will be use to store user information
  saveLoginInfo(data) async {
    LoginResponse? loginResponse = LoginResponse.fromJson(data);
    // store auth token
    if (!Utilities.isStringNullOrEmpty(loginResponse.accessToken)) {
      StorageBoxManager.instance.write(StorageKeyName.authToken, loginResponse.accessToken ?? "");
    }
    // token type
    if (!Utilities.isStringNullOrEmpty(loginResponse.tokenType)) {
      StorageBoxManager.instance.write(StorageKeyName.tokenType, loginResponse.tokenType ?? "");
    }
    // store user data
    if (!Utilities.isStringNullOrEmpty(loginResponse.user)) {
      StorageBoxManager.instance.write(StorageKeyName.userData, jsonEncode(loginResponse.user));
    }

    /// user type
    userType = loginResponse.defaultDelegationInfo?.typeName ?? "";
    if (!Utilities.isStringNullOrEmpty(loginResponse.user?.changePassword)) {
      changePassword = loginResponse.user?.changePassword.toString();
    }

    await checkAuthStatus();
  }

  logout() {
    StorageBoxManager.instance.remove(eraseAll: false, keyList: [
      // remove all except locale
      StorageKeyName.authToken,
      StorageKeyName.tokenType,
      StorageKeyName.userData,
      StorageKeyName.isFirstLaunch,
    ]);
    isUserLogged = false;
    Get.offNamedUntil(RouteName.loginScreenRoute, (route) => false);
  }

  Future checkAppFirstLaunchStatus() async {
    String? value = await StorageBoxManager.instance.read(StorageKeyName.isFirstLaunch);
    if (!Utilities.isStringNullOrEmpty(value)) {
      isFirstLaunch = !value!.isNotEmpty;
    }
  }

  setAppFirstLaunchStatus() {
    StorageBoxManager.instance.write(StorageKeyName.isFirstLaunch, "launched");
  }

  Future<String> getUserData() async {
    String userValue = await StorageBoxManager.instance.read(StorageKeyName.userData);
    return userValue;
  }

  void userSessionTimeout() async {
    // clear storage box key, direct to logout screen, isLogged false
    await logout();

    BaseCommonWidgets().customShowAlert(
      title: LangTranslation().string.sessionTimeOut,
      message: LangTranslation().string.pleaseLoginAgain,
      onConfirmCallBack: () {
        BaseCommonWidgets().hideDialog();
      },
    );
  }

  void versionUpdateRequired() {
    // if (Get.currentRoute != RouteName.updateAppScreenRoute) {
    //   Get.offNamedUntil(RouteName.updateAppScreenRoute, (route) => false);
    // }
  }

}