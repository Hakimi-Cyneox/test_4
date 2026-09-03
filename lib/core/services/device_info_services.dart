import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoServices extends GetxService {
  String appVersion = "";

  Future<DeviceInfoServices> initialize() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    return this;
  }
}