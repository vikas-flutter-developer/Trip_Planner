//app_theme.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6C63FF),
    scaffoldBackgroundColor: const Color(0xFFF9F9F9),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6C63FF),
      secondary: Color(0xFF779C96),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFD35A45),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF1320B3),
      ),
      bodyMedium: TextStyle(fontSize: 16.sp, color: Colors.black87),
      bodySmall: TextStyle(fontSize: 14.sp, color: Colors.grey),
      titleLarge: TextStyle(fontSize: 25.sp, color: Colors.black),
      titleMedium: TextStyle(fontSize: 18.sp, color: Colors.black),
      titleSmall: TextStyle(fontSize: 12.sp, color: Colors.black),
      labelLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF779C96),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xFF5685DD),
      foregroundColor: Colors.black,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 5,
      shadowColor: Colors.black26,
    ),
  );










  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF6C63FF),
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6C63FF),
      secondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF0E0D0D),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent),
      bodyMedium: TextStyle(fontSize: 16.sp, color: Colors.grey[300]),
      bodySmall: TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
      titleLarge: TextStyle(fontSize: 22.sp, color: Colors.white),
      titleMedium: TextStyle(fontSize: 18.sp, color: Colors.white70),
      titleSmall: TextStyle(fontSize: 12.sp, color: Colors.white54),
      labelLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 5,
      shadowColor: Colors.white12,
    ),
  );
}
