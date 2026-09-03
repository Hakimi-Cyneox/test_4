import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/theme_setting/theme_provider.dart';
import 'package:yayasan_app/common/common_error_label_display.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:yayasan_app/core/utils/const.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/gen/assets.gen.dart';
import 'package:yayasan_app/language/lang_translation.dart';

import '../core/utils/validation/validation_item.dart';

class CommonLoginTextField extends StatefulWidget {
  const CommonLoginTextField({
    Key? key,
    this.controller,
    this.validationItem,
    this.hintText = "",
    this.hintTextStyle,
    this.isObscure = false,
    this.suffixIconWidget,
    this.clearTextField = false,
    this.onValidation,
    this.title = "",
    this.onlyNumber = false,
    this.isPhone = false,
    this.showErrorValidation = false,
    this.inputFormatters,
    this.maxLength = 1,
    this.maxLines = 1,
    // this.focusNodeNext,
    this.showAsterisk = false,
    this.prefixIcon,
    this.prefixText,
    this.prefixDropdown = true,
    this.focusNode,
    this.enableTextField = true,
    this.callback,
    this.clearTextController,
    this.titleDescription,
    this.boxDecoration,
    this.obscureIconColor,
    this.isCurrencyPrefix = false,
    this.showDropdownIcon = false,
    this.currencySuffix,
    this.onEditingComplete,
    this.showCounterText = true,
    this.fillColor,
    this.fontColor,
    this.isTextAlignRight = false,
    this.keyBoardType,
    this.isV2Style = false,
    this.isV3Style = false,
    this.isLightInput = false,
    this.isYellowInput = false,
    this.prefixIconColor,
    this.showSearchSuffix = false,
    this.textInputAction,
    this.isPin = false,
    this.borderColor,
    this.prefixIconWidth,
    this.counterStyle,
    this.showMyrSuffix = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final ValidationItem? validationItem;
  final bool isObscure;
  final Widget? suffixIconWidget;
  final bool clearTextField;
  final bool showAsterisk;
  final String? title;
  final String? titleDescription;
  final Function? onValidation;
  final bool onlyNumber;
  final bool isPhone;
  final bool showErrorValidation;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLength;
  final int maxLines;

  // final FocusNode? focusNodeNext;
  final String? prefixIcon;
  final bool isCurrencyPrefix;
  final String? prefixText;
  final bool prefixDropdown;
  final FocusNode? focusNode;
  final bool enableTextField;
  final VoidCallback? callback;
  final VoidCallback? clearTextController;
  final BoxDecoration? boxDecoration;
  final Color? obscureIconColor;
  final bool showDropdownIcon;
  final String? currencySuffix;
  final VoidCallback? onEditingComplete;
  final bool showCounterText;
  final Color? fillColor;
  final Color? fontColor;
  final bool isTextAlignRight;
  final TextInputType? keyBoardType;
  final bool isV2Style;
  final bool isV3Style;
  final bool isLightInput;
  final bool isYellowInput;
  final Color? prefixIconColor;
  final bool showSearchSuffix;
  final TextInputAction? textInputAction;
  final bool isPin;
  final Color? borderColor;
  final double? prefixIconWidth;
  final TextStyle? counterStyle;
  final bool showMyrSuffix;

  @override
  State<StatefulWidget> createState() => _CommonTextFieldWidgetState();
}

class _CommonTextFieldWidgetState extends State<CommonLoginTextField> {
  bool _obscured = false;

  @override
  void initState() {
    super.initState();
    _obscured = widget.isObscure;
  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  TextInputAction getInputAction() {
    if (widget.textInputAction != null) return widget.textInputAction!;
    if (widget.focusNode != null) return TextInputAction.next;
    return widget.maxLines > 1 ? TextInputAction.newline : TextInputAction.done;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != null
              ? Container(
            margin: EdgeInsets.fromLTRB(
              0,
              AppDimension.height_1h,
              0,
              AppDimension.height_1h,
            ),
            child: RichText(
              text: TextSpan(
                  text: widget.title ?? "",
                  style: widget.isV3Style ?
                  TextStyles.mediumStyle(size: AppDimension.sp10,color: AppColors.black,) :
                  TextStyles.semiBold(size: AppDimension.sp10,color: AppColors.white,),
                  children: [
                    TextSpan(
                      // text: '*',
                      text: widget.showAsterisk ? "*" : "",
                      style: TextStyles.mediumStyle(
                          color: AppColors.asteriskRed,

                          size: AppDimension.sp10),
                    ),
                    // extra desc beside title
                    TextSpan(
                      text: (widget.titleDescription != null)
                          ? widget.titleDescription
                          : "",
                      style: TextStyles.regularStyle(
                          color: AppColors.textFieldHintGreyColor,

                          size: AppDimension.sp10),
                    ),
                  ]),
              textAlign: TextAlign.start,
            ),
          )
              : Container(),
          Container(
            decoration: widget.boxDecoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular( widget.isV3Style ? 40 : AppDimension.sp8),
                ),
            child: TextFormField(
              textAlign: widget.isTextAlignRight ? TextAlign.right : TextAlign.start,
              enabled: widget.enableTextField,
              focusNode: widget.focusNode,
              maxLines: widget.maxLines,
              // maximum line
              maxLength: widget.maxLength == 1 ? null : widget.maxLength,
              // length of the words
              textInputAction: getInputAction(),
              style: (widget.isPin) ?
              TextStyles.mediumStyle(size: AppDimension.sp10,color: (widget.isYellowInput)? AppColors.mustard :  widget.fontColor ?? AppColors.white)?.copyWith(letterSpacing: 16)
                  :
              TextStyles.mediumStyle(size: AppDimension.sp10,color: (widget.isYellowInput)? AppColors.mustard :  widget.fontColor ?? AppColors.white),
              inputFormatters: widget.inputFormatters,
              // inputFormatters: inputNumber == true ? currencyMode == true ? [FilteringTextInputFormatter.digitsOnly, CurrencyInputFormatter()] : [FilteringTextInputFormatter.digitsOnly] : null,
              obscureText: _obscured,
              controller: widget.controller,
              cursorColor: widget.isV3Style ? AppColors.deepMossGreen :  AppColors.goldenPoppy,
              keyboardType: widget.keyBoardType ??
                  (widget.isPhone
                      ? const TextInputType.numberWithOptions(signed: true, decimal: true)
                      : widget.onlyNumber
                      ? TextInputType.number
                      : widget.maxLines > 1
                      ? TextInputType.multiline
                      : TextInputType.text),

              onChanged: (value) {
                if (widget.onValidation != null) {
                  widget.onValidation!();
                }
              },
              onFieldSubmitted: (value) {
                if (widget.onEditingComplete != null) {
                  widget.onEditingComplete!();
                }
              },
              decoration: InputDecoration(
                counterStyle: widget.counterStyle ??  TextStyles.regularStyle(color: Colors.white, size: AppDimension.sp10),
                counterText: widget.showCounterText? null : "",
                filled: true,
                fillColor: widget.fillColor ?? AppColors.transparent,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: widget.borderColor ?? AppColors.lightGray3
                  ),
                  borderRadius: BorderRadius.circular(widget.isV3Style ? 40 : AppDimension.sp8),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(widget.isV3Style ? 40 : AppDimension.sp8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.deepMossGreen
                  ),
                  borderRadius: BorderRadius.circular(widget.isV3Style ? 40 : AppDimension.sp8),
                ),
                prefixIcon: (widget.isPhone)
                    ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: widget.callback,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 5.w,
                        right: AppDimension.width_2w),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // (widget.isPhone) ?
                          if (!Utilities.isStringNullOrEmpty(widget.prefixIcon))
                            SizedBox(
                              width: 7.w,
                              child: Image.asset(
                                  "icons/flags/png/${widget.prefixIcon}.png",
                                  package: 'country_icons'),
                            ),
                          SizedBox(
                            width: AppDimension.width_1w,
                          ),
                          SizedBox(
                            // margin: const EdgeInsets.only(top: 1),
                            child: Text(
                              widget.prefixText ?? "",
                              style: TextStyles.mediumStyle(
                                  size: AppDimension.sp10,
                                  color: widget.isLightInput ? AppColors.white : widget.isYellowInput ? AppColors.mustard : widget.enableTextField == false ? AppColors.philippineGray : AppColors.black),
                            ),
                          ),
                          SizedBox(
                            width: AppDimension.width_1w,
                          ),
                          SizedBox(
                              child: (widget.prefixDropdown)
                                  ?
                              Icon(
                                  Icons.arrow_drop_down,
                                  // color: AppColors.white.withOpacity(0.66)
                                  color: widget.isLightInput ? AppColors.white : widget.isYellowInput ? AppColors.mustard: widget.enableTextField == false ? AppColors.philippineGray : AppColors.black)
                                  : Container()
                          ),
                          VerticalDivider(
                            color: AppColors.lightGray3,
                            thickness: 1,
                            indent: AppDimension.sp8,
                            endIndent: AppDimension.sp8,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : (widget.prefixIcon != null && !widget.isPhone)
                    ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: widget.callback,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 5.w,
                        right: 3.w),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PngIcon(icon: widget.prefixIcon!, width: widget.prefixIconWidth ?? 20, color: widget.prefixIconColor,),
                        ],
                      ),
                    ),
                  ),
                )
                    : null,
                suffixIconConstraints: BoxConstraints(
                  minHeight: AppDimension.width_4w,
                  minWidth: AppDimension.width_4w,
                ),
                suffixIcon: (widget.suffixIconWidget != null) ? widget.suffixIconWidget
                :
                (widget.isObscure)
                    ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _toggleObscured(),
                  child: Container(
                    padding: EdgeInsets.only(right: 4.w),
                    child: (_obscured)
                        ? PngIconGen(icon: Assets.icons.entry.hidePasswordV3Icon.path, width: 5.w,)
                    // Icon(Icons.visibility_off, color: AppColors.gray11, size: 5.w,)
                        : PngIconGen(icon: Assets.icons.entry.showPasswordV3Icon.path, width: 5.w,)
                  ),
                )
                    : (widget.clearTextField)
                    ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.currencySuffix != null)
                      Container(
                        padding: ((widget.clearTextField && (widget.controller?.text.isNotEmpty ?? false) && widget.enableTextField))? EdgeInsets.only(right: AppDimension.width_2w,): EdgeInsets.only(right: AppDimension.width_4w,),
                        child: Text(widget.currencySuffix.toString(),style: TextStyles.semiBold(color: AppColors.orange,size: AppDimension.sp12),),
                      ),
                  ],
                )
                    : (widget.showDropdownIcon)
                    ? Container(
                  padding: EdgeInsets.only(
                      right: AppDimension.width_4w,
                      top: AppDimension.height_1h,
                      bottom: AppDimension.height_1h),
                  child: PngIcon(
                    icon: "top_up_drop_down_icon",
                    width: AppDimension.width_4w,
                  ),
                )
                    : (widget.showSearchSuffix)
                    ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: GestureDetector(
                      onTap: () {
                        if (widget.onEditingComplete != null) {
                          widget.onEditingComplete!();
                        }
                      },
                      child: Icon(Icons.search)),
                )
                    : (widget.showMyrSuffix)
                    ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: GestureDetector(
                      onTap: () {
                        // if (widget.onEditingComplete != null) {
                        //   widget.onEditingComplete!();
                        // }
                      },
                      child: Text("MYR", style: TextStyles.mediumStyle(size: 10.4.sp,  color: AppColors.chineseBlack2),)),
                )
                    : null,
                contentPadding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 4.w),
                isDense : true,
                hintText: widget.hintText,
                hintStyle: widget.hintTextStyle ??
                    TextStyles.lightStyle(

                        color: AppColors.philippineSilver3,
                        size: 10.2.sp),
              ),
            ),
          ),
          SizedBox(
            height: AppDimension.height_1h,
          ),
          if (widget.showErrorValidation &&
              widget.validationItem != null &&
              widget.validationItem!.isError)
            CommonErrorLabelDisplay(
              mainAxisSize: MainAxisSize.max,
              errorMessage:
              widget.validationItem?.msg ?? LangTranslation().string.error,
            ),
        ],
      ),
    );
  }
}
