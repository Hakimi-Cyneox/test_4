import 'package:sizer/sizer.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:yayasan_app/core/utils/color/app_colors.dart';
import 'base_controller.dart';
export 'base_controller.dart';

/// [Example]
///
/// class MemberWidget extends BaseViewModel<MemberController> {
///
///   @override
///   Widget vmBuilder() => Text("Hi, I'm a member");
///
/// }
///
/// Please extends to your [ViewModel] / [Widget] / [Child].
/// read the [Example] above.
abstract class BaseViewModel<T extends BaseController> extends StatelessWidget {
  const BaseViewModel({Key? key}) : super(key: key);

  final String tag = "";

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return Obx(() => vmBuilder());
  }

  Widget vmBuilder();
}

/// [Example]
///
/// class HomeView extends BaseView<HomeController> {
///
///   @override
///   Widget vBuilder() => Scaffold(
///     appBar: AppBar(
///       title: Text("Title"),
///     ),
///     body: Container(
///       child: Center(
///         child: Text("Hello, world",
///           style: AppThemes().textTheme.bodyText1,
///         ),
///       ),
///     ),
///   );
///
/// }
///
/// RECOMMENDED FOR your [Screen] / [View] / [Page].
/// Please extends to your [Screen] / [View] / [Page].
/// read the [Example] above.
abstract class BaseView<T extends BaseController> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  final String tag = "";

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller){
        return vBuilder();
      },
    );
  }

  Widget vBuilder();

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<T>(
  //     builder: (controller) {
  //       return vBuilder();
  //     },
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return vBuilder();
  // }

  // Widget vBuilder();

  Widget scrollViewBody({
    PreferredSizeWidget? appbar,
    required List<Widget> children,
    Function? onRefresh,
    Color? backgroundColor,
    bool defaultMargin = false,
    bool topSafeArea = true,
    bool bottomSafeArea = true,
    String? backgroundImage,
    bool resizeToAvoidBottomInset = true,
    // ScrollController? scrollController,
  }) {
    // var mediaQuery = MediaQuery.of(Get.context!);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // executes after build
    //   if (controller.screenStateIsLoading) {
    //     BaseCommonWidgets().showLoadingDialog();
    //   } else {
    //     BaseCommonWidgets().hideDialog();
    //   }
    // });
    return AbsorbPointer(
      absorbing: controller.screenStateIsLoading,
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightBlueBgColor,
                image: (!Utilities.isStringNullOrEmpty(backgroundImage))? DecorationImage(
                  image: AssetImage(backgroundImage ?? ""),
                  fit: BoxFit.fill,
                ): null,
              ),
              child: Scaffold(
                // extendBodyBehindAppBar: true,
                // backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                backgroundColor: backgroundColor ?? AppColors.white,
                appBar: appbar,
                body: SafeArea(
                  top: topSafeArea,
                  bottom: bottomSafeArea,
                  child: Container(
                    // decoration: (backgroundColor != null)
                    //     ? null
                    //     : BoxDecoration(
                    //         gradient: LinearGradient(
                    //           begin: Alignment.topCenter,
                    //           end: Alignment.bottomCenter,
                    //           colors: ThemeProvider().isLightMode
                    //               ? AppColors.lightModeBgColor
                    //               : AppColors.darkModeBgColor,
                    //         ),
                    //       ),
                    height: SizerUtil.height,
                    width: SizerUtil.width,
                    margin: defaultMargin ? const EdgeInsets.all(16) : null,
                    child: onRefresh == null
                        ? Column(mainAxisSize: MainAxisSize.max, children: children)
                        : RefreshIndicator(
                            color: AppColors.deepMossGreen,
                            backgroundColor: AppColors.antiFlashWhite,
                            onRefresh: () => onRefresh(),
                            child: SizedBox(
                              // height: SizerUtil.height -
                              //     kBottomNavigationBarHeight -
                              //     AppBar().preferredSize.height -
                              //     mediaQuery.padding.top -
                              //     mediaQuery.padding.bottom,
                              width: SizerUtil.width,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: children),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          /// commented because using controller.screenStateIsLoading for shimmer loading
          // if (controller.screenStateIsLoading)
          //   Material(
          //     color: Colors.black26,
          //     child: Center(
          //       child: Container(
          //         padding: const EdgeInsets.all(10.0),
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //         child: const CircularProgressIndicator(),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
