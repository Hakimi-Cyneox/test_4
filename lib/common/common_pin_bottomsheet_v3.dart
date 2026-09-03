import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_numpad/simple_numpad.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/common/common_bottom_sheet.dart';
import 'package:yayasan_app/common/common_pin_code.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/language/lang_translation.dart';

class PinBottomSheet extends StatelessWidget {
  final int pinLength;
  final VoidCallback? onCompleted;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onKeyPressed;
  final RxBool hasError;
  final StreamController<ErrorAnimationType> errorController;
  final TextEditingController pinController;

  const PinBottomSheet({
    Key? key,
    required this.pinLength,
    required this.onCompleted,
    required this.onChanged,
    required this.hasError,
    required this.errorController,
    required this.pinController,
    this.onKeyPressed, // 👈 optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBottomSheet().getXBottomSheetV2(
      isDismissible: true,
      enableDrag: true,
      backgroundColor: AppColors.white,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimension.height_2h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              "Pin",
              style: TextStyles.mediumStyle(size: 11.sp),
            ),
          ),
          SizedBox(height: AppDimension.height_2h),
          CommonPinCode(
            controller: pinController,
            readOnly: true,
            errorController: errorController,
            obscureText: true,
            autoFocus: true,
            onChanged: (value) {
              onChanged?.call(value);
              if (value.length < pinLength) {
                hasError.value = false;
              }
            },
            onCallBack: () {
              Get.back();
              onCompleted?.call();
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Divider(
              color: AppColors.brightGray,
              thickness: 1,
              height: 1.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 1.h),
            child: SimpleNumpad(
              buttonWidth: 100.w,
              buttonHeight: 28.h,
              gridSpacing: 0,
              buttonBorderRadius: 8,
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              textStyle: TextStyles.mediumStyle(size: 20.sp)!,
              useBackspace: true,
              removeBlankButton: false,
              onPressed: (str) => onKeyPressed?.call(str), // 👈 callback here
            ),
          ),
          SizedBox(height: AppDimension.height_2h),
          Obx(
                () => (hasError.value)
                ? Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                  horizontal: AppDimension.width_5w),
              width: double.infinity,
              child: Text(
                "Error",
                textAlign: TextAlign.start,
                style: TextStyles.regularStyle(
                  color: AppColors.borderErrorColor,

                ),
              ),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}