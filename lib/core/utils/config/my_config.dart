import 'package:yayasan_app/main.dart';

class MyConfig {
  /// APP CONFIG
  static const String appName = "-- yayasan_app --";

  String get secretKey => "";
  String get apiUrl => getApiUrl();

  getApiUrl() {
    String apiUrl;
    switch (mode) {
      case Mode.production:
        apiUrl = "https://aapp.wewecurrency.net";
        break;
      case Mode.dev:
        apiUrl = "";
        break;
      case Mode.staging:
        apiUrl = "https://api-app.yayasan.xyz";
        break;
      default:
        apiUrl = "";
        break;
    }
    return apiUrl;
  }

}