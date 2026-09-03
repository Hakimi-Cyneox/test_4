import 'package:flutter/material.dart';

/// use Provider.of<ThemeProvider>(context).xxxx to access data from ThemeProvider class

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = ThemeProvider._darkTheme;
  bool isLightMode = false;


  static final _darkTheme = ThemeData(useMaterial3: false);
  // //  dark theme data
  // static final _darkTheme = ThemeData(
  //   appBarTheme: AppBarTheme(color: AppColors.kDarkAppBarColor),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: AppColors.kDarkBottomNavBgColor),
  //   fontFamily: "Proxima Nova",
  //   scaffoldBackgroundColor: AppColors.kDarkBackground,
  //   // primaryColor: AppColors.kDarkBackground,
  //   primaryColorLight: AppColors.kWhite.withOpacity(0.1),
  //   iconTheme: IconThemeData(color: AppColors.kDarkIconColor),
  //   dividerColor: AppColors.kDarkBottomDividerColor,
  //   hintColor: AppColors.kHintColor,
  //   cardColor: AppColors.kLightGrey,
  //   highlightColor: AppColors.kGreen,
  //   colorScheme: const ColorScheme.dark(),
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: AppColors.kDarkTextColor),
  //   ),
  // );
  //
  // //  light theme data
  // static final _lightTheme = ThemeData(
  //   appBarTheme: AppBarTheme(color: AppColors.kLightAppBarColor),
  //   bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: AppColors.kLightBottomNavBgColor),
  //   fontFamily: "Proxima Nova",
  //   scaffoldBackgroundColor: AppColors.kLightBackground,
  //   // primaryColor: AppColors.kLightBackground,
  //   primaryColorLight: AppColors.kWhite,
  //   iconTheme: IconThemeData(color: AppColors.kLightIconColor),
  //   dividerColor: AppColors.kLightBottomDividerColor,
  //   hintColor: AppColors.kHintColor,
  //   colorScheme: const ColorScheme.light(),
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(color: AppColors.kLightTextColor),
  //   ),
  // );
  //
  // /// use this function if the apps is having the same color for dark and light theme
  // Color get scaffoldBackgroundColor => isLightMode
  //     ? _lightTheme.scaffoldBackgroundColor
  //     : _darkTheme.scaffoldBackgroundColor;
  //
  // IconThemeData get iconTheme => isLightMode
  //     ? _lightTheme.iconTheme
  //     : _darkTheme.iconTheme;
  //
  // AppBarTheme get appBarTheme => isLightMode
  //     ? _lightTheme.appBarTheme
  //     : _darkTheme.appBarTheme;
  //
  // Color get dividerColor => isLightMode
  //     ? _lightTheme.dividerColor
  //     : _darkTheme.dividerColor;
  //
  // ThemeData get getTheme => isLightMode
  //     ? _lightTheme
  //     : _darkTheme;
  //
  // // void printThemeMode() {
  // //   if (kDebugMode) {
  // //     print("ThemeMode: ${ThemeMode.system == ThemeMode.dark}");
  // //   }
  // // }
  //
  // void toggleTheme() {
  //   if (themeData == _lightTheme) {
  //     setDarkMode();
  //   } else {
  //     setLightMode();
  //   }
  //   notifyListeners();
  // }
  //
  // /// default constructor for theme
  // ThemeProvider() {
  //   // check for theme storage
  //   final defaultTheme =
  //       StorageBoxManager.instance.read(StorageKeyName().themeData);
  //   // if (kDebugMode) {
  //   //   print('value read from storage: $defaultTheme');
  //   // }
  //   if (defaultTheme != null) {
  //     var themeMode = defaultTheme ?? 'light';
  //     if (themeMode == 'light') {
  //       themeData = _lightTheme;
  //       isLightMode = true;
  //     } else {
  //       // if (kDebugMode) {
  //       //   print('setting dark theme');
  //       // }
  //       themeData = _darkTheme;
  //       isLightMode = false;
  //     }
  //   } else {
  //     var brightness = SchedulerBinding.instance.window.platformBrightness;
  //     bool isDarkMode = brightness == Brightness.dark;
  //     if (kDebugMode) {
  //       // print('this is system default theme $isDarkMode');
  //     }
  //     themeData = _lightTheme;
  //     isLightMode = true;
  //     // if (isDarkMode) {
  //     //   themeData = _darkTheme;
  //     //   isLightMode = false;
  //     // } else {
  //     //   themeData = _lightTheme;
  //     //   isLightMode = true;
  //     // }
  //   }
  //   notifyListeners();
  // }
  //
  // void setDarkMode() async {
  //   themeData = _darkTheme;
  //   isLightMode = false;
  //   if (kDebugMode) {
  //     print(themeData);
  //   }
  //   StorageBoxManager.instance.write(StorageKeyName().themeData, 'dark');
  //   notifyListeners();
  // }
  //
  // void setLightMode() async {
  //   themeData = _lightTheme;
  //   isLightMode = true;
  //   if (kDebugMode) {
  //     print(themeData);
  //   }
  //   StorageBoxManager.instance.write(StorageKeyName().themeData, 'light');
  //   notifyListeners();
  // }
}
