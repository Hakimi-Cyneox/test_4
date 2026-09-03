import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yayasan_app/base/base_controller.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';

class CommonPinCode extends StatefulWidget {
  final int _length;
  final ValueChanged<String> _onChanged;
  final VoidCallback _onCallBack;
  final TextInputType _textInputType;
  final StreamController<ErrorAnimationType>? _errorController;
  final bool _hasError;
  final bool _obscureText;
  final bool _autoDismissKeyboard;
  final bool _autoFocus;
  final Color? customInactiveColor;
  final Color? customActiveColor;
  final bool readOnly;
  final TextEditingController? controller;

  const CommonPinCode({
    Key? key,
    int length = 6,
    required ValueChanged<String> onChanged,
    required VoidCallback onCallBack,
    TextInputType textInputType = TextInputType.phone,
    StreamController<ErrorAnimationType>?  errorController,
    bool hasError = false,
    bool obscureText = false,
    bool autoDismissKeyboard = true,
    bool autoFocus = false,
    this.customInactiveColor,
    this.customActiveColor,
    this.readOnly = false,
    this.controller,
  })  : _length = length,
        _onChanged = onChanged,
        _onCallBack = onCallBack,
        _textInputType = textInputType,
        _errorController = errorController,
        _hasError = hasError,
        _obscureText = obscureText,
        _autoDismissKeyboard = autoDismissKeyboard,
        _autoFocus = autoFocus,
        super(key: key);

  @override
  State<CommonPinCode> createState() => _CommonPinCodeState();
}

class _CommonPinCodeState extends State<CommonPinCode> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PinCodeTextField(
          controller: widget.controller,
          readOnly: widget.readOnly,
          autoFocus: widget._autoFocus,
          autoDismissKeyboard: widget._autoDismissKeyboard,
          obscureText: widget._obscureText,
          blinkWhenObscuring: widget._obscureText,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          appContext: Get.context!,
          length: widget._length,
          onChanged: widget._onChanged,
          showCursor: false,
          enableActiveFill: true,
          onCompleted: (v) {
            widget._onCallBack();
          },
          useHapticFeedback: true,
          hapticFeedbackTypes: HapticFeedbackTypes.medium,
          keyboardType: widget._textInputType,
          textStyle: TextStyles.semiBold(size: AppDimension.sp16, color:AppColors.black),
          errorAnimationController: widget._errorController,
          beforeTextPaste: (_) => false,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          pinTheme: PinTheme(
            borderRadius: const BorderRadius.all(Radius.circular(12),),
            shape: PinCodeFieldShape.box,
            activeColor: AppColors.deepMossGreen,
            selectedColor: AppColors.deepMossGreen,
            inactiveColor: AppColors.brightGray2,
            activeFillColor: widget.customActiveColor ?? (widget._hasError? AppColors.errorBgFilledColor: AppColors.white),
            selectedFillColor: AppColors.white,
            inactiveFillColor: widget.customInactiveColor ?? AppColors.white,
            fieldHeight: AppDimension.height_6h,
            fieldWidth: AppDimension.height_5ah,
            errorBorderColor: widget._hasError? AppColors.borderErrorColor: AppColors.brightGray2,
          ),
        ),
      ],
    );
  }
}
