import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/gen/assets.gen.dart';
import 'package:yayasan_app/views/splashscreen/splash_binding.dart';

class SplashScreen extends BaseView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget vBuilder() {
    return Scaffold(
      body: Center(
        child: PngImageGen(
          image: Assets.images.splashScreen.path,
          width: 100.w,
          height: 100.h,
          boxFit: BoxFit.fill,
        ),
      ),
    );
  }
}
