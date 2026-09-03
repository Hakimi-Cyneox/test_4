import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:ip_country_lookup/ip_country_lookup.dart';
import 'package:yayasan_app/base/base_common_widgets.dart';
import 'package:yayasan_app/base/base_controller.dart';
import 'package:yayasan_app/base/base_tab_bar_screen.dart';
import 'package:yayasan_app/core/manager/user_manager.dart';
import 'package:yayasan_app/core/routes/route_name.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/main.dart';
import 'package:yayasan_app/views/dashboard/dashboard_binding.dart';

class NetworkConnectivity {
  NetworkConnectivity._();

  static final _instance = NetworkConnectivity._();

  static NetworkConnectivity get instance => _instance;

  final _networkConnectivity = Connectivity();
  final _controller = StreamController<bool>.broadcast();

  bool isOnline = false;
  bool? _lastStatus;
  String ipv4Address = "";
  Timer? _reconnectDebounce;

  Stream<bool> get myStream => _controller.stream;

  Future<void> initialise() async {
    // initial check
    List<ConnectivityResult> connectivityResults = await _networkConnectivity.checkConnectivity();

    if (connectivityResults.isNotEmpty) {
      _checkStatus(connectivityResults);
    } else {
      Utilities.showLogWhenDebug("ConnectivityResult", "No connectivity results available.");
      _controller.sink.add(false);
    }

    // ipv4Address = await IpCountryLookup().getUserIpAddress();

    // listen for connectivity changes
    _networkConnectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  /// ✅ Enhanced check with both directions
  void _checkStatus(dynamic connectivityResult) async {
    bool previousStatus = _lastStatus ?? false;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty &&
          result[0].rawAddress.isNotEmpty &&
          connectivityResult != ConnectivityResult.none) {
        isOnline = true;
      } else {
        isOnline = false;
      }
    } on SocketException {
      isOnline = false;
    }

    // only fire if status actually changes
    if (isOnline != previousStatus) {
      _controller.sink.add(isOnline);
      _lastStatus = isOnline;

      if (isOnline) {
        Utilities.showLogWhenDebug("🔵 Network", "Back online");
        if (isColdStart == true) {
          Utilities.showLogWhenDebug("Network coldstart", "$isColdStart");
          return;
        }
        BaseCommonWidgets().hideDialog();
        BaseCommonWidgets().hideBottomSheet();

        // Cancel any pending reconnect timer
        _reconnectDebounce?.cancel();

        // Wait for a stable connection before restoring
        _reconnectDebounce = Timer(const Duration(seconds: 2), () async {
          // Check again before proceeding to ensure still online
          try {
            final confirm = await InternetAddress.lookup('google.com');
            if (confirm.isNotEmpty && confirm[0].rawAddress.isNotEmpty) {
              Utilities.showLogWhenDebug("🌐 Network", "Stable connection confirmed. Restoring state...");
              _onConnectionRestored();
            } else {
              Utilities.showLogWhenDebug("⚠️ Network", "Unstable after delay — skipping restore.");
            }
          } catch (_) {
            Utilities.showLogWhenDebug("⚠️ Network", "Lost connection before restore — skipping.");
          }
        });
      } else {
        Utilities.showLogWhenDebug("🔴 Network", "Offline");
        _reconnectDebounce?.cancel(); // cancel scheduled restore if connection lost again
      }
    }
  }


  Future<void> _onConnectionRestored() async {
    final currentRoute = Get.currentRoute;
    final controller = BaseController.getControllerByRoute(currentRoute);

    if (!UserManager.instance.isUserLogged) {
      Utilities.showLogWhenDebug("⚠️ Network", "Not logged in, do nothing.");
      return;
    }

    // refresh dashboard first
    if (currentRoute != RouteName.baseTabBarScreenRoute) {
     await Get.find<DashboardController>().getDashboard();
    }

    if (currentRoute == RouteName.baseTabBarScreenRoute) {
      if (Get.find<BaseTabBarViewModel>().currentIndex == 2) {
        Get.find<BaseTabBarViewModel>().onItemTapped(2, showLoading: false);
      } else if (Get.find<BaseTabBarViewModel>().currentIndex == 3) {
        Get.find<BaseTabBarViewModel>().onItemTapped(3);
      } else if (Get.find<BaseTabBarViewModel>().currentIndex == 4) {
        Get.find<BaseTabBarViewModel>().onItemTapped(4);
      }
    } else if (controller != null) {
        Utilities.showLogWhenDebug(
            "🌐 Reconnect trigger",
            "Calling onRefresh() for $currentRoute → ${controller.runtimeType}"
        );
        controller.onRefresh(); // simplified call

    } else {
      Utilities.showLogWhenDebug("⚠️ Reconnect trigger", "No active controller found for $currentRoute");
    }
  }



  void disposeStream() => _controller.close();
}
