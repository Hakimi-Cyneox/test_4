import 'package:yayasan_app/base/networking/api.dart';

class GeneralEntryParam extends Serializable{
  String? phoneNo;
  String? password;
  String? ipAddress;

  GeneralEntryParam({
    this.phoneNo,
    this.password,
    this.ipAddress,
  });

  @override
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['phone_no'] = phoneNo;
    map['password'] = password;
    map['ip_address'] = ipAddress;
    return map;
  }
}
