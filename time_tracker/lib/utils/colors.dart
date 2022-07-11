import 'package:flutter/material.dart';

const white = Colors.white;
const black = Colors.black;
const kPrimaryBlack = Color(0xff111317);
const kOrange = Color(0xffd26042);

Map<int, Color> color = {
  50: kPrimaryBlack.withOpacity(0.1),
  100: kPrimaryBlack.withOpacity(0.2),
  200: kPrimaryBlack.withOpacity(0.3),
  300: kPrimaryBlack.withOpacity(0.4),
  400: kPrimaryBlack.withOpacity(0.5),
  500: kPrimaryBlack.withOpacity(0.6),
  600: kPrimaryBlack.withOpacity(0.7),
  700: kPrimaryBlack.withOpacity(0.8),
  800: kPrimaryBlack.withOpacity(0.9),
  900: kPrimaryBlack,
};
MaterialColor kPrimaryColor = MaterialColor(0xff121212, color);

ThemeData get appTheme {
  return ThemeData(
    fontFamily: 'SF Pro',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: kPrimaryColor,
    primaryColor: kPrimaryBlack,
    cardColor: Colors.transparent,
    scaffoldBackgroundColor: kPrimaryBlack,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  );
}
