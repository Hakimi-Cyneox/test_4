import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// @Deprecated(
//   'Will develop screen without using Sizer package and will not scale apps layout. There will be no support for this class anymore.',
// )
class AppDimension {

  // sp - font size
  static double get fontSizeSP => 12.sp;
  static double get fontSize_11sp => 11.sp;
  static double get sp32 => 32.sp;
  static double get sp36 => 36.sp;
  static double get sp50 => 36.5.sp; // ideal 37.5
  static double get sp28 => 28.sp;
  static double get sp1 => 1.sp;
  static double get sp2 => 2.sp;
  static double get sp8 => 8.sp;
  static double get sp9 => 9.sp;
  static double get sp4 => 4.sp;
  static double get sp3 => 3.sp;
  static double get sp5 => 5.sp;
  static double get sp6 => 6.sp;
  static double get sp7 => 7.sp;
  static double get sp16 => 16.sp;
  static double get sp18 => 18.sp;
  static double get sp10 => 10.sp;
  static double get sp11 => 11.sp;
  static double get sp12 => 12.sp;
  static double get sp14 => 14.sp;
  static double get sp20 => 20.sp;
  static double get sp22 => 22.sp;
  static double get sp23 => 23.sp;
  static double get sp24 => 24.sp;
  static double get sp26 => 26.sp;
  static double get sp40 => 40.sp;
  static double get sp80 => 80.sp;
  static double get sp190 => 190.sp;

  static double get textXXS => 9.sp;
  static double get textXS => 9.5.sp;
  static double get textSM => 10.sp;
  static double get textBase => 11.sp;
  static double get textLG => 14.sp;
  static double get text2XL => 16.sp;
  static double get text3XL => 20.sp;

  // h / w - padding and margin
  static double get height_0ah => 0.5.h;
  static double get height_1h => 1.h;
  static double get height_1ah => 1.5.h;
  static double get width_1w => 1.w;
  static double get width_1aw => 1.5.w;
  static double get height_2h => 2.h;
  static double get height_2ah => 2.5.h;
  static double get width_2w => 2.w;
  static double get height_3h => 3.h;
  static double get width_3w => 3.w;
  static double get height_4h => 4.h;
  static double get width_4w => 4.w;
  static double get height_5h => 5.h;
  static double get height_5ah => 5.5.h;
  static double get width_5w => 5.w;
  static double get height_6h => 6.h;
  static double get width_6w => 6.w;
  static double get height_7h => 7.h;
  static double get width_7w => 7.w;
  static double get height_8h => 8.h;
  static double get width_8w => 8.w;
  static double get width_10w => 10.w;
  static double get height_10h => 10.h;
  static double get height_12h => 12.h;
  static double get height_13h => 13.h;
  static double get height_14h => 14.h;
  static double get height_15h => 15.h;
  static double get height_16h => 16.h;
  static double get height_18h => 18.h;
  static double get height_20h => 20.h;
  static double get height_24h => 24.h;
  static double get height_26h => 26.h;
  static double get height_28h => 28.h;
  static double get height_30h => 30.h;
  static double get height_31h => 31.h;
  static double get height_35h => 35.h;
  static double get height_38h => 38.h;
  static double get height_50h => 50.h;
  static double get height_80h => 80.h;
  static double get height_90h => 90.h;
  static double get height_100h => 100.h;

  static double get width_12w => 12.w;
  static double get width_14w => 14.w;
  static double get width_16w => 16.w;
  static double get width_18w => 18.w;
  static double get width_20w => 20.w;
  static double get width_24w => 24.w;
  static double get width_26w => 26.w;
  static double get width_27w => 27.w;
  static double get width_28w => 28.w;
  static double get width_32w => 32.w;
  static double get width_30w => 30.w;
  static double get width_36w => 36.w;
  static double get width_38w => 38.w;
  static double get width_42w => 42.w;
  static double get width_46w => 46.w;
  static double get width_50w => 50.w;
  static double get width_55w => 55.w;
  static double get width_64w => 64.w;
  static double get width_80w => 80.w;
  static double get width_90w => 90.w;
  static double get width_100w => 100.w;

  static EdgeInsets get contentPadding => EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w);
  static EdgeInsets get defaultPadding => EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w);
  static EdgeInsets get horizontal_2w => EdgeInsets.symmetric(horizontal: 2.w);
  static EdgeInsets get horizontal_3w => EdgeInsets.symmetric(horizontal: 3.w);
  static EdgeInsets get horizontal_4w => EdgeInsets.symmetric(horizontal: 4.w);
  static EdgeInsets get vertical_2h => EdgeInsets.symmetric(horizontal: 2.h);
  static EdgeInsets get vertical_4h => EdgeInsets.symmetric(vertical: 4.h);
  static EdgeInsets get vertical_0aw => EdgeInsets.symmetric(vertical: 0.5.w);
  static EdgeInsets get vertical_1w => EdgeInsets.symmetric(vertical: 1.w);
  static EdgeInsets get vertical_2w => EdgeInsets.symmetric(vertical: 2.w);

  static EdgeInsets get customPadding_4h4w => EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w);
  static EdgeInsets get customPadding_2h6w => EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w);
  static EdgeInsets get customPadding_2h35w => EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.5.w);
  static EdgeInsets get customPadding_1h4w => EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w);

  static EdgeInsets get listViewHorizontalPadding => EdgeInsets.only(left: 2.w, right: 0.w);
  static EdgeInsets get minimumPadding => EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w);

  static double get mediaQueryBottomPadding => MediaQuery.of(Get.context!).padding.bottom;
  static double get mediaQueryTopPadding => MediaQuery.of(Get.context!).padding.top;

  static double get mediaQueryHeight => MediaQuery.of(Get.context!).size.height;
  static double get mediaQueryWidth => MediaQuery.of(Get.context!).size.width;
  static double get mediaQueryFifthHeight => MediaQuery.of(Get.context!).size.height / 5;

  // static dimension
  static double get static_2 => 2;
  static double get static_4 => 4;
  static double get static_6 => 6;
  static double get static_8 => 8;
  static double get static_10 => 10;
  static double get static_12 => 12;
  static double get static_14 => 14;
  static double get static_16 => 16;
  static double get static_18 => 18;
  static double get static_20 => 20;
  static double get static_35 => 35;
  static double get static_50 => 50;

}
