import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/common/common_button.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:get/get.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/gen/assets.gen.dart';
import 'package:yayasan_app/language/lang_translation.dart';

import 'common_image_display.dart';
import 'common_text_style.dart';

class CommonBottomSheet extends GetxController {

  // getX bottomSheet
  getXBottomSheet(
      Widget? child, {
        MainAxisSize defaultMainAxisSize = MainAxisSize.min,
        bool isDismissible = false,
        bool enableDrag = true,
        bool showCloseIcon = false,
        String? title,
        bool ignoreSafeArea = false,
        Function()? onCloseBottomSheet
      }) {
    return Get.bottomSheet(
      isScrollControlled: true,
      ignoreSafeArea: ignoreSafeArea,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          // padding: EdgeInsets.only(left: AppDimension.width_4w, right: AppDimension.width_4w, bottom: 0, top: AppDimension.height_1h),
          padding: EdgeInsets.only(bottom: AppDimension.height_1h, top: AppDimension.height_2h),
          child: Column(
            mainAxisSize: defaultMainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (title != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          )
                      ),

                      width: AppDimension.width_1w,
                      height: AppDimension.height_4h,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: AppDimension.horizontal_3w,
                        child: Text(title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.boldStyle(size: AppDimension.sp12,
                              useEllipsis: true,color: AppColors.white),),
                      ),
                    ),
                    if(showCloseIcon)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          BaseCommonWidgets().hideBottomSheet();
                        },
                        child: PngIcon(
                          padding: EdgeInsets.symmetric(horizontal: AppDimension.width_5w, vertical: AppDimension.width_3w),
                          width: AppDimension.width_4w,
                          icon: ("close_icon"),
                        ),
                      ),
                  ],
                )
              else if(showCloseIcon)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        BaseCommonWidgets().hideBottomSheet();
                      },
                      child: PngIcon(
                        padding: EdgeInsets.symmetric(horizontal: AppDimension.width_5w, vertical: AppDimension.width_3w),
                        width: AppDimension.width_4w,
                        icon: ("close_icon"),
                      ),
                    ),
                  ],
                ),
              // child widget here

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       behavior: HitTestBehavior.translucent,
              //       onTap: () {
              //         BaseCommonWidgets().hideBottomSheet();
              //       },
              //       child:  Container(
              //         height: 5,
              //         width: 35,
              //         // margin: const EdgeInsets.symmetric(vertical: 12),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(120),
              //           color: AppColors.white
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: AppDimension.height_2h),
              // child widget here
              Flexible(
                child: SingleChildScrollView(
                  // physics: const ClampingScrollPhysics(),
                  child: (child != null)
                      ? Container(
                        padding: EdgeInsets.symmetric(horizontal: AppDimension.width_4w),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(child: child),
                              SizedBox(height: AppDimension.mediaQueryBottomPadding,)
                            ],
                          ),
                      )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getXBottomSheetV2(Widget? child, {MainAxisSize defaultMainAxisSize = MainAxisSize.min, bool isDismissible = false, bool enableDrag = true,bool showCloseIcon = false, String? title, Function()? onCloseBottomSheet, Color? backgroundColor, TextStyle? titleStyle, bool titleTopPadding = false, bool? showTopBar = true}) {
    return Get.bottomSheet(
      isScrollControlled: true,
      ignoreSafeArea: false,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.kLightIconColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          // padding: EdgeInsets.only(left: AppDimension.width_4w, right: AppDimension.width_4w, bottom: 0, top: AppDimension.height_1h),
          padding: EdgeInsets.only(bottom: AppDimension.height_1h, top: AppDimension.height_2h),
          child: Column(
            mainAxisSize: defaultMainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (showTopBar == true)
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.davyGrey2,
                  ),

                ),
              ),
              if (title != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.transparent,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          )
                      ),

                      width: AppDimension.width_1w,
                      height: AppDimension.height_4h,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: titleTopPadding ? EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w) : AppDimension.horizontal_4w,
                        child: Text(title.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: titleStyle ??
                          TextStyles.boldStyle(size: AppDimension.sp12,
                              useEllipsis: true,color: AppColors.philippineSilver2),),
                      ),
                    ),
                    if(showCloseIcon)
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          BaseCommonWidgets().hideBottomSheet();
                        },
                        child: PngIcon(
                          padding: EdgeInsets.symmetric(horizontal: AppDimension.width_5w, vertical: AppDimension.width_3w),
                          width: AppDimension.width_4w,
                          icon: ("close_icon"),
                        ),
                      ),
                  ],
                )
              else if(showCloseIcon)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        BaseCommonWidgets().hideBottomSheet();
                      },
                      child: PngIcon(
                        padding: EdgeInsets.symmetric(horizontal: AppDimension.width_5w, vertical: AppDimension.width_3w),
                        width: AppDimension.width_4w,
                        icon: ("close_icon"),
                      ),
                    ),
                  ],
                ),
              Flexible(
                child: SingleChildScrollView(
                  // physics: const ClampingScrollPhysics(),
                  child: (child != null)
                      ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: child),
                          SizedBox(height: AppDimension.mediaQueryBottomPadding,)
                        ],
                      )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    ).whenComplete(() {
      if (onCloseBottomSheet != null) {
        onCloseBottomSheet();
      }
    });
  }

  getXPinBottomSheet(
      Widget? child, {
        MainAxisSize defaultMainAxisSize = MainAxisSize.min,
        bool isDismissible = false,
        bool enableDrag = true,
        Function()? onCloseBottomSheet,
        Color? backgroundColor,
        bool showMessage = true,
        }) {
    return Get.bottomSheet(
      isScrollControlled: true,
      ignoreSafeArea: false,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.kLightIconColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          // padding: EdgeInsets.only(left: AppDimension.width_4w, right: AppDimension.width_4w, bottom: 0, top: AppDimension.height_1h),
          padding: EdgeInsets.only(bottom: AppDimension.height_1h,),
          child: Column(
            mainAxisSize: defaultMainAxisSize,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (showMessage == true)
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: AppColors.cultured2,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PngIconGen(icon: Assets.icons.warningPinV3Icon.path, width: 4.5.w,),
                      SizedBox(width: 2.w,),
                    ],
                  ),
                ),
              ),

              Flexible(
                child: SingleChildScrollView(
                  // physics: const ClampingScrollPhysics(),
                  child: (child != null)
                      ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: child),
                      SizedBox(height: AppDimension.mediaQueryBottomPadding,)
                    ],
                  )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    ).whenComplete(() {
      if (onCloseBottomSheet != null) {
        onCloseBottomSheet();
      }
    });
  }

  static void customBottomSheet({
    required String title,
    required String message,
    required String iconPath,
    required String buttonName,
    String? button2Name = "",
    bool isNewStyle = false,
    required VoidCallback onButtonPressed,
    VoidCallback? onSecondButtonPressed,
  }) {
    Get.bottomSheet(
      buildBottomSheet(title,message,iconPath,buttonName,button2Name, isNewStyle, onButtonPressed,onSecondButtonPressed),
      elevation: 10.0,
      backgroundColor: AppColors.transparent,
    );
  }

  static Widget buildBottomSheet(
      String title,
      String message,
      String iconPath,
      String buttonName,
      String? button2Name,
      bool? isNewStyle,
      VoidCallback onButtonPressed,
      VoidCallback? onSecondButtonPressed,
      ) {
    return SafeArea(
      child: Container(
        padding: AppDimension.contentPadding,
        decoration: const BoxDecoration(
          color: AppColors.charlestonGreen,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppDimension.height_2h),
            PngIcon(icon: iconPath,width: AppDimension.width_20w,height: AppDimension.height_10h,),
            SizedBox(height: AppDimension.height_2h),
            Text(
              title,
              style: TextStyles.boldStyle(size: AppDimension.sp12, ),
            ),
            SizedBox(height: AppDimension.height_1h),
            Text(
              message,
              style: TextStyles.regularStyle(size: AppDimension.sp10, color: AppColors.white.withOpacity(0.6)),
            ),
            SizedBox(height: AppDimension.height_5h),
            if(button2Name != "")...[
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CommonButton(
                  newStyleRounded: isNewStyle,
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                  width: AppDimension.width_36w,
                    customButtonColor: AppColors.onyx,
                    child: Text(
                      buttonName,
                      style: TextStyles.semiBold(size: AppDimension.sp10, color: AppColors.white),
                    ),
                    onPressed: () async {
                      onButtonPressed();
                    }
                ),
                SizedBox(width: 5.w,),
                CommonButton(
                    newStyleRounded: isNewStyle,
                  customButtonColor: isNewStyle == true ? AppColors.mustard : null,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                    width: AppDimension.width_36w,
                    child: Text(
                      button2Name!,
                      style: TextStyles.semiBold(
                        size: AppDimension.sp10,
                      ),
                    ),
                    onPressed: () async {
                      onSecondButtonPressed!();
                    }
                )
              ],)
            ] else ... [
              CommonButton(
                  child: Text(
                    buttonName,
                    style: TextStyles.semiBold(
                      size: AppDimension.sp10,
                    ),
                  ),
                  onPressed: () async {
                    onButtonPressed();
                  }
              )

            ],

          ],
        ),
      ),
    );
  }

  static void newBottomSheet({
    required String title,
    required String message,
    required String iconPath,
    required String buttonName,
    String? button2Name = "",
    bool isNewStyle = false,
    required VoidCallback onButtonPressed,
    VoidCallback? onSecondButtonPressed,
    Widget? customWidget,
    Color? customButtonColor,
    Color? customTextColor,
  }) {
    Get.bottomSheet(
      buildNewBottomSheet(title,message,iconPath,buttonName,button2Name, isNewStyle, onButtonPressed,onSecondButtonPressed, customWidget, customButtonColor, customTextColor),
      // elevation: 10.0,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
    );
  }

  static Widget buildNewBottomSheet(
      String title,
      String message,
      String iconPath,
      String buttonName,
      String? button2Name,
      bool? isNewStyle,
      VoidCallback onButtonPressed,
      VoidCallback? onSecondButtonPressed,
      Widget? customWidget,
      Color? customButtonColor,
      Color? customTextColor,
      ) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          padding: AppDimension.contentPadding,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppDimension.height_2h),
              PngIcon(icon: iconPath,width: AppDimension.width_20w,height: AppDimension.height_10h,),
              SizedBox(height: AppDimension.height_2h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.boldStyle(size: AppDimension.sp12,  color: AppColors.chineseBlack2),
              ),
              SizedBox(height: AppDimension.height_1h),
              Text(
                message,
                style: TextStyles.regularStyle(size: AppDimension.sp10, color: AppColors.chineseBlack2.withOpacity(0.6)),
              ),
              if (customWidget != null)
                customWidget,
              SizedBox(height: (customWidget != null) ?AppDimension.height_2h : AppDimension.height_5h),
              if(button2Name != "")...[
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButton(
                        newStyleRounded: isNewStyle,
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        width: AppDimension.width_36w,
                        customButtonColor: AppColors.onyx,
                        child: Text(
                          buttonName,
                          style: TextStyles.semiBold(size: AppDimension.sp10, color: AppColors.white),
                        ),
                        onPressed: () async {
                          onButtonPressed();
                        }
                    ),
                    SizedBox(width: 5.w,),
                    CommonButton(
                        newStyleRounded: isNewStyle,
                        customButtonColor: isNewStyle == true ? AppColors.mustard : null,
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        width: AppDimension.width_36w,
                        child: Text(
                          button2Name!,
                          style: TextStyles.semiBold(
                            size: AppDimension.sp10,
                          ),
                        ),
                        onPressed: () async {
                          onSecondButtonPressed!();
                        }
                    )
                  ],)
              ] else ... [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    onButtonPressed();
                  },
                  child: Container(
                    width: 40.w,
                    padding: EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 4.w),
                    // margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((40)),
                      color: AppColors.cultured2,
                    ),
                    child: Text(buttonName,
                      textAlign: TextAlign.center,
                      style: TextStyles.semiBold(
                          color: AppColors.britishRacingGreen,
                          size: 10.4.sp
                      ),),
                  ),
                ),
                // CommonButton(
                //     width: isNewStyle == true ? 40.w :  null,
                //     newStyleRounded: isNewStyle,
                //     padding: EdgeInsets.symmetric(vertical: 1.h),
                //     customButtonColor: customButtonColor,
                //     child: Text(
                //       buttonName,
                //       style: TextStyles.semiBold(
                //         size: AppDimension.sp10,
                //
                //         color: customTextColor
                //       ),
                //     ),
                //     onPressed: () async {
                //       onButtonPressed();
                //     }
                // )

              ],
              SizedBox(height: AppDimension.mediaQueryBottomPadding,)
            ],
          ),
        ),
      ),
    );
  }
}
