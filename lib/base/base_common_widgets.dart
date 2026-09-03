import 'package:sizer/sizer.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/common/common_button.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'base_controller.dart';

/// --------------------------------------------
/// There are many amazing [Function]s in this class.
/// Especially in user interactions.
/// You can find and use on your Controller which is the Controller extends [BaseController].
class BaseCommonWidgets implements _CommonWidgetsInterface {
  @override
  void showSnackBar({String title = "", String message = ""}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      barBlur: 8.0,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void showErrorSnackBar({String title = "", String message = ""}) {
    Get.snackbar(title, message,
        backgroundColor: const Color(0x8AD32F2F),
        barBlur: 10.0,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.error, color: Colors.white));
  }

  @override
  void showSuccessSnackBar({String title = "", String message = ""}) {
    Get.snackbar(title, message,
        backgroundColor: AppColors.white,
        barBlur: 10.0,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
        duration: const Duration(seconds: 2),
        icon: Icon(Icons.check_circle, color: AppColors.borderColor));
  }

  @override
  void showSimpleSnackBar({String message = ""}) {
    Get.showSnackbar(GetSnackBar(
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  void showSimpleErrorSnackBar({String message = ""}) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.red,
      icon: const Icon(Icons.error, color: Colors.white),
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
      duration: const Duration(seconds: 3),
    ));
  }

  @override
  void showSimpleSuccessSnackBar({String message = ""}) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: Colors.green,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
      duration: const Duration(seconds: 3),
    ));
  }

  @override
  void hideDialog() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  @override
  void hideBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }

  @override
  void showLoadingDialog() {
    Get.dialog(
        Material(
          color: Colors.black26,
          child: Center(
            child: GifLoading(
              width: AppDimension.width_24w,
            ),
            // Container(
            //     padding: const EdgeInsets.all(10.0),
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10.0)),
            //         child: const CircularProgressIndicator(),
            //     ),
            // ),
          ),
        ),
        barrierDismissible: false,
        name: "Loading Dialog");
  }

  @override
  void showAlert(
      {String? title,
      EdgeInsets? titlePadding,
      TextStyle? titleStyle,
      Color? titleTextColor,
      String? customIcon,
      double? customIconSize,
      Widget? content,
      EdgeInsets? contentPadding,
      VoidCallback? onConfirm,
      VoidCallback? onCancel,
      VoidCallback? onCustom,
      Color? cancelTextColor,
      Color? confirmTextColor,
      String? textConfirm,
      String? textCancel,
      String? textCustom,
      Widget? confirm,
      Widget? cancel,
      Widget? custom,
      Color? backgroundColor,
      bool barrierDismissible = true,
      Color? buttonColor,
      String middleText = "",
      Widget? customMiddleText,
      TextStyle? middleTextStyle,
      double radius = 20.0,
      List<Widget>? actions,
      PopInvokedCallback? onWillPop,
      bool isSuccess = false,
      bool? isComingSoon,
      bool showCloseButton = false,
      bool isInfo = false,
      }) {
    var leanCancel = onCancel != null || textCancel != null;
    var leanConfirm = onConfirm != null || textConfirm != null;
    actions ??= [];
    if (cancel != null) {
      actions.add(cancel);
    } else {
      if (leanCancel) {
        actions.add(
          Flexible(
            child:
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                onCancel?.call();
                Get.back();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 4.w),
                margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((40)),
                    color: AppColors.transparent,
                    border: Border.all(color: AppColors.deepMossGreen)
                ),
                child: Center(
                  child: Text(
                    textCancel ?? LangTranslation().string.cancel,
                    style: TextStyles.mediumStyle(
                      color: cancelTextColor ?? AppColors.deepMossGreen,
                      size: 10.2.sp,
                    ),
                  ),
                ),
              ),
            ),
            // CommonButton(
            //   margin : EdgeInsets.zero,
            //   padding : EdgeInsets.zero,
            //   // customRounded: true,
            //   topLeft: 40,
            //   topRight: 40,
            //   bottomRight: 40,
            //   bottomLeft: 40,
            //   // newStyleRounded: true,
            //   customButtonColor: AppColors.transparent,
            //   // margin: EdgeInsets.only(top: AppDimension.height_2h),
            //   colorBackground: [AppColors.transparent, AppColors.transparent],
            //   // colorBorder: AppColors.borderColor,
            //   transparentBackground: true,
            //   colorBorder: AppColors.deepMossGreen,
            //   onPressed: () async {
            //     onCancel?.call();
            //     Get.back();
            //   },
            //   child: Text(
            //     textCancel ?? LangTranslation().string.cancel,
            //     style: TextStyles.poppinsMedium(
            //       color: cancelTextColor ?? AppColors.deepMossGreen,
            //
            //       size: 10.2.sp,
            //     ),
            //   ),
            // ),
          ),
        );
      }
    }

    if((cancel != null && confirm != null) || (leanCancel && leanConfirm) || (cancel != null && leanConfirm) || (leanCancel && confirm != null)) {
      actions.add(
        SizedBox(
          width: AppDimension.width_3w,
        ),
      );
    }

    if (confirm != null) {
      actions.add(confirm);
    } else {
      if (leanConfirm) {
        actions.add(
          Flexible(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                BaseCommonWidgets().hideDialog();
                onConfirm?.call();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 4.w),
                margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((40)),
                    color: AppColors.deepMossGreen,
                    // border: Border.all(color: AppColors.deepMossGreen)
                ),
                child: Center(
                  child: Text(
                    textConfirm ?? LangTranslation().string.ok,
                    style: TextStyles.semiBold(
                      color: cancelTextColor ?? AppColors.white,
                      size: 10.2.sp,
                    ),
                  ),
                ),
              ),
            ),
            // CommonButton(
            //   margin : EdgeInsets.zero,
            //   padding : EdgeInsets.zero,
            //   // customRounded: true,
            //   topLeft: 40,
            //   topRight: 40,
            //   bottomRight: 40,
            //   bottomLeft: 40,
            //   // newStyleRounded: true,
            //   customButtonColor: AppColors.deepMossGreen,
            //   // margin: EdgeInsets.only(top: AppDimension.height_2h),
            //   colorBackground: [AppColors.transparent, AppColors.transparent],
            //   // colorBorder: AppColors.borderColor,
            //   transparentBackground: false,
            //   colorBorder: AppColors.transparent,
            //   child: Text(
            //     textConfirm ?? LangTranslation().string.ok,
            //     style: TextStyles.poppinsSemiBold(
            //       color: cancelTextColor ?? AppColors.white,
            //
            //       size: 10.2.sp,
            //     ),
            //   ),
            //   onPressed: () async {
            //     BaseCommonWidgets().hideDialog();
            //     onConfirm?.call();
            //   },
            // ),
          ),
        );
      }
    }

    Get.dialog(
      PopScope(
        canPop: (onWillPop) != null ? false : true,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          onWillPop;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              backgroundColor: backgroundColor ?? AppColors.white,
              titlePadding: EdgeInsets.only(
                  top: AppDimension.height_3h,
                  left: AppDimension.width_4w,
                  right: AppDimension.width_4w),
              contentPadding: EdgeInsets.symmetric(
                  vertical: AppDimension.height_3h,
                  horizontal: AppDimension.width_4w,
              ),
              // title: Text(
              //   title,
              //   textAlign: TextAlign.left,
              //   style: titleStyle ?? TextStyles.semiBold(size: AppDimension.sp14, color: titleTextColor, isStatic: titleTextColor != null ? true: false),
              // ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isComingSoon ?? false)
                      Container()
                    else if (customIcon != null)
                      PngIcon(icon: customIcon, width: (customIconSize != null) ? customIconSize : AppDimension.width_24w, )
                    else
                      PngIcon(icon: (isSuccess)? "success_icon": (isInfo)? 'pop_up_info_icon': "warning_icon_v3", width: AppDimension.width_16w,),
                    SizedBox(height: AppDimension.height_1h,),
                    if (title != null)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: AppDimension.height_1h),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: titleStyle ?? TextStyles.semiBold(size: 12.5.sp, color: titleTextColor ?? AppColors.chineseBlack2,),
                        ),
                      ),
                    if(customMiddleText == null)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                          child: Text(
                            (isComingSoon ?? false) ? LangTranslation().string.comingSoon : middleText,
                            textAlign: TextAlign.center,
                            style: middleTextStyle ?? TextStyles.regularStyle(color: AppColors.chineseBlack2, size: 10.2.sp) ,
                          ),
                        )
                    else
                      customMiddleText,
                    // if(content != null)
                    //   SizedBox(height: AppDimension.height_1h,),
                    // if(content != null)
                    //   content,
                    if(actions.isNotEmpty)
                      SizedBox(height: AppDimension.height_2h),
                      Row(children: actions),
                    // Wrap(
                    //   alignment: WrapAlignment.center,
                    //   spacing: 8,
                    //   runSpacing: 8,
                    //   children: actions,
                    // )
                  ],
                ),
              ),
            ),
            if (showCloseButton)
              Column(
                children: [
                  SizedBox(height: AppDimension.height_3h,),
                  GestureDetector(
                    onTap: () {
                      BaseCommonWidgets().hideDialog();
                    },
                    child: PngIcon(icon: 'entertainment_close_icon', width: AppDimension.width_14w,),
                  ),
                ],
              ),
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
    // Get.defaultDialog(
    //     title : title,
    //     titlePadding: titlePadding,
    //     titleStyle : titleStyle,
    //     content : content,
    //     contentPadding: contentPadding,
    //     onConfirm : onConfirm,
    //     onCancel : onCancel,
    //     onCustom : onCustom,
    //     cancelTextColor : cancelTextColor,
    //     confirmTextColor : confirmTextColor,
    //     textConfirm : textConfirm,
    //     textCancel : textCancel,
    //     textCustom : textCustom,
    //     confirm : confirm,
    //     cancel : cancel,
    //     custom : custom,
    //     backgroundColor : backgroundColor,
    //     barrierDismissible : barrierDismissible,
    //     buttonColor : buttonColor,
    //     middleText : middleText,
    //     middleTextStyle : middleTextStyle,
    //     radius : radius,
    //     actions : actions,
    //     onWillPop : onWillPop
    // );
  }

  @override
  void showAlertV3(
      {String? title,
        EdgeInsets? titlePadding,
        TextStyle? titleStyle,
        Color? titleTextColor,
        String? customIcon,
        Widget? content,
        EdgeInsets? contentPadding,
        VoidCallback? onConfirm,
        VoidCallback? onCancel,
        VoidCallback? onCustom,
        Color? cancelTextColor,
        Color? confirmTextColor,
        String? textConfirm,
        String? textCancel,
        String? textCustom,
        Widget? confirm,
        Widget? cancel,
        Widget? custom,
        Color? backgroundColor,
        bool barrierDismissible = true,
        Color? buttonColor,
        String middleText = "",
        Widget? customMiddleText,
        TextStyle? middleTextStyle,
        double radius = 20.0,
        List<Widget>? actions,
        PopInvokedCallback? onWillPop,
        bool isSuccess = false,
        bool? isComingSoon,
        bool showCloseButton = false,
        bool isInfo = false,
      }) {
    var leanCancel = onCancel != null || textCancel != null;
    var leanConfirm = onConfirm != null || textConfirm != null;
    actions ??= [];
    if (cancel != null) {
      actions.add(cancel);
    } else {
      if (leanCancel) {
        actions.add(
          Flexible(
            child: CommonButton(
              newStyleRounded: true,
              customButtonColor: AppColors.mustard,
              margin: EdgeInsets.only(top: AppDimension.height_2h),
              colorBackground: [AppColors.transparent, AppColors.transparent],
              // colorBorder: AppColors.borderColor,
              onPressed: () async {
                onCancel?.call();
                Get.back();
              },
              child: Text(
                textCancel ?? LangTranslation().string.cancel,
                style: TextStyles.semiBold(
                  color: cancelTextColor ?? AppColors.black,
                  size: AppDimension.sp10,
                ),
              ),
            ),
          ),
        );
      }
    }

    if((cancel != null && confirm != null) || (leanCancel && leanConfirm) || (cancel != null && leanConfirm) || (leanCancel && confirm != null)) {
      actions.add(
        SizedBox(
          width: AppDimension.width_3w,
        ),
      );
    }

    if (confirm != null) {
      actions.add(confirm);
    } else {
      if (leanConfirm) {
        actions.add(
          Flexible(
            child:
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                BaseCommonWidgets().hideDialog();
                onConfirm?.call();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 4.w),
                margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((40)),
                  color: AppColors.britishRacingGreen,
                  // border: Border.all(color: AppColors.deepMossGreen)
                ),
                child: Center(
                  child: Text(
                    textConfirm ?? LangTranslation().string.ok,
                    style: TextStyles.semiBold(
                      color: cancelTextColor ?? AppColors.white,
                      size: 10.2.sp,
                    ),
                  ),
                ),
              ),
            ),
            // CommonButton(
            //   newStyleRounded: true,
            //   customButtonColor: AppColors.mustard,
            //   margin: EdgeInsets.only(top: AppDimension.height_2h),
            //   child: Text(
            //     textConfirm ?? LangTranslation().string.ok,
            //     style: TextStyles.semiBold(
            //       color: cancelTextColor ?? AppColors.black,
            //
            //       size: AppDimension.sp10,
            //     ),
            //   ),
            //   onPressed: () async {
            //     BaseCommonWidgets().hideDialog();
            //     onConfirm?.call();
            //   },
            // ),
          ),
        );
      }
    }

    Get.dialog(
      PopScope(
        canPop: (onWillPop) != null ? false : true,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          onWillPop;
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlertDialog(
              backgroundColor: backgroundColor ?? AppColors.onyx,
              titlePadding: EdgeInsets.only(
                  top: AppDimension.height_3h,
                  left: AppDimension.width_4w,
                  right: AppDimension.width_4w),
              contentPadding: EdgeInsets.symmetric(
                vertical: AppDimension.height_3h,
                horizontal: AppDimension.width_4w,
              ),
              // title: Text(
              //   title,
              //   textAlign: TextAlign.left,
              //   style: titleStyle ?? TextStyles.semiBold(size: AppDimension.sp14, color: titleTextColor, isStatic: titleTextColor != null ? true: false),
              // ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isComingSoon ?? false)
                      Container()
                    else if (customIcon != null)
                      PngIcon(icon: customIcon, width: AppDimension.width_24w,)
                    else
                      PngIcon(icon: (isSuccess)? "success_icon": (isInfo)? 'pop_up_info_icon': "warning_icon_v3", width: AppDimension.width_18w,),
                    if (title != null)
                      SizedBox(height: AppDimension.height_3h,),
                    if (title != null)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: AppDimension.height_1h),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: titleStyle ?? TextStyles.extraBoldStyle(size: AppDimension.sp12, color: titleTextColor ?? AppColors.white, ),
                        ),
                      ),
                    if(customMiddleText == null)
                      Text(
                        (isComingSoon ?? false) ? LangTranslation().string.comingSoon : middleText,
                        textAlign: TextAlign.center,
                        style: middleTextStyle ?? TextStyles.regularStyle(color: AppColors.spanishGray, ),
                      )
                    else
                      customMiddleText,
                    // if(content != null)
                    //   SizedBox(height: AppDimension.height_1h,),
                    // if(content != null)
                    //   content,
                    if(actions.isNotEmpty)
                      SizedBox(height: AppDimension.height_2h),
                    Row(children: actions),
                    // Wrap(
                    //   alignment: WrapAlignment.center,
                    //   spacing: 8,
                    //   runSpacing: 8,
                    //   children: actions,
                    // )
                  ],
                ),
              ),
            ),
            if (showCloseButton)
              Column(
                children: [
                  SizedBox(height: AppDimension.height_3h,),
                  GestureDetector(
                    onTap: () {
                      BaseCommonWidgets().hideDialog();
                    },
                    child: PngIcon(icon: 'entertainment_close_icon', width: AppDimension.width_14w,),
                  ),
                ],
              ),
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
    // Get.defaultDialog(
    //     title : title,
    //     titlePadding: titlePadding,
    //     titleStyle : titleStyle,
    //     content : content,
    //     contentPadding: contentPadding,
    //     onConfirm : onConfirm,
    //     onCancel : onCancel,
    //     onCustom : onCustom,
    //     cancelTextColor : cancelTextColor,
    //     confirmTextColor : confirmTextColor,
    //     textConfirm : textConfirm,
    //     textCancel : textCancel,
    //     textCustom : textCustom,
    //     confirm : confirm,
    //     cancel : cancel,
    //     custom : custom,
    //     backgroundColor : backgroundColor,
    //     barrierDismissible : barrierDismissible,
    //     buttonColor : buttonColor,
    //     middleText : middleText,
    //     middleTextStyle : middleTextStyle,
    //     radius : radius,
    //     actions : actions,
    //     onWillPop : onWillPop
    // );
  }

  @override
  void customShowAlert({
    String? title,
    String? message,
    Widget? customMessage,
    String? customIcon,
    double? customIconSize,
    Color? titleTextColor,
    String? textConfirm,
    String? textCancel,
    VoidCallback? onConfirmCallBack,
    VoidCallback? onCancelCallBack,
    TextStyle? titleStyle,
    TextStyle? middleTextStyle,
    Widget? content,
    var errorMessages,
    bool isSuccess = false,
    PopInvokedCallback? onWillPop,
    bool showCloseButton = false,
    bool isInfo = false,
    bool barrierDismissible = false,
  }) {
    // handle the error message here
    var errorMsg = "";
    if (errorMessages != null) {
      if (errorMessages is String) {
        errorMsg = errorMessages.toString();
      } else if (errorMessages is Map) {
        if (!Utilities.isStringNullOrEmpty(errorMessages.values.first)) {
          if (errorMessages.values.first is List) {
            /// display the first error message from the error list
            errorMsg = errorMessages.values.first.first.toString();
          } else {
            errorMsg = errorMessages.values.first.toString();
          }
        }
      }
    }

    return BaseCommonWidgets().showAlert(
      title: title ?? LangTranslation().string.error,
      titleTextColor: titleTextColor,
      titlePadding: EdgeInsets.only(
          top: AppDimension.height_3h,
          left: AppDimension.width_4w,
          right: AppDimension.width_4w),
      contentPadding: EdgeInsets.only(
          top: AppDimension.height_1h,
          bottom: AppDimension.height_3h,
          left: AppDimension.width_4w,
          right: AppDimension.width_4w),
      titleStyle: titleStyle,
      // middleText: message ?? LangTranslation().string.errorMessage,
      middleText: message ?? errorMsg,
      middleTextStyle: middleTextStyle,
      barrierDismissible: barrierDismissible,
      buttonColor: AppColors.commonButtonColor,
      onConfirm: onConfirmCallBack,
      onCancel: onCancelCallBack,
      confirmTextColor: AppColors.white,
      content: content,
      isSuccess: isSuccess,
      customMiddleText: customMessage,
      customIcon: customIcon,
      customIconSize: customIconSize,
      textConfirm: textConfirm,
      textCancel: textCancel,
      onWillPop: onWillPop,
      showCloseButton: showCloseButton,
      isInfo: isInfo
    );
  }

  @override
  void customSnackBarShowAlert({
    String? title,
    String? message,
    TextStyle? titleStyle,
    TextStyle? middleTextStyle,
    Widget? content,
    var errorMessages,
    bool? isComingSoon,
  }) {
    // handle the error message here
    var errorMsg = "";
    if (errorMessages != null) {
      if (errorMessages is String) {
        errorMsg = errorMessages.toString();
      } else if (errorMessages is Map) {
        if (!Utilities.isStringNullOrEmpty(errorMessages.values.first)) {
          if (errorMessages.values.first is List) {
            /// display the first error message from the error list
            errorMsg = errorMessages.values.first.first.toString();
          } else {
            errorMsg = errorMessages.values.first.toString();
          }
        }

        // errorMessages.forEach((dynamicKey, list) {
        //   if (list is List) {
        //     /// display all the error from the error list
        //     // errorMsg = "$errorMsg\n• ${list.length == 1 ? list.join("") : list.join("\n•")}";
        //     /// display the first error message from the error list
        //     errorMsg = list.first;
        //   } else {
        //     errorMsg = "$errorMsg\n• $dynamicKey : $list";
        //   }
        // });

      }
    }

    // start timer to close GetX dialog
    var countDownTimer = StopWatchTimer();
    countDownTimer = StopWatchTimer(
        mode: StopWatchMode.countDown,
        presetMillisecond: StopWatchTimer.getMilliSecFromSecond(3),
        onChangeRawSecond: (value) {
          // print("initialTime $value");
          if (value == 0) {
            hideDialog();
            // stop and reset timer
            countDownTimer.onStopTimer();
            countDownTimer.onResetTimer();
          }
        });
    // start timer
    countDownTimer.onStartTimer();

    return BaseCommonWidgets().showAlert(
      title: title,
      backgroundColor: AppColors.white,
      titleStyle: TextStyles.regularStyle(color:AppColors.chineseBlack2, ),
      middleText: message ?? errorMsg,
      middleTextStyle: TextStyles.regularStyle(color:AppColors.chineseBlack2, ),
      barrierDismissible: true,
      isComingSoon: isComingSoon,
    );
  }

  @override
  void customSnackBarShowAlertV3({
    String? title,
    String? message,
    TextStyle? titleStyle,
    TextStyle? middleTextStyle,
    Widget? content,
    var errorMessages,
    bool? isComingSoon,
  }) {
    // handle the error message here
    var errorMsg = "";
    if (errorMessages != null) {
      if (errorMessages is String) {
        errorMsg = errorMessages.toString();
      } else if (errorMessages is Map) {
        if (!Utilities.isStringNullOrEmpty(errorMessages.values.first)) {
          if (errorMessages.values.first is List) {
            /// display the first error message from the error list
            errorMsg = errorMessages.values.first.first.toString();
          } else {
            errorMsg = errorMessages.values.first.toString();
          }
        }

        // errorMessages.forEach((dynamicKey, list) {
        //   if (list is List) {
        //     /// display all the error from the error list
        //     // errorMsg = "$errorMsg\n• ${list.length == 1 ? list.join("") : list.join("\n•")}";
        //     /// display the first error message from the error list
        //     errorMsg = list.first;
        //   } else {
        //     errorMsg = "$errorMsg\n• $dynamicKey : $list";
        //   }
        // });

      }
    }

    // start timer to close GetX dialog
    var countDownTimer = StopWatchTimer();
    countDownTimer = StopWatchTimer(
        mode: StopWatchMode.countDown,
        presetMillisecond: StopWatchTimer.getMilliSecFromSecond(3),
        onChangeRawSecond: (value) {
          // print("initialTime $value");
          if (value == 0) {
            hideDialog();
            // stop and reset timer
            countDownTimer.onStopTimer();
            countDownTimer.onResetTimer();
          }
        });
    // start timer
    countDownTimer.onStartTimer();

    return BaseCommonWidgets().showAlertV3(
      title: title,
      backgroundColor: AppColors.white,
      titleStyle: TextStyles.regularStyle(color:AppColors.chineseBlack2, ),
      middleText: message ?? errorMsg,
      middleTextStyle: TextStyles.regularStyle(color:AppColors.chineseBlack2, ),
      barrierDismissible: true,
      isComingSoon: isComingSoon,
    );
  }

  @override
  void showDataDisplayPopUp(
      {String? titleIcon,
        String? title,
        EdgeInsets? titlePadding,
        TextStyle? titleStyle,
        Color? titleTextColor,
        Widget? content,
        EdgeInsets? contentPadding,
        VoidCallback? onConfirm,
        VoidCallback? onCancel,
        VoidCallback? onCustom,
        Color? cancelTextColor,
        Color? confirmTextColor,
        String? textConfirm,
        String? textCancel,
        String? textCustom,
        Widget? confirm,
        Widget? cancel,
        Widget? custom,
        Color? backgroundColor,
        bool barrierDismissible = true,
        Color? buttonColor,
        String middleText = "",
        TextStyle? middleTextStyle,
        double radius = 20.0,
        List<Widget>? actions,
        PopInvokedCallback? onWillPop,
        bool isSuccess = false,
      }) {
    var leanCancel = onCancel != null || textCancel != null;
    var leanConfirm = onConfirm != null || textConfirm != null;
    actions ??= [];
    if (cancel != null) {
      actions.add(cancel);
    } else {
      if (leanCancel) {
        actions.add(
          Flexible(
            child: CommonButton(
              margin: EdgeInsets.only(top: AppDimension.height_2h),
              colorBackground: [AppColors.transparent, AppColors.transparent],
              onPressed: () async {
                onCancel?.call();
                Get.back();
              },
              child: Text(
                textCancel ?? LangTranslation().string.cancel,
                style: TextStyles.semiBold(
                  color: cancelTextColor ?? AppColors.commonCancelButtonColor,

                  size: AppDimension.sp10,
                ),
              ),
            ),
          ),
        );
      }
    }
    if (confirm != null) {
      actions.add(confirm);
    } else {
      if (leanConfirm) {
        actions.add(
          Flexible(
            child: CommonButton(
              margin: EdgeInsets.only(top: AppDimension.height_2h),
              child: Text(
                textConfirm ?? LangTranslation().string.ok,
                style: TextStyles.semiBold(
                  color: cancelTextColor ?? AppColors.black,

                  size: AppDimension.sp10,
                ),
              ),
              onPressed: () async {
                BaseCommonWidgets().hideDialog();
                onConfirm?.call();
              },
            ),
          ),
        );
      }
    }

    Get.dialog(
      PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          onWillPop;
        },
        child: AlertDialog(
          backgroundColor: backgroundColor ?? AppColors.white,
          titlePadding: EdgeInsets.only(
              top: AppDimension.height_3h,
              left: AppDimension.width_4w,
              right: AppDimension.width_4w),
          contentPadding: EdgeInsets.symmetric(
            vertical: AppDimension.height_2h,
            horizontal: AppDimension.width_4w,
          ),
          // title: Text(
          //   title,
          //   textAlign: TextAlign.left,
          //   style: titleStyle ?? TextStyles.semiBold(size: AppDimension.sp14, color: titleTextColor, isStatic: titleTextColor != null ? true: false),
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if(titleIcon != null)
                  PngIcon(icon: titleIcon, width: AppDimension.width_24w,),
                if (title != null)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppDimension.height_1h),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: titleStyle ?? TextStyles.extraBoldStyle(size: AppDimension.sp12, color: titleTextColor, isStatic: titleTextColor != null ? true: false),
                    ),
                  ),
                Text(
                  middleText,
                  textAlign: TextAlign.center,
                  style: middleTextStyle ?? TextStyles.regularStyle(size: AppDimension.sp10, color: AppColors.yellowOrange, ),
                ),
                if(content != null)
                  content,
                Row(children: actions),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  @override
  void showCopiedSnackBar() {
    var countDownTimer = StopWatchTimer();
    countDownTimer = StopWatchTimer(
        mode: StopWatchMode.countDown,
        presetMillisecond: StopWatchTimer.getMilliSecFromSecond(2),
        onChangeRawSecond: (value) {
          // print("initialTime $value");
          if (value == 0) {
            hideDialog();
            // stop and reset timer
            countDownTimer.onStopTimer();
            countDownTimer.onResetTimer();
          }
        });
    countDownTimer.onStartTimer();
    Get.dialog(
     AlertDialog(
       elevation: 0,
       backgroundColor: AppColors.black.withOpacity(0.8),
       insetPadding: EdgeInsets.symmetric(horizontal: AppDimension.width_28w),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.all(
           Radius.circular(AppDimension.sp4),
         ),
       ),
       content: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const PngIcon(icon: 'copied_success_icon'),
                  // const SizedBox(width: 10,),
                  Flexible(child: Text(LangTranslation().string.copied, style: TextStyles.regularStyle(color: AppColors.white,  size: AppDimension.sp11),)),
                ],
              ),
            ],
         ),
       ),
     ),
   );
  }

}

abstract class _CommonWidgetsInterface {
  void showSnackBar({String title = "", String message = ""});

  void showErrorSnackBar({String title = "", String message = ""});

  void showSuccessSnackBar({String title = "", String message = ""});

  void showSimpleSnackBar({String message = ""});

  void showSimpleErrorSnackBar({String message = ""});

  void showSimpleSuccessSnackBar({String message = ""});

  void showLoadingDialog();

  void showAlert(
      {String title = "Alert",
      TextStyle titleStyle,
      Color titleTextColor,
      Widget content,
      VoidCallback onConfirm,
      VoidCallback onCancel,
      VoidCallback onCustom,
      Color cancelTextColor,
      Color confirmTextColor,
      String textConfirm,
      String textCancel,
      String textCustom,
      Widget confirm,
      Widget cancel,
      Widget custom,
      Color backgroundColor,
      bool barrierDismissible = true,
      Color buttonColor,
      String middleText = "",
      TextStyle middleTextStyle,
      double radius = 20.0,
      //   ThemeData themeData,
      List<Widget> actions,

      // onWillPop Scope
      PopInvokedCallback onWillPop});

  void hideDialog();

  void hideBottomSheet();

  // use this dialog to return showAlert
  void customShowAlert({
    String? title,
    TextStyle? titleStyle,
    Color? titleTextColor,
    String? message,
    TextStyle? middleTextStyle,
    VoidCallback? onConfirmCallBack,
    VoidCallback? onCancelCallBack,
    Widget? content,
    bool isSuccess,
  });

  // use this dialog to return showAlert
  void customSnackBarShowAlert();

  /// [Usage]
  /// 1. use this widget to show pop up with data display
  void showDataDisplayPopUp();

  void showCopiedSnackBar();

}
