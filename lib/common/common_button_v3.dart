import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';

class CommonButtonV3 extends StatefulWidget {
  final String _title;
  final VoidCallback _callback;
  final EdgeInsets? _padding;
  final EdgeInsets? _margin;
  final Color? _color;
  final Color? _textColor;
  final Color? _borderColor;

  const CommonButtonV3({
    Key? key,
    required String title,
    required VoidCallback onPressed,
    EdgeInsets? padding,
    EdgeInsets? margin,
    Color? color,
    Color? textColor,
    Color? borderColor,
  })  :
        _title = title,
        _callback = onPressed,
        _padding = padding,
        _margin = margin,
        _color = color,
        _textColor = textColor,
        _borderColor = borderColor,
        super(key: key);

  @override
  State<CommonButtonV3> createState() => _CommonButtonV3State();
}

class _CommonButtonV3State extends State<CommonButtonV3> {

  @override
  Widget build(context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget._callback,
      child: Container(
        width: double.infinity,
        padding: widget._padding ?? EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 4.w),
        margin: widget._margin ?? EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((40)),
          color: widget._color ?? AppColors.traditionalRed,
          border: Border.all(color: widget._borderColor ?? widget._color ?? AppColors.traditionalRed,)
        ),
        child: Center(
          child: Text( widget._title,
            style: TextStyles.mediumStyle(
                color: widget._textColor ?? AppColors.white,
                size: AppDimension.textBase
            ),),
        ),
      ),
    );
  }
}