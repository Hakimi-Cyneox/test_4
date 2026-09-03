
import 'package:yayasan_app/base/networking/api.dart';

class CountryDropdownParam extends Serializable{
  List? dropdown;

  CountryDropdownParam({
    this.dropdown,
  });

  @override
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['dropdown'] = dropdown;
    return map;
  }
}
