import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:yayasan_app/base/base_tab_bar_screen.dart';
import 'package:yayasan_app/core/manager/file_download_manager.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/views/dashboard/dashboard_binding.dart';
import 'package:yayasan_app/widgets/unfocus_on_tap_outside_field_handler.dart';

import 'base/base_view_view_model.dart';
import 'base/networking/network_connectivity.dart';
import 'base/theme_setting/theme_provider.dart';
import 'binding/app.dart';
import 'core/localization/localization.dart';
import 'core/manager/storage_box_manager.dart';
import 'core/manager/user_manager.dart';
import 'core/routes/route_name.dart';
import 'core/routes/routes.dart';
import 'core/utils/const.dart';

const Mode mode = Mode.staging;

enum Mode {
  debug,
  dev,
  production,
  local,
  staging,
}

bool isColdStart = true;

@pragma('vm:entry-point')
void downloadCallback(String id, int status, int progress) {
  final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
  send?.send([id, status, progress]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isColdStart = true;
  await StorageBoxManager.instance.initialize();
  await LocalizationService.instance.initialize();
  await NetworkConnectivity.instance.initialise();
  await UserManager.instance.checkAuthStatus();
  await UserManager.instance.checkAppFirstLaunchStatus();
  await AsyncBindingsServices().setupDependencies();
  await FlutterDownloader.initialize(
      debug: true
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then(
        (_) {
      runApp(
        const MyApp(),
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ReceivePort _port = ReceivePort();
  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = DownloadTaskStatus.fromInt(data[1]);
      int progress = data[2];
      setState((){
        if (status == DownloadTaskStatus.complete) {
          // Ensure we update UI in main thread
          Future.delayed(Duration.zero, () {
            FileDownloadManager.hideSnackbar();
            FileDownloadManager.showSuccessBottomSheet();
            // FileDownloadManager.showNotification();
            // FileDownloadManager.moveFileToDownloadFolder();
          });
        } else if (status == DownloadTaskStatus.failed || status == DownloadTaskStatus.undefined){
          Future.delayed(Duration.zero, (){
            FileDownloadManager.hideSnackbar();
            FileDownloadManager.showFailedBottomSheet();
          });
        } else if (status == DownloadTaskStatus.canceled) {
          Future.delayed(Duration.zero, () {
            FileDownloadManager.hideSnackbar();
          });
        }
      });
    });

    FlutterDownloader.registerCallback(downloadCallback);
    Utilities.showLogWhenDebug('main wasColdStart 1', '$isColdStart');
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light, // For iOS: (dark icons)
        statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
        // systemNavigationBarColor: Color(0x00000000),
        // systemNavigationBarDividerColor: Colors.transparent,
        // systemNavigationBarIconBrightness: Brightness.dark,
        // statusBarBrightness:Brightness.dark
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Sizer(
      builder: (context, orientation, deviceType) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          return Consumer<ThemeProvider>(
            builder: (context, theme, _) {
              return GetMaterialApp(
                // todo - need to add localization for calendar_date_picker2 in the future if apps allow to change language
                builder: (context, widget) {
                  return UnfocusOnTapOutsideFieldHandler(
                    child: _AppPush(
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
                        child: widget!,
                      ),
                    ),
                  );
                },
                theme: theme.themeData,
                // title: "Wewe",
                locale: LocalizationService.instance.locale,
                fallbackLocale: LocalizationService.fallbackLocale,
                translations: LocalizationService.instance,
                // initialRoute: (UserManager.instance.isUserLogged) ? RouteName.baseTabBarScreenRoute : RouteName.welcomeScreenRoute,
                // initialRoute: RouteName.externalBaseTabBarScreenRoute,
                // initialRoute: UserManager.instance.isValidCountry
                //     ? UserManager.instance.isUserLogged
                //     ? RouteName.baseTabBarScreenRoute
                //     : RouteName.registerLoginScreenRoute
                //     : RouteName.externalBaseTabBarV2ScreenRoute,
                initialRoute: UserManager.instance.isUserLogged
                    ? RouteName.baseTabBarScreenRoute
                    : RouteName.splashScreenRoute,
                debugShowCheckedModeBanner: false,
                getPages: Routes.pages(),
                initialBinding: AppBinding(),
              );
            },
          );
        },
      ),
    );
  }
}

class _AppPush extends StatefulWidget {
  const _AppPush({
    // ignore: unused_element
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<_AppPush> createState() => _AppPushState();
}

class _AppPushState extends State<_AppPush> {
  // final PushyService _pushyService = Get.find<PushyService>();
  bool _readyToNavigate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
