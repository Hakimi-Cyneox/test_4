import 'package:flutter/material.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/const.dart';
import 'package:get/get.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';

class TextStyles {
  static TextStyle? regularStyle({
    double? size,
    Color? color,
    double letterSpacing = 0,
    bool useEllipsis = false,
    TextDecoration? decoration,
    double? fontHeight,
    FontWeight? fontWeight = FontWeight.w400,
  }) {
      return TextStyle(
          fontFamily: FontStyleName().interRegular,
          color: color ?? AppColors.white,
          fontSize: size ?? AppDimension.fontSizeSP,
          letterSpacing: letterSpacing,
          decoration: decoration,
          fontWeight: fontWeight,
          height: fontHeight,
        overflow: useEllipsis ? TextOverflow.ellipsis : null,
      );
    }

  static TextStyle? semiBold({
    double? size,
    Color? color,
    double letterSpacing = 0,
    bool useEllipsis = false,
    TextDecoration? decoration,
    FontWeight? fontWeight = FontWeight.w600,
  }) {
      return TextStyle(
          fontFamily: FontStyleName().interSemiBold,
          color: color ?? AppColors.white,
          fontSize: size ?? AppDimension.fontSizeSP,
          letterSpacing: letterSpacing,
          decoration: decoration,
          fontWeight: fontWeight,
        overflow: useEllipsis ? TextOverflow.ellipsis : null,

      );
    }

  static TextStyle? boldStyle({
    double? size,
    Color? color,
    double letterSpacing = 0,
    bool useEllipsis = false,
    FontWeight? fontWeight = FontWeight.w700,
  }) {
      return TextStyle(
          fontFamily: FontStyleName().interBold,
          color: color ?? AppColors.white,
          fontSize: size ?? AppDimension.fontSizeSP,
          letterSpacing: letterSpacing,
        overflow: useEllipsis ? TextOverflow.ellipsis : null,
          fontWeight: fontWeight,);
  }

  static TextStyle? extraBoldStyle({
    double? size,
    Color? color,
    double letterSpacing = 0,
    bool isStatic = false,
    bool useEllipsis = false,
    FontWeight? fontWeight = FontWeight.w800,
  }) {
    if (isStatic) {
      return TextStyle(
          fontFamily: FontStyleName().defaultExtraBoldFont,
          color: color ?? AppColors.white,
          fontSize: size ?? AppDimension.fontSizeSP,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,);
    } else {
      return Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
        fontFamily: FontStyleName().defaultExtraBoldFont,
        fontSize: size ?? AppDimension.fontSizeSP,
        letterSpacing: letterSpacing,
        overflow: useEllipsis ? TextOverflow.ellipsis : null,
        fontWeight: fontWeight,
      );
    }
  }

  static TextStyle? mediumStyle({
    double? size,
    Color? color,
    double letterSpacing = 0,
    bool useEllipsis = false,
    FontWeight? fontWeight = FontWeight.w500,
    double? fontHeight,
  }) {
      return TextStyle(
        fontFamily: FontStyleName().defaultMediumFont,
        color: color ?? AppColors.white,
        fontSize: size ?? AppDimension.fontSizeSP,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        height: fontHeight,
        overflow: useEllipsis ? TextOverflow.ellipsis : null,
      );
  }

  static TextStyle? lightStyle({
    double? size,
    Color? color,
    double letterSpacing = 0,
    bool isStatic = false,
    bool useEllipsis = false,
    FontWeight? fontWeight = FontWeight.w300,
    double? fontHeight,
  }) {
    if (isStatic) {
      return TextStyle(
        fontFamily: FontStyleName().defaultLightFont,
        color: color ?? AppColors.white,
        fontSize: size ?? AppDimension.fontSizeSP,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        height: fontHeight,
      );
    } else {
      return Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
        fontFamily: FontStyleName().defaultLightFont,
        fontSize: size ?? AppDimension.fontSizeSP,
        letterSpacing: letterSpacing,
        overflow: useEllipsis ? TextOverflow.ellipsis : null,
        fontWeight: fontWeight,
        height: fontHeight,
      );
    }
  }

  static TextStyle? blackStyle({
    double? size,
    Color? color,
    double letterSpacing = 0,
    bool isStatic = false,
    bool useEllipsis = false,
    FontWeight? fontWeight = FontWeight.w800,
  }) {
    if (isStatic) {
      return TextStyle(
        fontFamily: FontStyleName().defaultBlackFont,
        color: color ?? AppColors.white,
        fontSize: size ?? AppDimension.fontSizeSP,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );
    } else {
      return Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
        fontFamily: FontStyleName().defaultMediumFont,
        fontSize: size ?? AppDimension.fontSizeSP,
        letterSpacing: letterSpacing,
        overflow: useEllipsis ? TextOverflow.ellipsis : null,
        fontWeight: fontWeight,
      );
    }
  }

}
