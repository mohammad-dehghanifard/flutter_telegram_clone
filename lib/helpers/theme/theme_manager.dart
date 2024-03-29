import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager{
  ThemeManager._();

  static ThemeData light = ThemeData(
    fontFamily: "yekanBakh",
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    dividerColor: const Color(0xFFB6C2D2),
    hintColor: const Color(0xFFA8A8A8),
    iconTheme: const IconThemeData(
      color: Color(0xFF0C5EDA),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF702DFF),
      secondary: Color(0xFF0C5EDA),
      onSecondary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFDAF2FF),
      secondaryContainer: Color(0xFFF1F1F1),
      tertiary: Color(0xFFF6F6F6),
    ),
    textTheme: _textTheme
  );

  static ThemeData dark = ThemeData(
      fontFamily: "yekanBakh",
      scaffoldBackgroundColor: const Color(0xFF212121),
      dividerColor: const Color(0xFFB6C2D2),
      hintColor: const Color(0xFFA8A8A8),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF702DFF),
        secondary: Color(0xFF0C5EDA),
        onSecondary: Color(0xFFFFFFFF),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF00293E),
        secondaryContainer: Color(0xFF292929),
        tertiary: Color(0xFF333333),
      ),
      textTheme: _textTheme
  );

  static const TextTheme _textTheme = TextTheme(
    bodyMedium: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
    bodySmall: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF7D7D7D)),
    titleLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),
    titleMedium: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
    titleSmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
  );

  static Future<void> changeTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if(Get.isDarkMode){
      Get.changeTheme(light);
      await preferences.setString("theme","light");
    } else {
      Get.changeTheme(dark);
      await preferences.setString("theme","dark");
    }
  }

  static Future<void> loadTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final theme = preferences.getString("theme");
    if(theme != null){
      if(theme == 'light'){
        Get.changeTheme(light);
      } else {
        Get.changeTheme(dark);
      }
    }
  }


}