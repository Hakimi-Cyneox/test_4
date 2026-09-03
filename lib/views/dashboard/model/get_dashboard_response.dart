import 'package:yayasan_app/base/networking/api.dart';


class GetDashboardResponse extends Serializable {
  Data? data;
  Dropdown? dropdown;

  GetDashboardResponse({
    this.data,
    this.dropdown,
  });

  GetDashboardResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json["data"]) : null;
    dropdown = json['dropdown'] != null ? Dropdown.fromJson(json["dropdown"]) : null;

  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (data != null) {
      json["data"] = data!.toJson();
    }
    if (dropdown != null) {
      json["dropdown"] = dropdown!.toJson();
    }
    return json;
  }
}

class Dropdown extends Serializable {
  List<CurrencyOrderType>? currencyOrderType;
  List<CreditList>? creditList;
  List<Bank>? bank;
  List<NetworkType>? networkType;
  List<UpdateCurrencyOrderStatus>? updateCurrencyOrderStatus;
  List<CurrencyOrderStatus>? currencyOrderStatus;
  List<NetworkType>? withdrawalType;
  List<AppLiveRate>? appLiveRate;

  Dropdown({
    this.currencyOrderType,
    this.creditList,
    this.bank,
    this.networkType,
    this.updateCurrencyOrderStatus,
    this.currencyOrderStatus,
    this.withdrawalType,
    this.appLiveRate,
  });


  Dropdown.fromJson(Map<String, dynamic> json) {
    if (json["currency_order_type"] != null) {
      currencyOrderType = <CurrencyOrderType>[];
      json["currency_order_type"].forEach((v) {
        currencyOrderType!.add(CurrencyOrderType.fromJson(v));
      });
    }
    if (json["credit_list"] != null) {
      creditList = <CreditList>[];
      json["credit_list"].forEach((v) {
        creditList!.add(CreditList.fromJson(v));
      });
    }
    if (json["withdrawal_bank_list"] != null) {
      bank = <Bank>[];
      json["withdrawal_bank_list"].forEach((v) {
        bank!.add(Bank.fromJson(v));
      });
    }
    if (json["network_type"] != null) {
      networkType = <NetworkType>[];
      json["network_type"].forEach((v) {
        networkType!.add(NetworkType.fromJson(v));
      });
    }
    if (json["update_currency_order_status"] != null) {
      updateCurrencyOrderStatus = <UpdateCurrencyOrderStatus>[];
      json["update_currency_order_status"].forEach((v) {
        updateCurrencyOrderStatus!.add(UpdateCurrencyOrderStatus.fromJson(v));
      });
    }
    if (json["currency_order_status"] != null) {
      currencyOrderStatus = <CurrencyOrderStatus>[];
      json["currency_order_status"].forEach((v) {
        currencyOrderStatus!.add(CurrencyOrderStatus.fromJson(v));
      });
    }

    if (json["withdrawal_type"] != null) {
      withdrawalType = <NetworkType>[];
      json["withdrawal_type"].forEach((v) {
        withdrawalType!.add(NetworkType.fromJson(v));
      });
    }
    if (json["app_live_rate"] != null) {
      appLiveRate = <AppLiveRate>[];
      json["app_live_rate"].forEach((v) {
        appLiveRate!.add(AppLiveRate.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currencyOrderType != null) {
      data["currency_order_type"] = currencyOrderType!.map((v) => v.toJson()).toList();
    }
    if (creditList != null) {
      data["credit_list"] = creditList!.map((v) => v.toJson()).toList();
    }
    if (bank != null) {
      data["bank"] = bank!.map((v) => v.toJson()).toList();
    }
    if (networkType != null) {
      data["network_type"] = networkType!.map((v) => v.toJson()).toList();
    }
    if (updateCurrencyOrderStatus != null) {
      data["update_currency_order_status"] = updateCurrencyOrderStatus!.map((v) => v.toJson()).toList();
    }
    if (currencyOrderStatus != null) {
      data["currency_order_status"] = currencyOrderStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdateCurrencyOrderStatus extends Serializable {
  int? id;
  String? name;
  String? display;

  UpdateCurrencyOrderStatus({
    this.id,
    this.name,
    this.display,
  });

  UpdateCurrencyOrderStatus.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    display = json["display"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["display"] = display;
    return data;
  }

}

class CurrencyOrderStatus extends Serializable {
  int? id;
  String? name;
  String? display;

  CurrencyOrderStatus({
    this.id,
    this.name,
    this.display,
  });

  CurrencyOrderStatus.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    display = json["display"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["display"] = display;
    return data;
  }

}

class NetworkType extends Serializable {
  int? id;
  String? name;
  String? display;

  NetworkType({
    this.id,
    this.name,
    this.display,
  });

  NetworkType.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    display = json["display"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["display"] = display;
    return data;
  }

}

class Bank extends Serializable {
  int? id;
  // String? name;
  String? display;
  // int? priority;

  Bank({
    this.id,
    // this.name,
    this.display,
    // this.priority,
  });

  Bank.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    // name = json["name"];
    display = json["name"];
    // priority = json["priority"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    // data["name"] = name;
    data["display"] = display;
    // data["priority"] = priority;
    return data;
  }

}

class CreditList extends Serializable {
  int? id;
  String? name;
  String? code;
  String? display;
  int? dcm;
  int? priority;
  String? imageUrl;
  int? countryId;

  CreditList({
    this.id,
    this.name,
    this.code,
    this.display,
    this.dcm,
    this.priority,
    this.imageUrl,
    this.countryId,
  });

  CreditList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    code = json["code"];
    display = json["display"];
    dcm = json["dcm"];
    priority = json["priority"];
    imageUrl = json["image_url"];
    if (json["country_id"] != null) countryId = json["country_id"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["code"] = code;
    data["display"] = display;
    data["dcm"] = dcm;
    data["priority"] = priority;
    data["image_url"] = imageUrl;
    return data;
  }

}

class CurrencyOrderType extends Serializable {
  int? id;
  String? name;

  CurrencyOrderType({
    this.id,
    this.name,
  });

  CurrencyOrderType.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }

}

class Data extends Serializable {
  UserData? userData;
  List<WalletBalance>? walletBalance;
  List<Currency>? currency;
  List<OrderList>? orderList;
  List<dynamic>? banner;
  List<Announcement>? announcement;
  DefaultCurrency? defaultCurrency;
  String? lastUpdatedCurrency;
  int? validCountry;
  String? totalMyrBalance;
  bool? showRequestCredit;
  bool? showSubApprovalDot;
  bool? showApproveRequestDot;

  Data({
    this.userData,
    this.walletBalance,
    this.currency,
    this.orderList,
    this.banner,
    this.announcement,
    this.defaultCurrency,
    this.lastUpdatedCurrency,
    this.validCountry,
    this.totalMyrBalance,
    this.showRequestCredit,
    this.showSubApprovalDot,
    this.showApproveRequestDot,
  });

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null ? UserData.fromJson(json["user_data"]) : null;
    if (json["wallet_balance"] != null) {
      walletBalance = <WalletBalance>[];
      json["wallet_balance"].forEach((v) {
        walletBalance!.add(WalletBalance.fromJson(v));
      });
    }

    if (json["currency"] != null) {
      currency = <Currency>[];
      json["currency"].forEach((v) {
        currency!.add(Currency.fromJson(v));
      });
    }

    if (json["order_list"] != null) {
      orderList = <OrderList>[];
      json["order_list"].forEach((v) {
        orderList!.add(OrderList.fromJson(v));
      });
    }

    if (json["banner"] != null) {
      banner = <dynamic>[];
      json["banner"].forEach((v) {
        banner!.add(v);
      });
    }

    if (json["announcement"] != null) {
      announcement = <Announcement>[];
      json["announcement"].forEach((v) {
        announcement!.add(Announcement.fromJson(v));
      });
    }
    defaultCurrency = json["default_currency"] == null ? null : DefaultCurrency.fromJson(json["default_currency"]);
    lastUpdatedCurrency = json["last_updated_currency"];
    validCountry = json["valid_country"];
    totalMyrBalance = (json["total_balance"] != null) ? json["total_balance"].toString() : null;

    showRequestCredit = json["show_request_credit"];
    showSubApprovalDot = json["show_sub_approval_red_dot"];
    showApproveRequestDot = json["show_approve_request_red_dot"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userData != null) {
      data["user_data"] = userData!.toJson();
    }
    if (walletBalance != null) {
      data["wallet_balance"] = walletBalance!.map((v) => v.toJson()).toList();
    }
    if (currency != null) {
      data["currency"] = currency!.map((v) => v.toJson()).toList();
    }
    if (orderList != null) {
      data["order_list"] = orderList!.map((v) => v.toJson()).toList();
    }
    if (banner != null) {
      data["banner"] = banner!.map((v) => v.toJson()).toList();
    }
    if (announcement != null) {
      data["announcement"] = announcement!.map((v) => v.toJson()).toList();
    }
    if (defaultCurrency != null) {
      data['default_currency'] = defaultCurrency?.toJson();
    }
    data['last_updated_currency'] = lastUpdatedCurrency;
    data['valid_country'] = validCountry;
    return data;
  }
}

class Currency extends Serializable {
  int? id;
  String? iso;
  String? code;
  String? currency;
  String? imageUrl;
  String? rate;

  Currency({
    this.id,
    this.iso,
    this.code,
    this.currency,
    this.imageUrl,
    this.rate,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    iso = json["iso"];
    code = json["code"];
    currency = json["currency"];
    imageUrl = json["image_url"];
    rate = json["rate"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["iso"] = iso;
    data["code"] = code;
    data["currency"] = currency;
    data["image_url"] = imageUrl;
    data["rate"] = rate;
    return data;
  }
}

class OrderList extends Serializable {
  int? id;
  String? orderType;
  String? reference;
  String? userPaidCredit;
  String? userPaidCreditImage;
  String? userPaidAmount;
  String? userReceivedCredit;
  String? userReceivedCreditImage;
  String? userReceivedAmount;
  String? type;
  String? createdAt;
  String? status;
  String? statusDisplay;

  OrderList({
    this.id,
    this.orderType,
    this.reference,
    this.userPaidCredit,
    this.userPaidCreditImage,
    this.userPaidAmount,
    this.userReceivedCredit,
    this.userReceivedCreditImage,
    this.userReceivedAmount,
    this.type,
    this.createdAt,
    this.status,
    this.statusDisplay,
  });

  OrderList.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    orderType = json["orderType"];
    reference = json["reference"];
    userPaidCredit = json["user_paid_credit"];
    userPaidCreditImage = json["user_paid_credit_image"];
    userPaidAmount = json["user_paid_amount"];
    userReceivedCredit = json["user_received_credit"];
    userReceivedCreditImage = json["user_received_credit_image"];
    userReceivedAmount = json["user_received_amount"];
    type = json["type"];
    createdAt = json["created_at"];
    status = json["status"];
    statusDisplay = json["status_display"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["orderType"] = orderType;
    data["reference"] = reference;
    data["user_paid_credit"] = userPaidCredit;
    data["user_paid_credit_image"] = userPaidCreditImage;
    data["user_paid_amount"] = userPaidAmount;
    data["user_received_credit"] = userReceivedCredit;
    data["user_received_credit_image"] = userReceivedCreditImage;
    data["user_received_amount"] = userReceivedAmount;
    data["type"] = type;
    data["created_at"] = createdAt;
    data["status"] = status;
    data["status_display"] = statusDisplay;
    return data;
  }
}

class UserData extends Serializable {
  String? username;

  UserData({
    this.username = "",
  });

  UserData.fromJson(Map<String, dynamic> json) {
    username = json["username"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    return data;
  }

  void clear() {
    username = '';
  }
}

class WalletBalance extends Serializable {
  int? id;
  String? name;
  String? display;
  String? balance;
  String? iso;
  int? isCoin;
  int? decimal;
  String? imageUrl;
  List<CreditSetting>? creditSetting;

  WalletBalance({
    this.id,
    this.name,
    this.display,
    this.balance,
    this.iso,
    this.isCoin,
    this.decimal,
    this.imageUrl,
    this.creditSetting,
  });

  WalletBalance.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    display = json["display"];
    balance = json["balance"];
    iso = json["iso"];
    isCoin= json["is_coin"];
    decimal= json["decimal"];
    imageUrl = json["image_url"];
    if (json['credit_setting'] != null) {
      creditSetting = <CreditSetting>[];
      json['credit_setting'].forEach((v) {
        creditSetting!.add(CreditSetting.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["display"] = display;
    data["balance"] = balance;
    data["iso"] = iso;
    data["is_coin"] = isCoin;
    data["decimal"] = decimal;
    data["image_url"] = imageUrl;
    if (creditSetting != null) {
      data['credit_setting'] = creditSetting!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CreditSetting extends Serializable {
  int? creditId;
  String? name;
  dynamic value;
  int? member;
  dynamic reference;

  CreditSetting({
    this.creditId,
    this.name,
    this.value,
    this.member,
    this.reference,
  });

  CreditSetting.fromJson(Map<String, dynamic> json) {
    creditId = json["credit_id"];
    name = json["name"];
    value = json["value"];
    member = json["member"];
    reference = json["reference"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["credit_id"] = creditId;
    data["name"] = name;
    data["value"] = value;
    data["member"] = member;
    data["reference"] = reference;
    return data;
  }
}

class Announcement extends Serializable {
  int? id;
  dynamic author;
  String? subject;
  dynamic shortDescription;
  String? description;
  String? startDate;
  String? endDate;

  Announcement({
    this.id,
    this.author,
    this.subject,
    this.shortDescription,
    this.description,
    this.startDate,
    this.endDate,
  });

  Announcement.fromJson(Map<String, dynamic> json) {
    id= json["id"];
    author= json["author"];
    subject= json["subject"];
    shortDescription= json["short_description"];
    description= json["description"];
    startDate= json["start_date"];
    endDate= json["end_date"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["author"] = author;
    data["subject"] = subject;
    data["short_description"] = shortDescription;
    data["description"] = description;
    data["start_date"] = startDate;
    data["end_date"] = endDate;

    return data;
  }
}

class DefaultCurrency extends Serializable {
  int? id;
  String? iso;
  String? code;
  String? currency;
  String? imageUrl;
  int? rate;

  DefaultCurrency({
    this.id,
    this.iso,
    this.code,
    this.currency,
    this.imageUrl,
    this.rate,
  });

  DefaultCurrency.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    iso = json["iso"];
    code = json["code"];
    currency = json["currency"];
    imageUrl = json["image_url"];
    rate = json["rate"];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["iso"] = iso;
    data["code"] = code;
    data["currency"] = currency;
    data["image_url"] = imageUrl;
    data["rate"] = rate;
    return data;
  }

}

class AppLiveRate {
  int? fromCreditId;
  String? fromCurrencyDisplay;
  String? fromCurrencyImage;
  List<ToCurrency>? toCurrency;

  AppLiveRate({
    this.fromCreditId,
    this.fromCurrencyDisplay,
    this.fromCurrencyImage,
    this.toCurrency,
  });

  AppLiveRate.fromJson(Map<String, dynamic> json) {
    fromCreditId = json['from_credit_id'];
    fromCurrencyDisplay = json['from_currency_display'];
    fromCurrencyImage = json['from_currency_image'];

    if (json['to_currency'] != null) {
      toCurrency = <ToCurrency>[];
      json['to_currency'].forEach((v) {
        toCurrency!.add(ToCurrency.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['from_credit_id'] = fromCreditId;
    data['from_currency_display'] = fromCurrencyDisplay;
    data['from_currency_image'] = fromCurrencyImage;

    if (toCurrency != null) {
      data['to_currency'] = toCurrency!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ToCurrency {
  int? toCreditId;
  String? toCurrencyDisplay;
  String? toCurrencyImage;

  ToCurrency({
    this.toCreditId,
    this.toCurrencyDisplay,
    this.toCurrencyImage,
  });

  ToCurrency.fromJson(Map<String, dynamic> json) {
    toCreditId = json['to_credit_id'];
    toCurrencyDisplay = json['to_currency_display'];
    toCurrencyImage = json['to_currency_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['to_credit_id'] = toCreditId;
    data['to_currency_display'] = toCurrencyDisplay;
    data['to_currency_image'] = toCurrencyImage;
    return data;
  }
}
