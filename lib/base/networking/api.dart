import 'dart:developer';
import 'dart:io';

import 'package:yayasan_app/base/networking/api_result.dart';
import 'package:yayasan_app/core/manager/user_manager.dart';
import 'package:yayasan_app/core/services/device_info_services.dart';
import 'package:yayasan_app/core/utils/const.dart';
import 'package:yayasan_app/language/lang_translation.dart';
import 'package:flutter/foundation.dart';
import 'package:yayasan_app/core/manager/storage_box_manager.dart';
import 'package:yayasan_app/core/utils/config/my_config.dart';
import 'package:yayasan_app/core/utils/my_device_info.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:get/get.dart';
import 'package:yayasan_app/views/language/language_binding.dart';
// import 'package:crypto/crypto.dart';

enum Method {
  GET, POST
}

/// This class must be instantiated in the [Repositories] class
/// core of the custom API networking
class ApiService {
  final _Api _api = _Api();

  Future<Result> callManually({
    Method method = Method.GET,
    String endPoint = "",
    Map<String, String>? param,
    bool withToken = false
  }) async {
    return await _api.callManually(method: method, endPoint: endPoint, param: param, withToken: withToken);
  }

  Future<Result> getData({String endPoint = "", Map<String, dynamic>? query, bool withToken = false}) async {
    return await _api.getData(endPoint: endPoint, query: query, withToken: withToken);
  }

  Future<Result> postData({String endPoint = "", Map? data, bool withToken = false}) async {
    return await _api.postData(endPoint: endPoint, data: data, withToken: withToken);
  }

}

/// PRIVATE CLASS
/// USE THIS VIA [ApiService] class
class _Api extends GetConnect {
  _Api() {
    timeout = const Duration(seconds: 40);
    maxAuthRetries = 3;
  }
  final Result _result = Result(
      status: false,
      isError: false,
      text: LangTranslation().string.error
  );

  bool _withToken = false;
  /// [Usage]
  /// 1. header encryption parameter
  // bool _isPostReq = false;
  // Digest? _digest;
  // int? _currentTimestamp;

  @override
  Future onInit() async {
    // httpClient.baseUrl = MyConfig.baseUrl;
    httpClient.baseUrl = MyConfig().apiUrl;
    String deviceId = await MyDeviceInfo().deviceID();
    String deviceName = await MyDeviceInfo().deviceName();
    // String selectedLang = LocalizationService.instance.localHeaderValue;
    String selectedLang = "";
    if (Get.find<LanguageController>().selectedLangLocal.value.toLowerCase() == "id") {
      selectedLang = "indo";
    } else {
      selectedLang = Get.find<LanguageController>().selectedLangLocal.value.toLowerCase();
    }
    String pf = Platform.operatingSystem;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['platform'] = pf;
      request.headers['device-id'] = deviceId;
      request.headers['device-name'] = deviceName;
      request.headers['lang'] = selectedLang;
      request.headers['app-version'] = Get.find<DeviceInfoServices>().appVersion;
      /// start of commented encryption header
      // if(_isPostReq) {
      //   request.headers['auth-timestamp'] = _currentTimestamp.toString();
      //   request.headers['auth-hash'] = _digest.toString();
      // }
      /// end of commented encryption header
      if (_withToken){
        String? token  = StorageBoxManager.instance.read(StorageKeyName.authToken);
        String? tokenType  = StorageBoxManager.instance.read(StorageKeyName.tokenType);
        if(token != null)request.headers['Authorization'] = "$tokenType $token";
      }
      // _showLogWhenDebug("HEADERS",request.headers.toString());
      return request;
    });
    super.onInit();
  }

  /// FOR NETWORKING WITH [Method.POST] / [Method.GET]
  /// RETURN DATA WITH [Result.body] MODELS and please parse with your model
  Future<Result> callManually({
    Method method = Method.GET,
    String endPoint = "",
    Map<String, String>? param,
    bool withToken = false
  }) async {
    _withToken = withToken;
    await onInit();

    _showLogWhenDebug(method == Method.GET ? "GET" : "POST",httpClient.baseUrl!+endPoint);
    _showLogWhenDebug("PARAMS",query.toString());
    _showLogWhenDebug("TOKEN",_withToken.toString());

    try {
      Response res;
      if (method == Method.GET) {
        res = await get(endPoint, query: param);
      } else {
        res = await post(endPoint, param);
      }
      if(res.isOk){
        _showLogWhenDebug("LOADED",res.bodyString ?? "NULL LOADED res.bodyString");
        _result.status = true;
        _result.body = res.body;
        _showLogWhenDebug("PARSING","SUCCESS");
        return _result;
      } else {
        _showLogWhenDebug("ERROR",res.bodyString ?? "ERROR LOADED res.bodyString");
        _result.status = false;
        _result.isError = true;
        _result.text = "Error here, please try again after awhile......";
        return _result;
      }
    } catch (e) {
      _showLogWhenDebug("ERROR",e.toString());
      _result.status = false;
      _result.isError = true;
      return _result;
    }
  }

  /// FOR NETWORKING WITH THE [Method.GET]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> getData({String endPoint = "", Map<String, dynamic>? query, bool withToken = false}) async {
    // _isPostReq = false;
    _withToken = withToken;
    await onInit();

    _showLogWhenDebug("GET",httpClient.baseUrl!+endPoint);
    _showLogWhenDebug("PARAMS",query.toString());
    _showLogWhenDebug("TOKEN",_withToken.toString());

    try {
      var res = await get(endPoint, query: query);
      if(res.isOk && !Utilities.isStringNullOrEmpty(res.bodyString)){
        _showLogWhenDebug("LOADED",res.bodyString ?? "show log when debug empty......");
        _result.status = true;
        // _result = Result.fromJson(res.bodyString ?? "");
        _result.body = res.body;
        _showLogWhenDebug("PARSING","SUCCESS");
        return _result;
      } else {
        _showLogWhenDebug("ERROR",res.bodyString ?? "");
        _result.status = false;
        _result.isError = true;
        _result.text = "Error here, please try again after awhile......";
        return _result;
      }
    } catch (e) {
      _showLogWhenDebug("ERROR",e.toString());
      _result.status = false;
      _result.isError = true;
      return _result;
    }
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> postData({String endPoint = "", Map? data, bool withToken = false}) async {
    // _isPostReq = true;
    _withToken = withToken;
    /// start of commented encryption
    // _currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    // var key = utf8.encode(MyConfig().secretKey);
    // var endPointBytes = utf8.encode(endPoint.toString());
    // var currentTimestampBytes = utf8.encode(_currentTimestamp.toString());
    // Hmac hmacSha256 = Hmac(sha256, key);
    // if(data != null && data.isNotEmpty) {
    //   // url+data+timestamp
    //   var dataBytes = utf8.encode(jsonEncode(data));
    //   _digest = hmacSha256.convert(endPointBytes+dataBytes+currentTimestampBytes);
    // }else{
    //   // url+timestamp
    //   _digest = hmacSha256.convert(endPointBytes+currentTimestampBytes);
    // }
    /// end of commented encryption
    await onInit();

    _showLogWhenDebug("POST",httpClient.baseUrl!+endPoint);
    _showLogWhenDebug("PARAMS",data.toString());
    _showLogWhenDebug("TOKEN",_withToken.toString());

    try {
      var res = await httpClient.post(endPoint,body: data);
      if(res.isOk){
        _showLogWhenDebug("LOADED",res.bodyString ?? "res.bodyString is null");
        final body = res.body;
        if (body == null) {
          _showLogWhenDebug("WARNING", "Response body is null, using fallback message.");
          // _result.status = false;
          // _result.isError = true;
          _result.message = LangTranslation().string.somethingWentWrong;
          return _result;
        }
        _result.status = res.body["status"];
        _result.accessToken = res.body["access_token"];
        _result.body = res.body;
        _result.pagination = res.body["pagination"];
        _result.message = res.body["message"];
        _result.error = res.body["error"];
        _result.expired = res.body["expired"];
        _result.validVersion = res.body["valid_version"];

        if (!Utilities.isStringNullOrEmpty(res.body["dropdown"]) && (res.body["dropdown"].isNotEmpty)) {
          _result.dropdown = res.body["dropdown"];
        } else {
          _result.dropdown = null;
        }
        if (_result.validVersion ?? true) {
          // check for session time out
          if (_result.expired ?? false) {
            // if (true) {
            UserManager.instance.userSessionTimeout();
          } else {
            // store auth token
            if (!Utilities.isStringNullOrEmpty(_result.accessToken)) {
              StorageBoxManager.instance.write(
                  StorageKeyName.authToken, _result.accessToken!);
            }
            if (!Utilities.isStringNullOrEmpty(_result.error)) {
              // add error checking, have error with success connection
              _result.status = false;
              _result.isError = true;
            }
          }
        } else {
          if (!Utilities.isStringNullOrEmpty(_result.accessToken)) {
            StorageBoxManager.instance.write(StorageKeyName.authToken, _result.accessToken!);
          }
          if (!Utilities.isStringNullOrEmpty(_result.error)) {
            // add error checking, have error with success connection
            _result.status = false;
            _result.isError = true;
          }
          // UserManager.instance.isSessionExpired = true;
          UserManager.instance.versionUpdateRequired();
        }
        _showLogWhenDebug("PARSING","SUCCESS");
        return _result;
      } else {
        _showLogWhenDebug("LOADED",res.bodyString ?? "res.bodyString is null");
        final body = res.body;

        _result.status = false;
        _result.isError = true;
        _result.message = (body != null && body["message"] != null && body["message"].toString().trim().isNotEmpty)
            ? body["message"].toString()
            : LangTranslation().string.somethingWentWrong;

        _result.error = res.body["error"];
        _result.expired = res.body["expired"];
        _result.text = "Error here, please try again after awhile......";
        // check for session time out
        if (_result.expired ?? false) {
          UserManager.instance.userSessionTimeout();
        }
        return _result;
      }
    } catch (e) {
      _showLogWhenDebug("ERROR",e.toString());
      _result.status = false;
      _result.isError = true;
      return _result;
    }
  }

  /// TO SHOW THE LOG WHEN DEBUG MODE TRUE
  _showLogWhenDebug(String status,String e){
    if (kDebugMode) log("$status => ${e.toString()}", name: MyConfig.appName);
  }

}

abstract class Serializable {
  Map<String, dynamic> toJson();
}