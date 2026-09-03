import 'package:yayasan_app/common/common_image_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:get/get.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:yayasan_app/views/language/language_binding.dart';

import '../core/utils/color/app_colors.dart';

class CustomDefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget? titleWidget;
  final List<Widget>? actionList;
  final bool isBackable;
  final bool showChangeLanguageOption;
  final Function? onSearchKeyword;
  final Function? customBackFunction;
  final FocusNode? focusNode;
  final bool centerTitle;
  final bool isCustom;
  final Color backgroundColor;
  final bool isCustomExternal;

  const CustomDefaultAppBar({
    Key? key,
    this.titleWidget,
    this.actionList = const [],
    this.isBackable = true,
    this.customBackFunction,
    this.showChangeLanguageOption = false,
    this.onSearchKeyword,
    this.focusNode,
    this.isCustom = false,
    this.centerTitle = false,
    this.backgroundColor = Colors.transparent,
    this.isCustomExternal = false,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light, // For iOS: (dark icons)
        statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
      ),
      elevation: 0.0,
      centerTitle: centerTitle,
      leadingWidth: isCustom ? 120 : isBackable? 55: 0,
      automaticallyImplyLeading: !isBackable,
      leading: isBackable
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (customBackFunction != null) {
                  customBackFunction!();
                } else {
                  Get.back();
                }
              },
              child: isCustomExternal ?
              Row(
                children: [
                  PngIcon(
                    icon: "external/arrow_back_icon",width: AppDimension.height_2h,height: AppDimension.height_2h,
                    padding: EdgeInsets.only(left: AppDimension.static_18),
                  ),
                ],
              ) :
              isCustom ? Row(
                children: [
                  PngIcon(
                    icon: "back_arrow_icon",
                    padding: EdgeInsets.only(left: AppDimension.static_18, right: AppDimension.static_10),
                  ),
                  Text(LangTranslation().string.backText,style: TextStyles.semiBold(color: AppColors.white),)
                ],
              ) :
              Row(
                children: [
                  PngIcon(
                    icon: "back_icon",width: AppDimension.height_2h,height: AppDimension.height_2h,
                    padding: EdgeInsets.only(left: AppDimension.static_18),
                  ),
                ],
              ),
            )
          : Container(),
      title: titleWidget,
      actions: [
        if (showChangeLanguageOption)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // Get.toNamed(RouteName.languageScreenRoute);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.width_4w),
              child: Row(
                children: [
                  Obx(() => Text(
                        Get.find<LanguageController>().selectedLangLocal.value.toUpperCase(),
                        style: TextStyles.regularStyle(size: AppDimension.sp9),
                      )),
                  SizedBox(
                    width: AppDimension.width_2w,
                  ),
                  PngIcon(
                    icon: "login_language_arrow_icon",
                    width: AppDimension.width_2w,
                  ),
                ],
              ),
            ),
          ),
        if (actionList != null)
          for (var element in actionList!) element,
      ],
    );
  }
}
