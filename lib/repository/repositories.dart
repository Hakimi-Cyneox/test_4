import 'package:yayasan_app/base/base_controller.dart';
import 'package:yayasan_app/base/networking/api.dart';
import 'package:yayasan_app/base/networking/api_endpoint.dart';
import 'package:yayasan_app/base/networking/api_result.dart';
import 'package:yayasan_app/core/utils/utilities.dart';
import 'package:yayasan_app/views/entry/model/country_dropdown_param.dart';
import 'package:yayasan_app/views/entry/model/general_entry_param.dart';

/// --------------------------------------------
/// In this class where the [Function]s correspond to the API.
/// Which function here you will make it and you will consume it.
/// You can find and use on your Controller which is the Controller extends [BaseController].

mixin Repositories {
  final ApiService _service = ApiService();

  /// [Usage]
  /// - common function to remove null params
  Future<Object> removeNullParams(Map<String, dynamic> data) async {
    var dataRemove =[];
    data.forEach((k, v) {
      if (Utilities.isStringNullOrEmpty(v)) dataRemove.add(k);
    });
    data.removeWhere( (k,v) => dataRemove.contains(k));
    return data;
  }

  Future<Result> getCountryRepo(CountryDropdownParam param) async {
    return await _service.postData(endPoint: ApiEndPoints().getCountry, data: param.toJson());
  }

  Future<Result> loginRepo(GeneralEntryParam generalEntryParam) async {
    return await _service.postData(endPoint: ApiEndPoints().login, data: generalEntryParam.toJson());
  }

  Future<Result> getDashboardRepo() async {
    late Map<String, dynamic> data;
    data = {
      "dropdown": ["app_live_rate"],
    };
    return await _service.postData(endPoint: ApiEndPoints().getDashboard,data: data, withToken: true);
  }

}
