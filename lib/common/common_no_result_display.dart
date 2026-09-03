import 'package:sizer/sizer.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/gen/assets.gen.dart';

import '../language/lang_translation.dart';

class CommonNoResultDisplay extends StatelessWidget {
  const CommonNoResultDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PngIconGen(
          icon: Assets.icons.emptyFolder.path,
          width: 14.w,
          color: AppColors.lightGray,
        ),
        SizedBox(height: AppDimension.height_1h,),
        Text(LangTranslation().string.noRecord, style: TextStyles.regularStyle(size: 10.sp,color: AppColors.bottomNavUnselectedTextColor, ),)
      ],
    );
  }
}
