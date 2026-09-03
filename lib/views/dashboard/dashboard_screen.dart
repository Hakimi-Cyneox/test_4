import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';

import 'package:yayasan_app/views/dashboard/dashboard_binding.dart';

import '../../core/utils/color/app_colors.dart';

class DashboardScreen extends BaseView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget vBuilder() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light, // For iOS: (dark icons)
        statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
      ),
    );
    return scrollViewBody(
      backgroundColor: AppColors.antiFlashWhite,
      onRefresh: controller.onRefresh,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7.h,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
