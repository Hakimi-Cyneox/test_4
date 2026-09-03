import 'package:flutter/material.dart';

class AppColors {
  ///Color Const
  /// Dark const color (for dark theme)
  static Color get kDarkBackground => const Color(0xFF100F2B); // scaffold background dark color
  static Color get kDarkBackground2 => const Color(0xFF191B2F); // scaffold background second color for gradient
  static Color get kDarkIconColor => const Color(0xFFFFFFFF);
  static Color get kDarkBottomNavBgColor => const Color(0xFF06162D);
  static Color get kDarkTextColor => const Color(0xFFFDFDFD);
  static Color get kDarkAppBarColor => const Color(0xFF191B2F);
  static Color get kDarkBottomDividerColor => const Color(0xFF707070);
  static Color get kDarkBeforeLoginBgColor => const Color(0xFF100F2B);

  static Color get kDarkTextFieldColor => const Color(0xFFFFFFFF).withOpacity(0.1);
  static Color get kDarkWalletContainerColor => const Color(0xFF1F1D3F);

  // liner gradient color for dark mode
  static List<Color> get darkModeBgColor => <Color>[
    kDarkBackground2,
    kDarkBackground2,
    kDarkBackground,
    kDarkBackground,
  ];

  /// wallet page color
  static Color get kWalletHeaderBG => const Color(0xFF191B2F); // for light theme is AppColors.kWhite
  /// Light const color (for light theme)
  static Color get kLightBackground => const Color(0xFFF4F4F4); // scaffold background light color
  static Color get kLightIconColor => const Color(0xFF2B2B2B);
  static Color get kLightBottomNavBgColor => const Color(0xFFFFFFFF);
  static Color get kLightTextColor => const Color(0xFF000000);
  static Color get kLightAppBarColor => const Color(0xFFF4F4F4);
  static Color get kLightBottomDividerColor => const Color(0xFF959595);
  static Color get kLightBeforeLoginBgColor => const Color(0xFFFFFFFF);
  static Color get kLightTextFieldColor => const Color(0xFFFFFFFF);
  static Color get kLightTextFieldBorderColor => const Color(0xFFDFDFDF);

  // liner gradient color for light mode
  static List<Color> get lightModeBgColor => <Color>[
    kLightBackground,
    kLightBackground,
    white,
    white,
  ];

  static Color get kHintColor => const Color(0xFF9C9CC4);
  static Color get kErrorColor => Colors.red; // display for error color
  static Color get asteriskRed => const Color(0xFFFF0000);
  static Color get kNavBarLabelColor => const Color(0xFF666666);
  static Color get kPrimary => const Color(0xffF68819);
  static Color get white => const Color(0xffFFFFFF);
  static Color get black => const Color(0xFF000000);

  static Color get milkyWhite => const Color(0xffF5F5F5);

  // color for shimmer loading
  static Color get shimmerBaseGreyColor => const Color(0xFFB9B9B9);
  static Color get shimmerHighLightGreyColor => const Color(0xFF818181);

  static Color get commonButtonColor => const Color(0xFFB18B3B);
  static Color get transparent => const Color(0x0000ffff);
  static Color get errorLabelBgColor => const Color(0xFFFFE8F4);
  static Color get commonCancelButtonColor => const Color(0xFF36349A);
  static Color get lightBlueBgColor => const Color(0xFFEAF4FF);
  static Color get bottomNavSelectedColor => const Color(0xFF957A30);
  static Color get bottomNavUnselectedTextColor => const Color(0xFFB4B4B4);
  static Color get verticalDividerColor => const Color(0xFF434343);
  static Color get textFieldHintGreyColor => const Color(0xFFBFBFBF);
  static Color get countryFlagGreyBorderColor => const Color(0xFF707070);
  static Color get borderColor => const Color(0xFFFF9417);
  static Color get borderErrorColor => const Color(0xFFE80000);
  static Color get errorBgFilledColor => const Color(0xFFFFEDED);
  static Color get commonAlertScreenBgColor => const Color(0xFFE2EDFF);
  static Color get obscureIconGreyColor => const Color(0xFF434343);
  static Color get textFieldGreyBorder => const Color(0xFFEBEBEB);
  static Color get snackBarAlertDialogBgColor => const Color(0xB2000000);
  static Color get textFormFieldBgColor => const Color(0xFF353940);
  static Color get textFormFieldCurrencyBgColor => const Color(0xFF42464D);
  static Color get gradientButtonLightBgColor => const Color(0xFFADB1FF);
  static Color get gradientButtonDarkBgColor => const Color(0xFF4048DF);
  static Color get horizontalGreyDividerColor => const Color(0xFFE2E2E2);
  static Color get countryCodeGreenTextColor => const Color(0xFF00DE83);
  static Color get countryHintTextGreenColor => const Color(0xFF90E0BF);
  static Color get searchTextFieldBgColor => const Color(0xFF353940);
  static Color get textFieldErrorBorderColor => const Color(0xFFE80000);
  static Color get textFieldTextErrorColor => const Color(0xFFFF4040);
  static Color get textFieldHintTextErrorColor => const Color(0xFFE09090);
  static Color get unselectedItemColor => const Color(0xFFD8D8D8);

  // Find your color name from https://www.color-name.com.
  static const Color caribbeanGreen = Color(0xFF00DE83);
  static const Color spanishGray = Color(0xFF939393);
  static const Color lightSilver = Color(0x0D434343);
  static const Color palatinateBlue = Color(0xFF4047E0);
  static const Color cultured = Color(0xFFF4F4F4);
  static const Color arsenic = Color(0xFF434343);
  static const Color philippineGray = Color(0xFF8E8E8E);
  static const Color sandstorm = Color(0xFFFA9910) ; //Processing
  static const Color folly = Color(0xFFFF0049); //Rejected
  static const Color yellowOrange = Color(0xFFFA9910);
  static const Color brightGray = Color(0xFFEDEDED);
  static const Color gray11 = Color(0xFFBABABA);
  static const Color deepChampagne = Color(0xFFFFD3A8);
  static const Color copper = Color(0xFFBF7327);
  static const Color water = Color(0xFFD3E6FF);
  static const Color jordyBlue = Color(0xFF88B9FF);
  static const Color peach = Color(0xFFFFEAB2);
  static const Color camel = Color(0xFFC1A768);
  static const Color philippineSilver = Color(0xFFB7B7B7);
  static const Color mintCream = Color(0xFFF0FFF9);
  static const Color aquamarine = Color(0xFF94FDD0);
  static const Color shamrockGreen = Color(0xFF09A062);
  static const Color pastelRed = Color(0xFFFF5F5F);
  static const Color carnelian = Color(0xFFC31A1A);
  static const Color honeydew = Color(0xFFEDFFEB);
  static const Color airForceBlue = Color(0xFF0A3190);
  static const Color spaceCadet = Color(0xFF0D2359);

  // new
  static const Color gargoyleGas = Color(0xFFFFD447);
  static const Color beer = Color(0xFFFF9516);
  static const Color charlestonGreen = Color(0xFF292C31);
  static const Color onyx = Color(0xFF353940);
  static const Color coralRed = Color(0xFFFF4040);
  static const Color deepSaffron = Color(0xFFF19837);
  static const Color darkLava = Color(0xFF4A3D30);
  static const Color pastelBrown = Color(0xFF7C6E60);
  static const Color uFOGreen = Color(0xFF3ACC6C); // stock color
  static const Color carminePink = Color(0xFFE74C3C); // stock color
  static const Color chineseYellow = Color(0xFFFAAD00); // view all
  static const Color orange = Color(0xFFFA9A00); // wallet's convert text
  static const Color quickSilver = Color(0xFFA3A3A3);
  static const Color goldenPoppy = Color(0xFFFFC403);
  static const Color chineseSilver = Color(0xFFCCCCCC);
  static const Color eerieBlack = Color(0xFF191B1F);
  static const Color charlestonGreen2 = Color(0xFF252729);
  static const Color burlywood = Color(0xFFD6C68F);
  static const Color dimGray = Color(0xFF6C6C6C);
  static const Color brightNavyBlue = Color(0xFF1C77C6);
  static const Color lightSilver2 = Color(0xFFD6D6D7);
  static const Color flavescent = Color(0xFFFCE18B);
  static const Color lemonChiffon = Color(0xFFFFF3CB);
  static const Color nickel = Color(0xFF727272);
  static const Color lotion = Color(0xFFFAFAFA);
  static const Color silverChalice = Color(0xFFACACAC);
  static const Color charlestonGreen3 = Color(0xFF292929);
  static const Color raisinBlack = Color(0xFF212323);
  static const Color mustard = Color(0xFFFFD958);
  static const Color philippineGray2 = Color(0xFF8F9091);
  static const Color crayola = Color(0xFFFFE284);
  static const Color peachOrange = Color(0xFFFFC19A);
  static const Color blanchedAlmond = Color(0xFFFFF0C6);
  static const Color eerieBlack2 = Color(0xFF1F1F1F);
  static const Color chineseBlack = Color(0xFF121418);
  static const Color philippineSilver2 = Color(0xFFB2B2B2);
  static const Color eerieBlack3 = Color(0xFF191C20);
  static const Color eerieBlack4 = Color(0xFF1D1C1E);
  static const Color philippineGray3 = Color(0xFF919191);
  static const Color davyGrey = Color(0xFF535353);
  static const Color charlestonGreen4 = Color(0xFF2C2C2C);
  static const Color onyx2 = Color(0xFF383838);
  static const Color davyGrey2 = Color(0xFF575757);
  static const Color ceil = Color(0xFF9590E0);
  static const Color eerieBlack5 = Color(0xFF1A1A20);
  static const Color paleLavender = Color(0xFFE0D5FF);
  static const Color charlestonGreen5 = Color(0xFF2A2A2A);

  // v3 color
  static const Color antiFlashWhite = Color(0xFFF0F5F4);
  static const Color deepMossGreen = Color(0xFF385F4B);
  static const Color chineseBlack2 = Color(0xFF171717);
  static const Color eerieBlack6 = Color(0xFF14211A);
  static const Color mediumJungleGreen = Color(0xFF14211A);
  static const Color silverSand = Color(0xFFBDC8C2);
  static const Color mediumJungleGreen2 = Color(0xFF1B3B2A);
  static const Color blue = Color(0xFF0058FF);
  static const Color lightSilver3 = Color(0xFFD9D9D9);
  static const Color lavender = Color(0xFFE8DDFF);
  static const Color deepLilac = Color(0xFF8756C9);
  static const Color cultured2 = Color(0xFFF4F7F5);
  static const Color brightGray2 = Color(0xFFDBDBDB);
  static const Color darkerGray = Color(0xFF6A6A6A);
  static const Color silverSand2 = Color(0xFFB9C7BF);
  static const Color brightGray3 = Color(0xFFE4E8E4);
  static const Color brightGray4 = Color(0xFF888888);
  static const Color lightGray = Color(0xFFA8A8A8);
  static const Color lightGray2 = Color(0xFFF7F7F7);
  static const Color antiFlashWhite2 = Color(0xFFF2F3F3);
  static const Color lightGray3 = Color(0xFFBEBEBE);
  static const Color philippineSilver3 = Color(0xFFB5B5B5);
  static const Color mintCream2 = Color(0xFFF6FBFA);
  static const Color indiaGreen = Color(0xFF137B00);
  static const Color deepCarminePink = Color(0xFFFA2A2A);
  static const Color lightGray4 = Color(0xFFD7D7D7);
  static const Color antiFlashWhite3 = Color(0xFFF2F2F2);
  static const Color grayHtml = Color(0xFF7B7B7B);
  static const Color britishRacingGreen = Color(0xFF00442A);
  static const Color indiaGreen2 = Color(0xFF006A41);
  static const Color princetonOrange = Color(0xFFFA7A2A);
  static const Color safetyOrange = Color(0xFFFF7600);
  static const Color aeroBlue = Color(0xFFD4F2E6);
  static const Color lotion2 = Color(0xFFFCFCFC);
  static const Color xanadu = Color(0xFF7C8979);
  static const Color platinum = Color(0xFFE6E6E6);
  static const Color alabaster = Color(0xFFE7F2E6);
  static const Color alabaster2 = Color(0xFFE8E8E8);
  static const Color honeydew3 = Color(0xFFEFFCF4);
  static const Color black2 = Color(0xFF505050);
  static const Color matteGraphite = Color(0xFF444444);
  static const Color casualBlack = Color(0xFF181818);
  static const Color traditionalRed = Color(0xFFC2292A);
  static const Color lightGrayCamo = Color(0xFF8A909A);
  static const Color chablis = Color(0xFFFFF4F4);
  static const Color rainbowGrey = Color(0xFFC5C5C5);
}
