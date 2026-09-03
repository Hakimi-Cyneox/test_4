import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';
import 'package:yayasan_app/common/common_button_v3.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/gen/assets.gen.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:yayasan_app/views/intro/intro_binding.dart';
import 'package:yayasan_app/views/language/language_binding.dart';

class MainStartScreen extends BaseView<IntroThreeController> {
  const MainStartScreen({super.key});

  @override
  Widget vBuilder() {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print("object");
              },
                child: Row(
                  children: [
                    PngIconGen(icon: Assets.icons.entry.helpIcon.path),
                    SizedBox(width: 1.w,),
                    Text(LangTranslation().string.helpText,
                      style: TextStyles.regularStyle(
                        color: AppColors.casualBlack,
                        size: AppDimension.textBase
                      ),)
                  ],
                )),
          ),

        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.h,),
                PngImageGen(
                  image: Assets.images.mainStartHeaderImage.path,
                  width: 80.w,
                height: 25.h,),
                /// hq container
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
                  decoration: BoxDecoration(
                    color: AppColors.chablis,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("HQ branch",
                  style: TextStyles.semiBold(
                    size: AppDimension.textSM,
                    color: AppColors.traditionalRed
                  ),),
                ),
                const Spacer(),
                CommonButtonV3(
                  title: LangTranslation().string.login,
                  color: AppColors.traditionalRed,
                  margin: EdgeInsets.only(bottom: 2.h),
                  onPressed: () {
                    Get.toNamed(RouteName.loginScreenRoute);
                  },
                ),
                CommonButtonV3(
                  title: LangTranslation().string.createAccount,
                  textColor: AppColors.casualBlack,
                  color: AppColors.white,
                  borderColor: AppColors.rainbowGrey,
                  margin: EdgeInsets.only(bottom: 1.h),
                  onPressed: () {
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() =>
                          Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            activeColor: AppColors.traditionalRed,
                            checkColor: AppColors.white,
                            value: controller.isAgreeToTerm.value,
                            onChanged: (bool? value) {
                              controller.isAgreeToTerm.value = value!;
                            },
                          ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.sp, left: 4.sp),
                          child: DecoratedText(
                            text: LangTranslation().string.byContinuingIAgree,
                            style: TextStyles.regularStyle(
                              size: AppDimension.textXXS,
                              color: AppColors.casualBlack,
                            ),
                            rules: [
                              /// tnc
                              DecoratorRule(
                                regExp: RegExp(LangTranslation().string.termsAndConditions),
                                style: TextStyles.regularStyle(
                                  size: AppDimension.textXXS,
                                  color: AppColors.traditionalRed,
                                )!,
                                onTap: (value) async {
                                  // String url = StaticUrl.termsAndConditionsUrl;
                                  // await launchUrl(
                                  //   Uri.parse(url),
                                  //   mode: LaunchMode.inAppBrowserView,
                                  // );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h,),
              ],
            ),
          ),
        ),
      )
    );
  }
}