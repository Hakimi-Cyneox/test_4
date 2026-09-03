import 'package:yayasan_app/base/networking/api.dart';

class LoginResponse extends Serializable {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;
  int? isDashboardV2;
  String? accountDeletable;
  User? mainDefaultUser;
  DefaultDelegationInfo? defaultDelegationInfo;
  // List<Null>? permission;

  LoginResponse({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.user,
    this.isDashboardV2,
    this.accountDeletable,
    this.mainDefaultUser,
    this.defaultDelegationInfo,
    // this.permission,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"];
    tokenType = json["token_type"];
    expiresIn = json["expires_in"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    isDashboardV2 = json["is_dashboard_v2"];
    accountDeletable = json["account_deletable"]?.toString();
    mainDefaultUser = json["default_main_user"] == null ? null : User.fromJson(json["default_main_user"]);
    defaultDelegationInfo = json["default_delegation_info"] == null ? null : DefaultDelegationInfo.fromJson(json["default_delegation_info"]);
    // if (json['permission'] != null) {
    //   permission = <Null>[];
    //   json['permission'].forEach((v) {
    //     permission!.add(Null.fromJson(v));
    //   });
    // }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String,dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    if (user != null){
      data['user'] = user!.toJson();
    }
    data['is_dashboard_v2'] = isDashboardV2;
    if (mainDefaultUser != null){
      data['default_main_user'] = mainDefaultUser!.toJson();
    }
    // if (permission != null) {
    //   data['permission'] = permission!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class User extends Serializable {
  int? id;
  String? username;
  String? memberId;
  // dynamic agentGroupId;
  // dynamic agentGroupName;
  // dynamic agentGroupCode;
  // dynamic companyId;
  // dynamic companyName;
  // dynamic group;
  // dynamic code;
  String? phoneNo;
  String? creditLimit;
  String? creditAmount;
  // dynamic referral;
  // dynamic remark;
  int? displayRate;
  String? displayRateDisplay;
  // dynamic specialCode;
  String? status;
  String? statusDisplay;
  String? createdAt;
  String? userType;
  int? changePassword;
  int? lastMainUserId;

  User({
    this.id,
    this.username,
    this.memberId,
    // this.agentGroupId,
    // this.agentGroupName,
    // this.agentGroupCode,
    // this.companyId,
    // this.companyName,
    // this.group,
    // this.code,
    this.phoneNo,
    this.creditLimit,
    this.creditAmount,
    // this.referral,
    // this.remark,
    this.displayRate,
    this.displayRateDisplay,
    // this.specialCode,
    this.status,
    this.statusDisplay,
    this.createdAt,
    this.userType,
    this.changePassword,
    this.lastMainUserId,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    memberId = json["member_id"];
    // agentGroupId = json["agent_group_id"];
    // agentGroupName = json["agent_group_name"];
    // agentGroupCode = json["agent_group_code"];
    // companyId = json["company_id"];
    // companyName = json["company_name"];
    // group = json["group"];
    // code = json["code"];
    phoneNo = json["phone_no"];
    creditLimit = json["credit_limit"];
    creditAmount = json["credit_amount"];
    // referral = json["referral"];
    // remark = json["remark"];
    displayRate = json["display_rate"];
    displayRateDisplay = json["display_rate_display"];
    // specialCode = json["special_code"];
    status = json["status"];
    statusDisplay = json["status_display"];
    createdAt = json["created_at"];
    userType = json["user_type"];
    changePassword = json["change_password"];
    lastMainUserId = json["last_main_user_id"];
  }


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username']= username;
    data['member_id']= memberId;
    // data['agent_group_id']= agentGroupId;
    // data['agent_group_name']= agentGroupName;
    // data['agent_group_code']= agentGroupCode;
    // data['company_id']= companyId;
    // data['company_name']= companyName;
    // data['group']= group;
    // data['code']= code;
    data['phone_no']= phoneNo;
    data['credit_limit']= creditLimit;
    data['credit_amount']= creditAmount;
    // data['referral']= referral;
    // data['remark']= remark;
    data['display_rate']= displayRate;
    data['display_rate_display']= displayRateDisplay;
    // data['special_code']= specialCode;
    data['status']= status;
    data['status_display']= statusDisplay;
    data['created_at']= createdAt;
    data['user_type']= userType;
    data['change_password']= changePassword;
    data['last_main_user_id']= lastMainUserId;
    return data;
  }
}

class DefaultDelegationInfo extends Serializable {
  int? id;
  int? mainUserId;
  String? mainUserName;
  String? typeName;
  int? canApprove;
  String? mainUserCode;

  DefaultDelegationInfo({
    this.id,
    this.mainUserId,
    this.mainUserName,
    this.typeName,
    this.canApprove,
    this.mainUserCode,

  });

  DefaultDelegationInfo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    mainUserId = json["main_user_id"];
    mainUserName = json["main_username"];
    typeName = json["type_name"];
    canApprove = json["can_approve"];
    mainUserCode = json["main_usercode"];

  }


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main_user_id']= mainUserId;
    data['main_username']= mainUserName;
    data['type_name']= typeName;
    data['can_approve']= canApprove;
    return data;
  }
}
