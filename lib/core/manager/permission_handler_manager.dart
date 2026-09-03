import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/language/lang_translation.dart';

import '../../base/base_controller.dart';

class PermissionHandlerManager {
  PermissionHandlerManager._privateConstructor();

  static final PermissionHandlerManager instance = PermissionHandlerManager._privateConstructor();

  Future<bool> requestCameraPermission2() async {
    final bool serviceStatus = await Permission.camera.isGranted ;
    if (serviceStatus) {
      return true;
    } else {
      final status = await Permission.camera.request();
      if (status == PermissionStatus.granted) {
      } else if (status == PermissionStatus.denied) {
        await openAppSettings();
      } else if (status == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }
  }

  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    }

    final newStatus = await Permission.camera.request();

    if (newStatus.isGranted) {
      return true;
    } else {
      BaseCommonWidgets().customShowAlert(
        textConfirm: LangTranslation().string.ok,
        title: LangTranslation().string.permissionRequired,
        message: LangTranslation().string.pleaseAllowCameraPermission,
        onConfirmCallBack: () async {
          await openAppSettings();
        },
        onCancelCallBack: () {},
      );
    }

    return false;
  }


  Future<bool> requestStoragePermission2() async {
    final bool serviceStatus = await Permission.storage.isGranted ;
    if (serviceStatus) {
      return true;
    } else {
      final status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
      } else if (status == PermissionStatus.denied) {
        await openAppSettings();
      } else if (status == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }
  }

  Future<bool> requestStoragePermission() async {
    final bool serviceStatus = await Permission.storage.isGranted;
    if (serviceStatus) return true;

    final status = await Permission.storage.request();

    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.permanentlyDenied) {
      BaseCommonWidgets().customShowAlert(
        textConfirm: LangTranslation().string.ok,
        title: LangTranslation().string.permissionRequired,
        message: LangTranslation().string.pleaseAllowStoragePermission,
        onConfirmCallBack: () async {
          Get.back(); // close dialog
          await openAppSettings();
        },
        onCancelCallBack: () {
        },
      );
    } else if (status == PermissionStatus.denied) {
      // Optional: explain again if user denied but not permanent
      BaseCommonWidgets().customSnackBarShowAlert(
        title: LangTranslation().string.permissionRequired,
        message: LangTranslation().string.pleaseAllowStoragePermission,
      );
    }

    return false;
  }

  Future<bool> requestPhotoPermission2() async {
    final bool serviceStatus = await Permission.photos.isGranted ;
    if (serviceStatus) {
      return true;
    } else {
      final status = await Permission.photos.request();
      if (status == PermissionStatus.granted) {
      } else if (status == PermissionStatus.denied) {
        await openAppSettings();
      } else if (status == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }
  }

  Future<bool> requestPhotoPermission() async {
    final status = await Permission.photos.status;

    if (status.isGranted) {
      return true;
    }

    final newStatus = await Permission.photos.request();

    if (newStatus.isGranted) {
      return true;
    } else {
      BaseCommonWidgets().customShowAlert(
        textConfirm: LangTranslation().string.ok,
        title: LangTranslation().string.permissionRequired,
        message: LangTranslation().string.pleaseAllowPhotoPermission,
        onConfirmCallBack: () async {
          await openAppSettings();
        },
        onCancelCallBack: () {},
      );
    }

    return false;
  }

}