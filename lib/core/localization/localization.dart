import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yayasan_app/core/manager/storage_box_manager.dart';
import 'package:yayasan_app/core/utils/const.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/language/en_my.dart';
import 'package:get/get.dart';
import 'package:yayasan_app/language/my_my.dart';
import 'package:yayasan_app/language/zh_cn.dart';
import 'package:yayasan_app/views/language/language_binding.dart';

class LocalizationService extends Translations {

  LocalizationService._privateConstructor();
  static final LocalizationService instance = LocalizationService._privateConstructor();

  Locale locale = const Locale('en', 'MY');
  bool isLangNull = true;
  String localHeaderValue = "en";
  Map<String, String>? _languagePriorities;

  // get saved localize
  Future initialize() async {
    var localValue = await StorageBoxManager.instance.read(StorageKeyName.locale);
    
    if (!Utilities.isStringNullOrEmpty(localValue)) {
      Map<String, dynamic>? data = jsonDecode(localValue);
      if (data != null) {
        localHeaderValue = data['languageCode'];
        locale = Locale.fromSubtags(languageCode: data['languageCode']!, countryCode: data['countryCode']!);
        isLangNull = false;
      } else {
        locale = const Locale('en', 'MY');
        localHeaderValue = 'en';
        isLangNull = true;
      }
    } else {
      // set default as en
      localHeaderValue = 'en';
      locale = const Locale('en', 'MY');
      isLangNull = true;
    }

    if (!Get.isRegistered<LanguageController>()) {
      Get.put(LanguageController());
    }
    
    Get.find<LanguageController>().selectedLangLocal.value = localHeaderValue.toUpperCase();
    Get.find<LanguageController>().initSelectedLanguage();
  }

  static const fallbackLocale = Locale('en', 'MY');

  static final languages = <Language>[

    Language(
        id: 2,
        name: 'English',
        flag: 'english',
        languageCode: 'en',
        locale: const Locale('en', 'MY')),
    Language(
        id: 3,
        name: '简体中文',
        flag: 'chinese',
        languageCode: 'cn',
        locale: const Locale('cn', 'MY')),
    Language(
        id: 1,
        name: 'Bahasa Melayu',
        flag: 'malaysia',
        languageCode: 'my',
        locale: const Locale('my', 'MY')),
  ];

  void updateLanguagePriorities(Map<String, String>? priorities) {
    _languagePriorities = priorities;
    if (Get.isRegistered<LanguageController>()) {
      Get.find<LanguageController>().getLanguageList();
    }
  }

  List<Language> getLanguageList() {
    if (_languagePriorities == null || _languagePriorities!.isEmpty) {
      return languages;
    }

    List<Language> sortedList = List.from(languages);
    sortedList.sort((a, b) {
      int priorityA = int.tryParse(_languagePriorities![a.languageCode] ?? '999') ?? 999;
      int priorityB = int.tryParse(_languagePriorities![b.languageCode] ?? '999') ?? 999;
      return priorityA.compareTo(priorityB);
    });
    
    return sortedList;
  }

  static get language {
    Locale locale = Get.locale!;
    return languages.firstWhere((e) => e.locale == locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {'en_MY': enMY, 'cn_MY': zhCN, 'my_MY': myMY,};
}

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;
  final Locale locale;

  Language(
      {required this.id,
        required this.name,
        required this.flag,
        required this.languageCode,
        required this.locale});
}
