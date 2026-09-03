/// const.dart will save the name of all const Class

class StorageKeyName {
  /// constant name for storage key
  static const String themeData = "themeData";
  static const String locale = "locale";
  static const String authToken = "authToken";
  static const String tokenType = "tokenType";
  static const String userData = "userData";
  static const String isFirstLaunch = "isFirstLaunch";
  static const String validCountry = "validCountry";
  static const String userType = "userType";
}

class FontStyleName {
  /// font style
  String get defaultBlackFont => "Montserrat Black"; // black
  String get defaultFont => "Montserrat Regular"; // regular
  String get defaultMediumFont => "Montserrat Medium"; // medium
  String get defaultSemiBoldFont => "Montserrat SemiBold"; // semi bold
  String get defaultBoldFont => "Montserrat Bold"; // bold
  String get defaultExtraBoldFont => "Montserrat Extra Bold"; // extra bold
  String get defaultLightFont => "Montserrat Light"; // light

  String get poppinsRegular => "Poppins Regular"; // regular
  String get poppinsMedium => "Poppins Medium"; // regular
  String get poppinsSemiBold => "Poppins SemiBold"; // regular
  String get poppinsBold => "Poppins Bold"; // regular
  String get poppinsExtraBold => "Poppins ExtraBold"; // regular

  String get interRegular => "Inter Regular";
  String get interMedium => "Inter Medium";
  String get interSemiBold => "Inter SemiBold";
  String get interBold => "Inter Bold";
}

class CountryPhoneNumberLength {
  // max length for Malaysia phone number
  int get maxMYPhoneLength => 10;
  int get minMYPhoneLength => 9;
}

class CurrencyDisplay{
  static String get currencyDisplay => "RM";
}

class RedirectConstants {
  // static const String assets = "assets";
  // static const String orderHistory = "order_history";
  // static const String requestCredit = "request_credit";
  // static const String approveRequestCredit = "approve_request_credit";

  static const String requestCredit = "request_credit";
  static const String orderHistory = "order_history";
  static const String assets = "assets";
  static const String transfer = "transfer";
  static const String requestCreditFrom = "request_credit_from";
  static const String profile = "profile";
  static const String subApproval = "sub_approval";
  static const String pendingSubApproval = "pending_sub_approval";
}