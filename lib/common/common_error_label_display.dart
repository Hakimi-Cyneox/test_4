import 'package:flutter/material.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/language/lang_translation.dart';

class CommonErrorLabelDisplay extends StatelessWidget {
  final String? errorMessage;
  final MainAxisSize? mainAxisSize;

  const CommonErrorLabelDisplay({super.key, this.errorMessage, this.mainAxisSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimension.sp8),
        ),
      ),
      child: Row(
        mainAxisSize: mainAxisSize ?? MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: errorMessage ?? LangTranslation().string.error,
                    style: TextStyles.regularStyle(
                        color: AppColors.textFieldTextErrorColor,

                        size: AppDimension.sp10),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
