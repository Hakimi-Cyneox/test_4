import 'dart:developer';
import 'dart:io';

import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/config/my_config.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:yayasan_app/views/dashboard/model/get_dashboard_response.dart';

/// --------------------------------------------
/// There are many amazing [Function]s in this class.
/// Especially in [Function]ality.
/// You can find and use on your Controller which is the Controller extends [BaseController].
class Utilities {

  static bool isStringNullOrEmpty(dynamic string) {
    return string == null || string == '' || string == 'null';
  }

  // convert error and success status to bool
  static bool stringStatusToBool(String status) {
    if (status == "success") {
      return true;
    } else {
      return false;
    }
  }

  static bool isTrueOrFalse(var value) {
    return value.toString() == '1' || value == true || value == 'true';
  }

  void logWhenDebug(String tag,String message){
    if (kDebugMode) log("$tag => ${message.toString()}", name: MyConfig.appName);
  }

  static bool hasValidUrl(String value) {
    String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /// TO SHOW THE LOG WHEN DEBUG MODE TRUE
  static showLogWhenDebug(String status,String e){
    if (kDebugMode) log("$status => ${e.toString()}", name: MyConfig.appName);
  }

  Color getStatusColor(String? status, {String? type}) {
    // Handle specific completed/closed with type
    if (type != null) {
      if ((status == "completed" || status == "closed") && type == "out") {
        return AppColors.deepCarminePink;
      } else if ((status == "completed" || status == "closed") && type == "in") {
        return AppColors.indiaGreen;
      } else {
        return AppColors.chineseBlack2;
      }
    }

    // General statuses (type-independent)
    if (status == "successful" || status == "completed" || status == "approved" || status == "closed") {
      return AppColors.indiaGreen2;
    } else if (status == "pending" || status == "partial-completed" || status == "processing") {
      return AppColors.princetonOrange;
    } else if (status == "cancelled" || status == "rejected") {
      return AppColors.deepCarminePink;
    } else {
      return AppColors.chineseBlack2;
    }
  }

}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstOfEach => split(" ").map((str) => str.capitalize).join(" ");
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}