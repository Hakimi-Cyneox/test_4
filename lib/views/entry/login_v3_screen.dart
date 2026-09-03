import 'dart:io';

import 'package:flutter/services.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/common/common_bottom_sheet.dart';
import 'package:yayasan_app/common/common_image_display.dart';
import 'package:yayasan_app/common/common_login_text_field.dart';
import 'package:yayasan_app/common/common_text_style.dart';
import 'package:yayasan_app/core/localization/localization.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/core/utils/dimension/app_dimension.dart';
import 'package:yayasan_app/gen/assets.gen.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/base/base_view_view_model.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'package:yayasan_app/views/entry/login_binding.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/views/language/language_binding.dart';

class LoginV3Screen extends BaseView<LoginController> {
  const LoginV3Screen({super.key});

  @override
  Widget vBuilder() {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light, // For iOS: (dark icons)
          statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
        ),
        child: Scaffold(
            backgroundColor: AppColors.antiFlashWhite2,
            body: SafeArea(
              bottom: Platform.isIOS ? false : true,
              child: SingleChildScrollView(
                child:
                Column(
                  children: [
                    _LoginScreen(),
                  ],
                ),),
            )
        ),
      );
    },
    );
  }
}

class _LoginScreen extends StatefulWidget {
  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (vm) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.5.h,),
                /// change language
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      // triggerLanguageBottomSheet(vm);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.2.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                          color: AppColors.textFieldGreyBorder,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() => Text(
                            Get.find<LanguageController>().selectedLangLocal.value.toUpperCase(),
                            style: TextStyles.mediumStyle(size: 9.2.sp),
                          )),
                          SizedBox(
                            width: AppDimension.width_2w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.5.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    LangTranslation().string.login.toUpperCase(),
                    style: TextStyles.mediumStyle(
                      size: 16.sp,

                      color: AppColors.chineseBlack2
                    ),),
                ),
                SizedBox(height: 2.5.h,),
                // CommonLoginTextField(
                //   isV3Style: true,
                //   title: null,
                //   hintText: LangTranslation().string.phoneNumber,
                //   focusNode: vm.loginPhoneNumberFocusNode,
                //   controller: vm.loginPhoneNumberTextController,
                //   validationItem: vm.loginPhoneNumberValidateItem,
                //
                //   // TODO when added country api
                //   prefixIcon:
                //   vm.selectedCountry.isoCode?.toLowerCase(),
                //   prefixText: (vm.selectedCountry.dialCode
                //       ?.toLowerCase()
                //       .contains("+") ??
                //       false)
                //       ? vm.selectedCountry.dialCode?.toLowerCase()
                //       : "+${vm.selectedCountry.dialCode?.toLowerCase() ?? ""}",
                //   isPhone: true,
                //   keyBoardType: TextInputType.number,
                //   showErrorValidation: true,
                //   inputFormatters: [
                //     FilteringTextInputFormatter.digitsOnly,
                //   ],
                //   onValidation: () {
                //     vm.loginPhoneNumberFieldValidation();
                //   },
                //   callback: () {
                //     FocusManager.instance.primaryFocus?.unfocus();
                //     // Get.toNamed(RouteName.countryListScreenRoute)?.then((value) {
                //     // });
                //   },
                //   clearTextController: () {
                //     vm.loginPhoneNumberTextController.clear();
                //     vm.loginPhoneNumberFieldValidation();
                //   },
                //   fontColor: AppColors.black,
                // ),
                SizedBox(height: 1.5.h,),
                CommonLoginTextField(
                  isV3Style: true,
                  title: null,
                  hintText: LangTranslation().string.password,
                  isObscure: true,
                  focusNode: vm.loginPasswordFocusNode,
                  controller: vm.loginPasswordTextController,
                  validationItem: vm.loginPasswordValidateItem,
                  showErrorValidation: true,
                  prefixIcon: "entry/login_v3_icon",
                  onValidation: () {
                    vm.loginPasswordFieldValidation();
                  },
                  // fillColor: AppColors.white,
                  fontColor: AppColors.black,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 2.8.h),
                /// forgot password
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      "${LangTranslation().string.forgotPassword}?",
                      style: TextStyles.regularStyle(size: 10.2.sp, color: AppColors.deepMossGreen, ),
                    ),
                  ),
                ),
                SizedBox(height: 42.h,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                        vm.login();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 1.3.h, horizontal: 4.w),
                      margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 0.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular((40)),
                          color: AppColors.britishRacingGreen
                      ),
                      child: Center(
                        child: Text(LangTranslation().string.login,
                          style: TextStyles.mediumStyle(
                              color: AppColors.white,
                              size: 12.5.sp
                          ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Future<dynamic> triggerLanguageBottomSheet(LoginController vm) {
  //   vm.getLanguageList();
  //
  //   return CommonBottomSheet().getXBottomSheetV2(
  //     backgroundColor: AppColors.white,
  //     enableDrag: true,
  //     isDismissible: true,
  //     Padding(
  //       padding: EdgeInsets.only(
  //           left: 6.w, right: 6.w, bottom: 0.h, top: 2.h),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           SizedBox(height: 1.h,),
  //           Text(LangTranslation().string.language,
  //             style: TextStyles.semiBold(
  //                 size: 12.2.sp,
  //
  //                 color: AppColors.chineseBlack2
  //             ),),
  //           SizedBox(height: 2.h,),
  //           ListView.builder(
  //               padding: EdgeInsets.zero,
  //               shrinkWrap: true,
  //               itemCount: vm.dropDownResponse.systemLanguage?.length,
  //               itemBuilder: (context, index) {
  //                 final item = vm.dropDownResponse.systemLanguage?[index];
  //                 final selected = item?.name?.toLowerCase() == Get.find<LanguageController>().selectedLangLocal.value.toLowerCase();
  //                 Language languageObject = vm.languageList[index];
  //                 return GestureDetector(
  //                   behavior: HitTestBehavior.translucent,
  //                   onTap: () {
  //                     BaseCommonWidgets().hideBottomSheet();
  //                     Get.find<LanguageController>().selectLanguage(languageObject).then((value) {
  //                       vm.getCountry();
  //                     });
  //                     vm.loginPhoneNumberValidateItem.isError = false;
  //                     vm.loginPasswordValidateItem.isError = false;
  //                   },
  //                   child: Container(
  //                       padding: EdgeInsets.symmetric(vertical: 1.7.h, horizontal: 4.w),
  //                       margin: EdgeInsets.symmetric(vertical: 0.2.h, horizontal: 0.w),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(40),
  //                         color: selected ? AppColors.deepMossGreen : AppColors.transparent
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Padding(
  //                             padding: EdgeInsets.only(left: 2.w),
  //                             child: Text(item?.display ?? "-",
  //                             style: TextStyles.mediumStyle(
  //                               color: selected ? AppColors.white : AppColors.chineseBlack2,
  //                               size: 11.2.sp
  //                             ),),
  //                           ),
  //                           // PngIconGen(icon: Assets.icons.entry.checkmarkV3Icon.path, width: 5.5.w,)
  //                         ],
  //                       ),
  //                   ),
  //                 );
  //               }
  //               ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}