import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color blue = Color(0xff02369C);
  static const Color white = Color(0xffF9F9F9);
  static const Color black = Color(0xff0F0F0F);
  static const Color gray = Color(0xff535353);
  static const Color error = Color(0xffCC1010);
  static const Color sucess = Color(0xff11CE19);
  static const Color lightBlue = Color(0xffEDEFF3);
  static const Color lightRed = Color(0xffF8D2D2);
  static const Color placeHolder = Color(0xffA6A6A6);
  static const Color verifyCode = Color(0xffdfe7f7);

  static ThemeData appThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
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
        )),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      ),
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
  );
}
