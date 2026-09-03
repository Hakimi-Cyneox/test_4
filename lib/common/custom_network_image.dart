import 'package:cached_network_image/cached_network_image.dart';
import 'package:yayasan_app/base/theme_setting/theme_provider.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CustomCircleNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomCircleNetworkImage({
    Key? key,
    this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 64,
      height: height ?? 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) => ClipOval(
          child: Utilities.hasValidUrl(imageUrl ?? "")
              ? CachedNetworkImage(
                  imageUrl: imageUrl!,
                  imageBuilder: (context, imageUrl) => Container(
                    width: width ?? 64,
                    height: height ?? 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageUrl, fit: fit),
                    ),
                  ),
                  placeholder: (context, url) => const SpinKitFadingCircle(
                    color: Colors.grey,
                    size: 20.0,
                  ),
                  errorWidget: (context, url, error) => SizedBox(
                    width: width ?? 64,
                    height: height ?? 64,
                    child: Icon(
                      Icons.error_outline,
                      color: AppColors.kErrorColor,
                    ),
                  ),
                )
              : SizedBox(
                  width: width ?? 64,
                  height: height ?? 64,
                  child: Icon(
                    Icons.error_outline,
                    color: AppColors.kErrorColor,
                  ),
                ),
        ),
      ),
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Border? border;
  final BorderRadius? borderRadius;

  const CustomNetworkImage({
    Key? key,
    this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.border,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Utilities.hasValidUrl(imageUrl ?? "")
        ? CachedNetworkImage(
            imageUrl: imageUrl!,
            imageBuilder: (context, imageUrl) => Container(
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageUrl, fit: fit),
                border: border,
                borderRadius: borderRadius,
              ),
            ),
            placeholder: (context, url) => Center(
              child: SpinKitFadingCircle(
                color: AppColors.spanishGray,
                size: AppDimension.width_10w,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              decoration: BoxDecoration(
                border: border ?? Border.all(color: AppColors.textFieldGreyBorder),
                borderRadius: borderRadius,
              ),
              child: Icon(
                Icons.error_outline,
                color: AppColors.kErrorColor,
              ),
            ),
          )
        : Container(
            width: width ?? double.infinity,
            height: height ?? double.infinity,
            decoration: BoxDecoration(
              border: border ?? Border.all(color: AppColors.textFieldGreyBorder),
              borderRadius: borderRadius,
            ),
            child: Icon(
              Icons.error_outline,
              color: AppColors.kErrorColor,
            ),
          );
  }
}
