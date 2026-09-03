import 'package:sizer/sizer.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final String iconData;
  // final String label;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedBackground;
  final double dividerWidth;
  final Color dividerColor;
  final bool isExternal;
  final int? index;
  final bool showDotIndicator;

  const CustomBottomNavigationBarItem({super.key,
    required this.iconData,
    // required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedBackground,
    this.dividerWidth = 2.0,
    this.dividerColor = AppColors.chineseYellow,
    this.isExternal = false,
    this.index,
    this.showDotIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: AppDimension.height_7h,
          padding: EdgeInsets.only(left: AppDimension.width_1w, right: AppDimension.width_1w),
          color: isSelected ? AppColors.transparent : AppColors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (isSelected) ?
              Container(
                height: 3,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.deepMossGreen,
                ),

              ) : Container(
                height: 3,
              ),
              const Spacer(),
              PngIcon(
                icon: iconData,
                width: AppDimension.width_5w,
                height: AppDimension.height_3h,
                color: isSelected ? selectedColor : null,
              ),
              const Spacer(),
              const SizedBox(height: 4,)
            ],
          ),
        ),
        if (index == 1 && showDotIndicator == true)
        Positioned(
          top: 0,
            bottom: 25,
            left: 24,
            right: 0,
            child: Icon(Icons.circle, color: AppColors.textFieldErrorBorderColor, size: 2.5.w,)
            ),
      ],
    );
  }
}
