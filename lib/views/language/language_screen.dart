import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';
import 'package:yayasan_app/common/common_button_v3.dart';
import 'package:yayasan_app/common/common_custom_app_bar.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/localization/localization.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:yayasan_app/views/language/language_binding.dart';
import 'package:yayasan_app/core/routes/route_name.dart';

class LanguageScreen extends BaseView<LanguageController> {
  const LanguageScreen({super.key});

  @override
  Widget vBuilder() {
    return scrollViewBody(
      backgroundColor: AppColors.white,
      appbar: const CustomDefaultAppBar(
        isBackable: true,
        backgroundColor: Colors.transparent,
      ),
      children: [
        Expanded(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            children: [
              SizedBox(height: 4.h),
              Text(
                LangTranslation().string.chooseYourLanguage,
                style: TextStyles.boldStyle(
                  size: AppDimension.text2XL,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                LangTranslation().string.selectPreferredLanguage,
                style: TextStyles.regularStyle(
                  size: AppDimension.textSM,
                  color: AppColors.matteGraphite,
                ),
              ),
              SizedBox(height: 5.h),
              Obx(() => Column(
                    children: controller.languageList.map((lang) {
                      bool isSelected = controller.tempSelectedLanguage.value?.id == lang.id;
                      return GestureDetector(
                        onTap: () {
                          controller.tempSelectedLanguage.value = lang;
                          controller.confirmLanguageSelection();
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 2.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.5.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: isSelected ? AppColors.traditionalRed : AppColors.lightGray3.withOpacity(0.5),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              PngIcon(
                                icon: "entry/lang_${lang.flag}",
                                width: 7.w,
                                height: 7.w,
                                boxFit: BoxFit.contain,
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  lang.name,
                                  style: TextStyles.mediumStyle(
                                    size: AppDimension.textBase,
                                    color: AppColors.casualBlack,
                                  ),
                                ),
                              ),
                              Icon(
                                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                color: isSelected ? AppColors.traditionalRed : AppColors.lightGray3,
                                size: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )),
            ],
          ),
        ),
        CommonButtonV3(
          title: LangTranslation().string.getStarted,
          color: AppColors.traditionalRed,
          margin: EdgeInsets.symmetric(horizontal: AppDimension.static_18, vertical: 3.h),
          onPressed: () {
            Get.toNamed(RouteName.introScreenRoute);
          },
        ),
      ],
    );
  }
}
