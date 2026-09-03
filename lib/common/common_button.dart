import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';

// text widget for size 16, medium -> sp12, mediumStyle
class CommonButton extends StatefulWidget {
  final double? _width;
  final Widget _child;
  final VoidCallback _callback;
  final Color? _colorBorder;
  final List<Color>? _colorBackground;
  final EdgeInsets? _padding;
  final EdgeInsets? _margin;
  final bool isRounded;
  final bool customRounded;
  final double? _topLeft;
  final double? _topRight;
  final double? _bottomLeft;
  final double? _bottomRight;
  final bool _transparentBackground;
  final bool _isGreyOut;
  final Color? _customButtonColor;
  final LinearGradient? customLinearGradient;
  final bool newStyleRounded;

  const CommonButton({
    Key? key,
    double? width,
    required Widget child,
    required VoidCallback onPressed,
    bool transparentBackground = false,
    Color? colorBorder,
    List<Color>? colorBackground,
    bool transparentLinerGradient = false,
    int intervalMs = 1000,
    EdgeInsets? padding,
    EdgeInsets? margin,
    bool greyBorderButton = false,
    bool? isRounded,
    bool? customRounded = false,
    bool? isTransparent = false,
    double? topLeft = 0.0,
    double? topRight = 0.0,
    double? bottomLeft = 0.0,
    double? bottomRight = 0.0,
    bool? isGreyOut = false,
    bool? newStyleRounded,
    Color? customButtonColor, this.customLinearGradient
  })  : _width = width,
        _child = child,
        _callback = onPressed,
        _colorBackground = colorBackground,
        _colorBorder = colorBorder,
        _padding = padding,
        _margin = margin,
        isRounded = isRounded ?? true,
        customRounded = customRounded ?? false,
        _transparentBackground = transparentBackground,
        _topLeft = topLeft,
        _topRight = topRight,
        _bottomLeft = bottomLeft,
        _bottomRight = bottomRight,
        _isGreyOut = isGreyOut ?? false,
        _customButtonColor = customButtonColor,
        newStyleRounded = newStyleRounded ?? false,

        super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {

  @override
  Widget build(context) {

    BorderRadiusGeometry radius;
    List<Color> gradientColors;

    if (widget.newStyleRounded) {
      radius = const BorderRadius.all(Radius.circular(10));
    } else if (widget.customRounded) {
      radius = BorderRadius.only(
        topRight: Radius.circular(widget._topRight ?? 0),
        bottomRight: Radius.circular(widget._bottomRight ?? 0),
        topLeft: Radius.circular(widget._topLeft ?? 0),
        bottomLeft: Radius.circular(widget._bottomLeft ?? 0),
      );
    } else if (widget.isRounded) {
      radius = BorderRadius.circular(AppDimension.sp20);
    } else {
      radius = BorderRadius.zero;
    }

    if (widget._customButtonColor != null) {
      gradientColors = [widget._customButtonColor!, widget._customButtonColor!];
    } else if (widget._transparentBackground) {
      gradientColors = [AppColors.transparent, AppColors.transparent];
    } else if (widget._isGreyOut) {
      gradientColors = (widget._colorBackground ?? [AppColors.gargoyleGas, AppColors.beer])
          .map((c) => c.withOpacity(0.5))
          .toList();
    } else {
      gradientColors = [AppColors.gargoyleGas, AppColors.beer];
    }

    return Container(
      margin: widget._margin ?? const EdgeInsets.symmetric(vertical: 0),
      width: widget._width ?? double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: widget._colorBorder ?? AppColors.transparent,
            width: 1,
          ),
          gradient: widget.customLinearGradient ??
              LinearGradient(
                begin: const Alignment(-1.0, 0.0),
                end: const Alignment(1.0, 0.0),
                colors: gradientColors,
                stops: const [0.0, 1.0],
              ),
          borderRadius: radius
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          shadowColor: Colors.transparent,
          backgroundColor: AppColors.transparent,
          padding: widget._padding ?? EdgeInsets.symmetric(vertical: AppDimension.height_2h),
          elevation: 0.0,
        ),
        onPressed: widget._callback,
        child: widget._child,
      ),
    );
  }
}

class CommonTopUpButton extends StatefulWidget {
  final double? _width;
  final Widget _child;
  final VoidCallback _callback;
  final List<Color>? _colorBackground;
  final EdgeInsets? _padding;
  final EdgeInsets? _margin;

  const CommonTopUpButton({
    Key? key,
    double? width,
    required Widget child,
    required VoidCallback onPressed,
    bool transparentBackground = false,
    Color? colorBorder,
    List<Color>? colorBackground,
    bool transparentLinerGradient = false,
    int intervalMs = 1000,
    EdgeInsets? padding,
    EdgeInsets? margin,
    bool greyBorderButton = false,
  })  : _width = width,
        _child = child,
        _callback = onPressed,
        _colorBackground = colorBackground,
        _padding = padding,
        _margin = margin,
        super(key: key);

  @override
  State<CommonTopUpButton> createState() => _CommonTopUpButtonState();
}

class _CommonTopUpButtonState extends State<CommonTopUpButton> {

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: widget._callback,
      child: Container(
        padding: widget._padding ?? EdgeInsets.symmetric(vertical: AppDimension.height_2h),
        margin: widget._margin ?? EdgeInsets.symmetric(vertical: AppDimension.height_1h),
        width: widget._width ?? double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.0, -1.0),
            end: const Alignment(0.0, 1.0),
            colors: widget._colorBackground ?? [AppColors.gradientButtonLightBgColor, AppColors.gradientButtonDarkBgColor],
            stops: const [0.0, 1.0],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimension.sp6),
          ),
        ),
        child: widget._child,
      ),
    );
  }
}


