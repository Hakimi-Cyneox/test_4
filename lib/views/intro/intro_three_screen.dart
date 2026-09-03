import 'package:flutter/material.dart';
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

class IntroThreeScreen extends BaseView<IntroThreeController> {
  const IntroThreeScreen({super.key});

  @override
  Widget vBuilder() {
    final lang = LangTranslation().string;
    final List<Map<String, String>> categories = [
      {"title": lang.donation, "desc": lang.makeADifference, "icon": "favorite_border"},
      {"title": lang.education, "desc": lang.supportEducation, "icon": "school"},
      {"title": lang.healthcare, "desc": lang.careForCommunities, "icon": "health_and_safety"},
      {"title": lang.volunteer, "desc": lang.giveYourTime, "icon": "groups"},
      {"title": lang.events, "desc": lang.joinOurActivities, "icon": "calendar_today"},
      {"title": lang.membership, "desc": lang.bePartOfUs, "icon": "person_outline"},
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 4.5.w,),
            onPressed: () => Get.back(),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => _showLanguageBottomSheet(),
            child: Container(
              margin: EdgeInsets.only(right: 4.w, top: 1.h, bottom: 1.h),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.lightGray),
              ),
              child: Obx(() {
                final controller = Get.find<LanguageController>();
                final currentLang = controller.tempSelectedLanguage.value;
                return Row(
                  children: [
                    PngIcon(
                      icon: "entry/lang_${currentLang?.flag ?? 'english'}",
                      width: 5.w,
                      height: 5.w,
                      boxFit: BoxFit.contain,
                    ),
                    SizedBox(width: 1.w),
                    Text(currentLang?.languageCode.toUpperCase() ?? "EN",
                        style: TextStyles.mediumStyle(
                            color: AppColors.casualBlack,
                            size: AppDimension.textXS)),
                    SizedBox(width: 2.w),
                    const Icon(Icons.keyboard_arrow_down, size: 16,
                      color: AppColors.casualBlack,),
                  ],
                );
              }),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  lang.oneApp,
                  style: TextStyles.boldStyle(
                    size: AppDimension.text3XL,
                    color: AppColors.casualBlack,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  lang.manyWaysToHelp,
                  style: TextStyles.boldStyle(
                    size: AppDimension.text3XL,
                    color: AppColors.traditionalRed,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  lang.joinOurCommunity,
                  textAlign: TextAlign.center,
                  style: TextStyles.regularStyle(
                    size: AppDimension.textBase,
                    color: AppColors.matteGraphite,
                  ),
                ),
                SizedBox(height: 7.h),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          PngIconGen(
                            icon: _getIconData(categories[index]["icon"]!),
                            width: 12.w,
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            categories[index]["title"]!,
                            textAlign: TextAlign.center,
                            style: TextStyles.semiBold(
                              color: AppColors.casualBlack,
                                size: AppDimension.textBase),
                          ),
                          SizedBox(height: 0.8.h),
                          Text(
                            categories[index]["desc"]!,
                            textAlign: TextAlign.center,
                            style: TextStyles.regularStyle(
                              size: AppDimension.textXXS,
                              color: AppColors.lightGrayCamo,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                CommonButtonV3(
                  title: lang.getStarted,
                  color: AppColors.traditionalRed,
                  margin: EdgeInsets.only(bottom: 5.h),
                  onPressed: () {
                    Get.offAllNamed(RouteName.mainStartScreenRoute);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet() {
    final controller = Get.find<LanguageController>();
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.h),
            Text(
              LangTranslation().string.chooseYourLanguage,
              style: TextStyles.boldStyle(
                size: AppDimension.textLG,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 2.h),
            Obx(() => Column(
              children: controller.languageList.map((lang) {
                bool isSelected = controller.tempSelectedLanguage.value?.id == lang.id;
                return GestureDetector(
                  onTap: () {
                    controller.tempSelectedLanguage.value = lang;
                    controller.confirmLanguageSelection();
                    Get.back();
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
            SizedBox(height: 2.h),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  String _getIconData(String name) {
    switch (name) {
      case "favorite_border":
        return Assets.icons.entry.introDonation.path;
      case "school":
        return Assets.icons.entry.introEducation.path;
      case "health_and_safety":
        return Assets.icons.entry.introHealthcare.path;
      case "groups":
        return Assets.icons.entry.introVolunteer.path;
      case "calendar_today":
        return Assets.icons.entry.introEvents.path;
      case "person_outline":
        return Assets.icons.entry.introMembership.path;
      default:
        return Assets.icons.entry.introDonation.path;
    }
  }
}
