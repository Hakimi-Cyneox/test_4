import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:downloadsfolder/downloadsfolder.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/common/common_custom_app_bar_v3.dart';
import 'package:yayasan_app/common/common_success_bottomsheet.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/manager/permission_handler_manager.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../base/base_view_view_model.dart';

class FileDownloadManager {
  // ─── Singleton ────────────────────────────────────────────────
  static final FileDownloadManager instance = FileDownloadManager._internal();
  FileDownloadManager._internal();

  // ─── State ────────────────────────────────────────────────────
  // static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  // FlutterLocalNotificationsPlugin();
  static String filePath = "";
  static String fileName = "";
  static bool _isAndroidBelow29 = false;

  // ─── Public entry point ───────────────────────────────────────
  static Future<void> downloadFile(
      String? name,
      String? url, {
        bool isDownloadAll = false,
      }) async {
    try {
      // 1. Check & request permission
      final bool hasPermission = await _handlePermission();
      if (!hasPermission) return;

      // 2. Get save directory
      filePath = await _getFilePath();

      // 3. Generate file name
      fileName = _generateFileName(name);

      // 4. Download
      await FlutterDownloader.enqueue(
        url: url.toString(),
        savedDir: filePath,
        fileName: fileName,
        showNotification: !_isAndroidBelow29 && Platform.isAndroid,
        openFileFromNotification: !_isAndroidBelow29 && Platform.isAndroid,
      ).whenComplete(() {
        Get.showSnackbar(GetSnackBar(
          messageText: Text(
            "Download",
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 5),
          isDismissible: true,
          showProgressIndicator: true,
        ));
      });

    } catch (e) {
      Utilities.showLogWhenDebug('FileDownloadManager Error', e.toString());
      BaseCommonWidgets().customSnackBarShowAlert(
        title: LangTranslation().string.error,
        message: e.toString(),
      );
    }
  }

  // ─── Permission handler. Fixed threshold: 28 ──────────
  static Future<bool> _handlePermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      _isAndroidBelow29 = androidInfo.version.sdkInt <= 28;

      if (_isAndroidBelow29) {
        // Android 9 and below — need WRITE_EXTERNAL_STORAGE
        final granted = await PermissionHandlerManager.instance
            .requestStoragePermission();
        if (!granted) {
          _showPermissionDeniedSnackbar();
          return false;
        }
      }
      // Android 10+ — no permission needed
      return true;
    } else {
      // iOS — request storage/photo permission
      return await PermissionHandlerManager.instance.requestStoragePermission();
    }
  }

  // ─── Get file path ────────────────────────────────────────────
  static Future<String> _getFilePath() async {
    if (Platform.isAndroid) {
      // Directly use public Downloads folder
      final dir = Directory('/storage/emulated/0/Download');
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }
      return dir.path;
    } else {
      // iOS — visible in Files app
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    }
  }

  // ─── Generate file name ──────────
  static String _generateFileName(String? name) {
    final now = DateTime.now();
    return (!Utilities.isStringNullOrEmpty(name))
        ? "${name}_${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}"
        "_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}.pdf"
        : "document_${now.millisecondsSinceEpoch}.pdf";
  }

  // ─── Notifications ────────────────────────────────────────────
  // static void showNotification() async {
  //   if (_isAndroidBelow29 || Platform.isIOS) {
  //     final androidDetails = AndroidNotificationDetails(
  //       Random().nextInt(100000).toString(),
  //       Random().nextInt(100000).toString(),
  //       channelDescription: 'File download notifications',
  //       importance: Importance.high,
  //       priority: Priority.max,
  //       ticker: 'ticker',
  //       channelShowBadge: true,
  //       enableLights: true,
  //       playSound: true,
  //     );
  //     const iosDetails = DarwinNotificationDetails(
  //       presentAlert: true,
  //       presentBadge: true,
  //       presentSound: true,
  //     );
  //     final platform = NotificationDetails(
  //       android: androidDetails,
  //       iOS: iosDetails,
  //     );
  //     await _notificationsPlugin.show(
  //       Random().nextInt(100000),
  //       fileName,
  //       LangTranslation().string.success,
  //       platform,
  //     );
  //   }
  // }

  static void showSuccessBottomSheet() {
    BaseCommonWidgets().showSuccessSnackBar(
      title: LangTranslation().string.success,
      message: LangTranslation().string.success,
    );
  }

  static void showFailedBottomSheet() {
    final title = "Download Failed";
    final message = LangTranslation().string.errorMessage;
    Get.snackbar(
      title,
      message,
      titleText: Text(title, style: TextStyles.boldStyle()),
      messageText: Text(message, style: TextStyles.regularStyle()),
      backgroundColor: AppColors.brightGray,
      barBlur: 10.0,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.cancel, color: AppColors.pastelRed),
    );
  }

  static void hideSnackbar() {
    Get.closeCurrentSnackbar();
  }

  static void openPermissionSetting() async {
    await openAppSettings();
  }

  // ─── Private helpers ──────────────────────────────────────────
  static void _showPermissionDeniedSnackbar() {
    Get.snackbar(
      LangTranslation().string.error,
      'Storage permission is required to download files',
      snackPosition: SnackPosition.BOTTOM,
      mainButton: TextButton(
        onPressed: openPermissionSetting,
        child: const Text('Open Settings',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
