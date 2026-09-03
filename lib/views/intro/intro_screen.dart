import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:yayasan_app/views/intro/intro_binding.dart';

class IntroScreen extends BaseView<IntroController> {
  const IntroScreen({super.key});

  @override
  Widget vBuilder() {
    final PageController pageController = PageController();

    final List<Map<String, String>> introData = [
      {
        "title1": LangTranslation().string.togetherWeBuild,
        "title2": LangTranslation().string.brighterFutures,
        "desc": LangTranslation().string.weAreCommittedToSupportingChildren,
      },
      {
        "title1": LangTranslation().string.giveHopeThrough,
        "title2": LangTranslation().string.everyContribution,
        "desc": LangTranslation().string.yourDonationAndTime,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (index) => controller.currentPage.value = index,
            itemCount: introData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 50.h,
                    width: 100.w,
                    color: AppColors.lightGray,
                    child: const Center(child: Text("Image Placeholder")),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      children: [
                        Text(
                          introData[index]["title1"]!,
                          textAlign: TextAlign.center,
                          style: TextStyles.boldStyle(
                            size: AppDimension.text3XL,
                            color: AppColors.casualBlack,
                          ),
                        ),
                        SizedBox(height: 0.5.h,),
                        Text(
                          introData[index]["title2"]!,
                          textAlign: TextAlign.center,
                          style: TextStyles.boldStyle(
                            size: AppDimension.text3XL,
                            color: AppColors.traditionalRed,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          introData[index]["desc"]!,
                          textAlign: TextAlign.center,
                          style: TextStyles.regularStyle(
                            size: AppDimension.textBase,
                            color: AppColors.matteGraphite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 5.h,
            left: 8.w,
            right: 8.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => controller.currentPage.value > 0
                    ? _buildNavButton(
                  isBackButton: true,
                        icon: Icons.arrow_back_ios_new,
                        onTap: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      )
                    : SizedBox(width: 10.w)),
                Row(
                  children: List.generate(
                    introData.length,
                    (index) => Obx(() => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.currentPage.value == index
                                ? AppColors.traditionalRed
                                : AppColors.lightGray,
                          ),
                        )),
                  ),
                ),
                _buildNavButton(
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    if (controller.currentPage.value < introData.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      Get.toNamed(RouteName.introThreeScreenRoute);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton({required IconData icon, required VoidCallback onTap, bool isBackButton = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 10.w,
        height: 10.w,
        decoration: BoxDecoration(
          color: isBackButton? AppColors.white : AppColors.traditionalRed,
          border: Border.all(
            color: AppColors.traditionalRed,
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: isBackButton ? AppColors.traditionalRed : AppColors.white, size: 10.sp),
      ),
    );
  }
}
