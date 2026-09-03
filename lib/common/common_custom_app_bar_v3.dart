import 'package:sizer/sizer.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:get/get.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/views/language/language_binding.dart';

import '../core/utils/color/app_colors.dart';

class CustomDefaultAppBarV3 extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final List<Widget>? actionList;
  final bool isBackable;
  final bool showChangeLanguageOption;
  final Function? onSearchKeyword;
  final Function? customBackFunction;
  final FocusNode? focusNode;
  final bool centerTitle;
  final Color? backgroundColor;
  final String? title;
  final String? subtitle;
  final bool isOrangeBackButton;

  const CustomDefaultAppBarV3({
    Key? key,
    this.actionList = const [],
    this.isBackable = true,
    this.customBackFunction,
    this.showChangeLanguageOption = false,
    this.onSearchKeyword,
    this.focusNode,
    this.centerTitle = false,
    this.backgroundColor,
    this.title,
    this.subtitle,
    this.isOrangeBackButton = false,
    Size? preferredSize,
  })  : preferredSize = preferredSize ?? const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.antiFlashWhite,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      centerTitle: centerTitle,
      leadingWidth: isBackable ? 80 : 0,
      automaticallyImplyLeading: !isBackable,
      leading: isBackable
          ? GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (customBackFunction != null) {
            customBackFunction!();
          } else {
            Get.back();
          }
        },
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.lightSilver2),
              ),
              child: Center(
                child: PngIcon(
                  icon: "back_arrow_icon_v3",
                  width: 3.2.w,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      )
          : Container(),
      title: title != null
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title!,
                style: TextStyles.semiBold(

                  size: 14.sp,
                  color: AppColors.deepMossGreen,
                ),
              ),
              if (subtitle != null)
                Padding(
                  padding: EdgeInsets.only(top: 0.2.h),
                  child: Text(
                    subtitle!,
                    style: TextStyles.regularStyle(
                        color: AppColors.shimmerHighLightGreyColor,
                        size: 9.2.sp),
                  ),
                ),
            ],
          )
          : null,
      actions: [
        if (showChangeLanguageOption)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // Get.toNamed(RouteName.languageScreenRoute);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.width_4w),
              child: Row(
                children: [
                  Obx(
                        () => Text(
                      Get.find<LanguageController>()
                          .selectedLangLocal
                          .value
                          .toUpperCase(),
                      style: TextStyles.regularStyle(size: AppDimension.sp9),
                    ),
                  ),
                  SizedBox(width: AppDimension.width_2w),
                  PngIcon(
                    icon: "login_language_arrow_icon",
                    width: AppDimension.width_2w,
                  ),
                ],
              ),
            ),
          ),
        if (actionList != null) ...actionList!,
      ],
    );
  }
}