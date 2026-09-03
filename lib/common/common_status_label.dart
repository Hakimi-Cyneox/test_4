import 'package:flutter/material.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';

class StatusLabel extends StatelessWidget{
  final String? label;
  final String? labelDisplay;
  final double? size;

  const StatusLabel({
    super.key,
    this.label,
    this.labelDisplay = '-',
    this.size,
  });

  ColorPicker colorPicker() {
    Color labelColor = AppColors.black;
    Color backgroundColor = AppColors.lightSilver;
    switch (label) {
      case 'waiting-approval':
      case 'pending':
        labelColor = AppColors.palatinateBlue;
        backgroundColor = AppColors.palatinateBlue.withAlpha(50);
        break;
      case 'in-progress':
        labelColor = AppColors.sandstorm;
        backgroundColor = AppColors.sandstorm.withAlpha(50);
        break;
      case 'approved':
        labelColor = AppColors.caribbeanGreen;
        backgroundColor = AppColors.caribbeanGreen.withAlpha(50);
        break;
      case 'rejected':
        labelColor = AppColors.folly;
        backgroundColor = AppColors.folly.withAlpha(50);
        break;
      case 'cancel':
        labelColor = AppColors.spanishGray;
        backgroundColor = AppColors.lightSilver;
        break;
      case 'completed':
        labelColor = AppColors.caribbeanGreen;
        backgroundColor = AppColors.mintCream;
        break;
      default:
        break;
    }
    return ColorPicker(labelColor: labelColor, backgroundColor: backgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimension.height_0ah, horizontal: AppDimension.width_1w),
      decoration: BoxDecoration(
        color: colorPicker().backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimension.width_1w),
        child: Text(
          labelDisplay ?? "-",
          style: TextStyles.mediumStyle(color: colorPicker().labelColor, size: size ?? AppDimension.sp9, ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}

class ColorPicker {
  Color labelColor = AppColors.black;
  Color backgroundColor = AppColors.lightSilver;

  ColorPicker({
    required this.labelColor,
    required this.backgroundColor,
  });
}
