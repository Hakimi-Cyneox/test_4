import '../../../base/networking/api.dart';

class GetCountryResponse implements Serializable {
  Dropdown? dropdown;

  GetCountryResponse({
    this.dropdown,
  });

  GetCountryResponse.fromJson(Map<String, dynamic> json) {
    dropdown = json['dropdown'] != null ? Dropdown.fromJson(json["dropdown"]) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dropdown != null) {
      data["dropdown"] = dropdown!.toJson();
    }
    return data;
  }
}

class Dropdown extends Serializable {
  Map<String, String>? sysLanguage;

  Dropdown({
    this.sysLanguage,
  });

  Dropdown.fromJson(Map<String, dynamic> json) {
    if (json['sys_language'] != null) {
      sysLanguage = Map<String, String>.from(json['sys_language']);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sysLanguage != null) {
      data['sys_language'] = sysLanguage;
    }
    return data;
  }
}
