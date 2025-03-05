import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color blue = Color(0xff02369C);
  static const Color liteBlue = Color(0xff5679BD);
  static const Color white = Color(0xffF9F9F9);
  static const Color black = Color(0xff0F0F0F);
  static const Color gray = Color(0xff535353);
  static const Color lightGray = Color(0xff5F5F5F);
  static const Color error = Color(0xffCC1010);
  static const Color success = Color(0xff11CE19);
  static const Color lightBlue = Color(0xffEDEFF3);
  static const Color lightRed = Color(0xffF8D2D2);
  static const Color placeHolder = Color(0xffA6A6A6);
  static const Color verifyCode = Color(0xffdfe7f7);
  static const Color boxShadow = Color(0x2A292940);

  static final TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      color: black,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
    ),
    titleMedium: TextStyle(
      color: black,
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
    ),
    bodyLarge: TextStyle(
      color: placeHolder,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
    ),
    bodySmall: TextStyle(
      color: gray,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
    ),
  );

  static ThemeData appThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleSpacing: 12.w,
      titleTextStyle: textTheme.titleLarge,
      centerTitle: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(blue),
        foregroundColor: const WidgetStatePropertyAll(white),
        minimumSize: WidgetStatePropertyAll(Size(343.w, 48.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: textTheme.bodyLarge,
      hintStyle: textTheme.bodyLarge,
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.all(16.sp),
    
    ),
  );
}
