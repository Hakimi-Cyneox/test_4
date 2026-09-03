import 'package:flutter/material.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/language/lang_translation.dart';

class CommonSearchBar extends StatelessWidget {
  final Function? onSearchKeyword;
  final FocusNode? focusNode;
  final VoidCallback? clearTextController;
  final TextEditingController? textEditingController;
  final String? suffixIcon;
  final VoidCallback? onIconTapped;
  final VoidCallback? onTextFieldTapped;
  final String? hintTextLabel;
  final Color? hintTextColor;
  final Color? searchIconColor;
  final BoxDecoration? boxDecoration;
  final bool isV3Style;

  const CommonSearchBar({
    Key? key,
    this.onSearchKeyword,
    this.focusNode,
    this.clearTextController,
    this.textEditingController,
    this.suffixIcon,
    this.onIconTapped,
    this.hintTextLabel,
    this.hintTextColor,
    this.searchIconColor,
    this.onTextFieldTapped,
    this.boxDecoration,
    this.isV3Style = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration ??
          BoxDecoration(
            color: AppColors.searchTextFieldBgColor,
            borderRadius: BorderRadius.circular(AppDimension.sp8),
      ),
      child: TextFormField(
        onTap: onTextFieldTapped,
        controller: textEditingController,
        focusNode: focusNode,
        textAlign: TextAlign.start,
        style: TextStyles.mediumStyle(size: AppDimension.sp10, color: isV3Style ? AppColors.black : null),
        onChanged: (value) {
          if (onSearchKeyword != null) {
            onSearchKeyword!(value);
          }
        },
        decoration: InputDecoration(
            isDense: true,
            contentPadding: AppDimension.defaultPadding,
            border: InputBorder.none,
            hintText: hintTextLabel ?? LangTranslation().string.search,
            hintStyle: TextStyles.regularStyle(
                color: hintTextColor ?? AppColors.white,

                size: AppDimension.sp10),
            prefixIcon: Container(
              padding: EdgeInsets.all(AppDimension.sp2),
              child: Icon(
                Icons.search,
                color: searchIconColor ?? AppColors.white,
                size: AppDimension.sp12,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.searchTextFieldBgColor,
                  width: AppDimension.sp1),
              borderRadius: BorderRadius.circular( isV3Style ? 40 : AppDimension.sp8),
            ),
            // suffix:  GestureDetector(
            //   onTap: () {
            //     if(clearTextController != null) {
            //       clearTextController!();
            //     }
            //   },
            //   child: PngIcon(
            //     icon: "clear_text_field_icon",
            //     width: AppDimension.width_4w,
            //   ),
            // ),
            suffixIconConstraints: BoxConstraints(
              minHeight: AppDimension.width_4w,
              minWidth: AppDimension.width_4w,
            ),
            suffixIcon: (textEditingController?.text.isNotEmpty ?? false) ?
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (clearTextController != null) {
                  clearTextController!();
                }
              },
              child: Container(
                padding: EdgeInsets.only(
                    right: AppDimension.width_4w,
                    top: AppDimension.height_1h,
                    bottom: AppDimension.height_1h),
                child: PngIcon(
                  icon: "close_icon",
                  width: AppDimension.width_3w,
                ),
              ),
            ): null),
      ),
    );
  }
}
