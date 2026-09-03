import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/base/base_controller.dart';
import 'package:yayasan_app/core/localization/localization.dart';
import 'package:yayasan_app/core/manager/storage_box_manager.dart';
import 'package:yayasan_app/core/utils/const.dart';
import 'package:get/get.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController());
  }
}

class LanguageController extends BaseController {
  RxList<Language> languageList = <Language>[].obs;
  RxString selectedLangLocal = "".obs;
  Rx<Language?> tempSelectedLanguage = Rx<Language?>(null);

  @override
  void onInit() {
    super.onInit();
    getLanguageList();
    initSelectedLanguage();
  }

  void getLanguageList() {
    languageList.value = LocalizationService.instance.getLanguageList();
  }

  void initSelectedLanguage() {
    Language? current;

    // Use the locale from LocalizationService as the primary source of truth
    // during initialization, as Get.locale might not be set yet.
    final activeLocale = Get.locale ?? LocalizationService.instance.locale;

    // 1. Try to match with active locale
    current = languageList.firstWhereOrNull(
      (element) => element.languageCode == activeLocale.languageCode,
    );

    // 2. If no match, default to English ('en')
    current ??= languageList.firstWhereOrNull(
      (element) => element.languageCode == 'en',
    );

    // 3. Fallback to first in list if English is somehow missing
    tempSelectedLanguage.value =
        current ?? (languageList.isNotEmpty ? languageList.first : null);
  }

  Future<bool> confirmLanguageSelection() async {
    if (tempSelectedLanguage.value != null) {
      return await selectLanguage(tempSelectedLanguage.value!);
    }
    return false;
  }

  Future<bool> selectLanguage(Language selectedLanguage) async {
    try {
      await Get.updateLocale(selectedLanguage.locale);

      Map<String, dynamic> data = {
        "languageCode": selectedLanguage.languageCode,
        "countryCode": selectedLanguage.locale.countryCode,
      };

      StorageBoxManager.instance.write(
        StorageKeyName.locale,
        jsonEncode(data),
      );

      selectedLangLocal.value = selectedLanguage.languageCode.toUpperCase();
      return true;
    } catch (e, s) {
      if (kDebugMode) {
        print("$e $s");
      }
    }
    return false;
  }
}
