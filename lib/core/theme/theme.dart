import 'package:client/core/helper/utils/pallets.dart';
import 'package:client/views/widgets/tab_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF00BF6D);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: Pallets.primary100),
      textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Pallets.primaryText),
      colorScheme: ColorScheme.light(
          primary: Pallets.primaryText,
          secondary: kSecondaryColor,
          error: kErrorColor),
      cardTheme: CardTheme(
          elevation: 2,
          shadowColor: Pallets.grey.withOpacity(.4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          color: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          backgroundColor: Colors.white,
          selectedItemColor: Pallets.primary100,
          selectedLabelStyle:
              TextStyle(color: Pallets.primary100, fontSize: 14),
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          unselectedItemColor: Pallets.primary100,
          selectedIconTheme: IconThemeData(color: kPrimaryColor),
          showUnselectedLabels: false,
          showSelectedLabels: false),
      tabBarTheme: TabBarTheme(
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        unselectedLabelColor: Pallets.lightShade,
        labelColor: Pallets.white,
        indicator: IndicatorDecoration(
            indicatorColor: Pallets.lightShade,
            indicatorHeight: 8,
            indicatorSize: IndicatorSize.normal),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Pallets.primaryText),
          borderRadius: BorderRadius.circular(5.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Pallets.primaryText),
          borderRadius: BorderRadius.circular(5.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Pallets.primaryText),
          borderRadius: BorderRadius.circular(5.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            onPrimary: Pallets.white,
            primary: Pallets.primary100,
            minimumSize: Size(374.w, 45.h),
            side: BorderSide(color: Pallets.primary100)),
      ),
      dividerColor: Pallets.primary100);
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Pallets.primaryText,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Pallets.primaryText,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

final appBarTheme = AppBarTheme(
    centerTitle: false, backgroundColor: Pallets.primary100, elevation: 0);
