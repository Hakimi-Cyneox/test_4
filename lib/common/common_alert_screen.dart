import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_tab_bar_screen.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:yayasan_app/common/common_button.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';

//ignore: must_be_immutable
class CommonAlertScreen extends StatefulWidget {
  String? iconPath;
  String? title;
  String? message;
  String? buttonLabel;

  CommonAlertScreen({
    Key? key,
    this.iconPath,
    this.title,
    this.message,
    this.buttonLabel,
  }) : super(key: key);

  @override
  State<CommonAlertScreen> createState() => _CommonAlertScreen();
}

class _CommonAlertScreen extends State<CommonAlertScreen> {
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() {
    // setup data
    widget.iconPath = Get.parameters["iconImage"];
    widget.title = Get.parameters["iconImage"];
    widget.message = Get.parameters["iconImage"];
    widget.buttonLabel = Get.parameters["iconImage"];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
      },
      child: MaterialApp(
        home: Scaffold(
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: AppDimension.width_4w, right: AppDimension.width_4w, top: AppDimension.height_1h + AppDimension.mediaQueryTopPadding),
                        color: AppColors.commonAlertScreenBgColor,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                PngIcon(
                                  icon: "common_alert_app_label_icon",
                                  width: AppDimension.width_32w,
                                  height: AppDimension.height_5h,
                                ),
                              ],
                            ),
                            PngImage(
                              width: 230.sp,
                              image: widget.iconPath ?? "common_alert_bg_image",
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: AppDimension.width_4w, vertical: AppDimension.height_1h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.title ?? "Success",
                                    style: TextStyles.extraBoldStyle(size: 18.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: AppDimension.height_2h,
                                  ),
                                  Text(
                                    widget.message ?? "Success",
                                    style: TextStyles.mediumStyle(size: 12.sp, color: AppColors.spanishGray, ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     Text(
                //       widget.title ?? LangTranslation().string.successSignUpTitle,
                //       style: TextStyles.extraBoldStyle(size: 18.sp),
                //       textAlign: TextAlign.center,
                //     ),
                //     SizedBox(
                //       height: AppDimension.height_2h,
                //     ),
                //     Text(
                //       widget.message ?? LangTranslation().string.successSignUpDescription,
                //       style: TextStyles.mediumStyle(size: 12.sp, color: AppColors.greyTextColor, ),
                //       textAlign: TextAlign.center,
                //     ),
                //   ],
                // ),
                Container(
                  padding: AppDimension.defaultPadding,
                  child: CommonButton(
                    // todo: add required changes in the future
                    onPressed: () {
                      Get.offNamedUntil(RouteName.baseTabBarScreenRoute, (route) => false);
                      Get.find<BaseTabBarViewModel>().onItemTapped(2);
                    },
                    child: Text(
                      widget.buttonLabel ?? "Go to Home page",
                      style: TextStyles.semiBold(
                        size: 12.sp,
                        color: AppColors.white,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
