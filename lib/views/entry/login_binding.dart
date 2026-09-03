import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yayasan_app/base/base_tab_bar_screen.dart';
import 'package:yayasan_app/core/localization/localization.dart';
import 'package:yayasan_app/main.dart';
import 'package:yayasan_app/views/entry/model/country_dropdown_param.dart';

import '../../base/base_common_widgets.dart';
import '../../base/base_controller.dart';
import '../../base/networking/api_result.dart';
import '../../core/manager/user_manager.dart';
import '../../core/routes/route_name.dart';
import '../../core/utils/utilities.dart';
import '../../core/utils/validation/validation_item.dart';
import '../../language/lang_translation.dart';
import 'model/general_entry_param.dart';
import 'model/get_country_response.dart';
import 'model/login_response.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends BaseController with GetSingleTickerProviderStateMixin {

  //otp data
  // master otp -> 888888
  int pinCodeLength = 6;
  RxString otpPinCode = "".obs;
  RxBool pinCodeHasError = false.obs;
  late StreamController<ErrorAnimationType> errorController;

  RxBool showResendButton = false.obs;
  RxString displayTime = "".obs;
  LoginResponse loginResponse = LoginResponse();
  // CountryResponse selectedCountry = CountryResponse();
  Dropdown dropDownResponse = Dropdown();
  // List<CountryResponse> newAvailableCountryList = [];
  RxBool acceptTerms = false.obs;

  // login
  late TextEditingController loginPhoneNumberTextController;
  late TextEditingController loginPasswordTextController;

  FocusNode loginPhoneNumberFocusNode = FocusNode();
  FocusNode loginPasswordFocusNode = FocusNode();

  ValidationItem loginPhoneNumberValidateItem = ValidationItem();
  ValidationItem loginPasswordValidateItem = ValidationItem();

  String appVersion = "";
  RxList<Language> languageList = <Language>[].obs;

  @override
  void onInit() {
    super.onInit();
    loginPhoneNumberTextController = TextEditingController();
    loginPasswordTextController = TextEditingController();
    errorController = StreamController<ErrorAnimationType>.broadcast();
  }

  @override
  void onReady() {
    getCountry();
    super.onReady();
  }

  void resetVariable() {
    loginPhoneNumberValidateItem.isError = false;
    loginPasswordValidateItem.isError = false;
    // reset TextEditingController controller
    loginPhoneNumberTextController.clear();
    loginPasswordTextController.clear();
    FocusManager.instance.primaryFocus?.unfocus();
    update();
  }

  void validateAllField() {
    loginPhoneNumberFieldValidation();
    loginPasswordFieldValidation();
  }

  bool loginPhoneNumberFieldValidation() {
    loginPhoneNumberValidateItem.isError = loginPhoneNumberTextController.text.isEmpty;
    loginPhoneNumberValidateItem.msg = LangTranslation().string.required;
    update();
    return ValidationItem().validate([loginPhoneNumberValidateItem]);
  }

  bool loginPasswordFieldValidation() {
    loginPasswordValidateItem.isError = loginPasswordTextController.text.isEmpty;
    loginPasswordValidateItem.msg = LangTranslation().string.required;
    update();
    return ValidationItem().validate([loginPasswordValidateItem]);
  }

  updateSelectedCountry(e) {
    // selectedCountry = e;
    update();
  }

  popPage() {
    Get.back();
  }

  Future<bool> getCountry() async {
    CountryDropdownParam param = CountryDropdownParam();
    param.dropdown = ["sys_language"];
    return await getCountryRepo(param).then(
      (Result value) {
        return _handleGetCountryResponse(value);
      },
    ).onError(
      (error, stackTrace) {
        BaseCommonWidgets().customSnackBarShowAlert(
          title: LangTranslation().string.error,
          message: error.toString(),
        );
        return false;
      },
    );
  }

  _handleGetCountryResponse(Result response) {
    if (response.status ?? false) {
      if (response.dropdown != null && response.dropdown!.isNotEmpty) {
        dropDownResponse = Dropdown.fromJson(response.dropdown!);
        LocalizationService.instance.updateLanguagePriorities(dropDownResponse.sysLanguage);
      }
      refresh();
      return true;
    } else {
      BaseCommonWidgets().customSnackBarShowAlert(
      message: response.error != null ? response.error.toString(): LangTranslation().string.errorMessageOpps,
      );
    }
    return false;
  }

  Future<bool> login() async {
    validateAllField();
    if (loginPhoneNumberFieldValidation() && loginPasswordFieldValidation()) {
      BaseCommonWidgets().showLoadingDialog();
      GeneralEntryParam generalEntryParam = GeneralEntryParam(
          // phoneNo : "${selectedCountry.dialCode}-${loginPhoneNumberTextController.text}",
          password : loginPasswordTextController.text,
      );
      return await loginRepo(generalEntryParam).then(
            (Result value) {
          return _handleLoginResponse(value);
        },
      ).onError(
            (error, stackTrace) {
          BaseCommonWidgets().hideDialog();
          BaseCommonWidgets().customSnackBarShowAlert(
            title: LangTranslation().string.error,
            message: error.toString(),
          );
          return false;
        },
      );
    }
    return false;
  }

  _handleLoginResponse(Result response) async {
    BaseCommonWidgets().hideDialog();

    if (response.status ?? false) {
      // handle response here
      if (!Utilities.isStringNullOrEmpty(response.body["data"])) {
        loginResponse = LoginResponse.fromJson(response.body["data"]);
        await UserManager.instance.saveLoginInfo(response.body["data"]);
      }

        if (mode == Mode.staging) {
          // await userRegisterPushy(loginResponse.user?.id);
        } else {
          if (UserManager.instance.isUserLogged) {
            Get.offAllNamed(RouteName.baseTabBarScreenRoute);
            await Get.find<BaseTabBarViewModel>().onItemTapped(2);
          }
        }
      resetVariable();
      refresh();
      return true;
    } else {
      BaseCommonWidgets().customSnackBarShowAlert(
          errorMessages: (response.error != null) ? response.error : response.message
      );
    }
    return false;
  }

  void getLanguageList() {
    languageList.value = LocalizationService.instance.getLanguageList();
  }

}
