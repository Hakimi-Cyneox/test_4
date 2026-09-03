import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/common/common_button.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/gen/assets.gen.dart';

import '../core/utils/color/app_colors.dart';
import 'common_bottom_sheet.dart';

Future<dynamic> successBottomSheetV2({
  required String title,
  required String message,
  required String buttonText,
  required VoidCallback onPressed,
  required bool showCloseIcon,
  bool? isDismissible,
  bool? enableDrag,
  bool? ignoreSafeArea,
  bool? preventBack,
}) {
  Widget content = Column(
    children: [
      Padding(
        padding: AppDimension.horizontal_3w,
        child: Column(
          children: [
            if (showCloseIcon == true)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    BaseCommonWidgets().hideBottomSheet();
                  },
                  child: PngIconGen(
                    icon: Assets.icons.closeIcon.path,
                    width: 4.w,
                    color: AppColors.chineseYellow,
                  ),
                ),
              ),
            SizedBox(height: 2.h),
            const PngIcon(
              icon: "success_v3_icon",
              width: 70,
              height: 70,
            ),
            SizedBox(height: AppDimension.height_2h),
            Text(
              title,
              style: TextStyles.boldStyle(
                size: AppDimension.sp14,

                color: AppColors.chineseBlack2,
              ),
            ),
            SizedBox(height: AppDimension.height_2h),
            Text(
              message,
              style: TextStyles.regularStyle(
                size: 10.4.sp,

                color: AppColors.chineseBlack2,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimension.height_2h),
          ],
        ),
      ),
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColors.britishRacingGreen,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyles.semiBold(

                color: AppColors.white,
                size: 10.5.sp,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  // Wrap in PopScope only if preventBack == true
  if (preventBack ?? false) {
    content = PopScope(
      canPop: false,
      child: content,
    );
  }

  return CommonBottomSheet().getXBottomSheet(
    isDismissible: isDismissible ?? false,
    enableDrag: enableDrag ?? false,
    ignoreSafeArea: ignoreSafeArea ?? false,
    content,
  );
}

Future<dynamic> failedBottomSheetV2({
  required String title,
  required String message,
  required String buttonText,
  required VoidCallback onPressed,
  required bool showCloseIcon,
  bool? isDismissible,
  bool? enableDrag,
  bool? ignoreSafeArea,
}) {
  return CommonBottomSheet().getXBottomSheet(
    isDismissible: isDismissible ?? false,
    enableDrag: enableDrag ?? true,
    ignoreSafeArea: ignoreSafeArea ?? false,
    Column(
      children: [
        Padding(
          padding: AppDimension.horizontal_3w,
          child: Column(
            children: [
              if (showCloseIcon == true)
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        BaseCommonWidgets().hideBottomSheet();
                      },
                      child: PngIconGen(
                        icon: Assets.icons.closeIcon.path,
                        width: 4.w,
                        color: AppColors.chineseYellow,),
                    )),
              SizedBox(height: 2.h,),
              //TODO if got animation
              // Lottie.asset(
              //     'assets/animation/success_animation.json',
              //     repeat: true,
              //     reverse: false,
              //     animate: true,
              //     width: AppDimension.width_28w,
              //     height: AppDimension.height_14h
              // ),
              const PngIcon(
                icon: "failed_icon_v3",
                width: 70,
                height: 70,
              ),
              SizedBox(
                height: AppDimension.height_2h,
              ),
              Text(
                title,
                style: TextStyles.boldStyle(size: AppDimension.sp14, color: AppColors.chineseBlack2),
              ),
              SizedBox(
                height: AppDimension.height_2h,
              ),
              Text(
                message,
                style: TextStyles.regularStyle(size: 10.4.sp, color: AppColors.chineseBlack2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimension.height_2h,),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        //   child: CommonButton(
        //     margin: EdgeInsets.zero,
        //     padding: EdgeInsets.zero,
        //     newStyleRounded: true,
        //     customButtonColor: AppColors.mustard,
        //     onPressed: onPressed,
        //     child: Text(buttonText,style: TextStyles.boldStyle(isStatic: false, size: 10.sp),),
        //   ),
        // ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onPressed,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((40)),
              color: AppColors.deepMossGreen,
            ),
            child: Center(
              child: Text(buttonText,
                style: TextStyles.semiBold(

                    color: AppColors.white,
                    size: 10.5.sp
                ),),
            ),
          ),
        ),
        // SizedBox(height: 2.h,)
      ],
    ),
  );
}
