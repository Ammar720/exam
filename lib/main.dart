import 'package:exam/features/auth/data/models/user_model.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/auth/presentation/screens/email_verification.dart';
import 'package:exam/features/auth/presentation/screens/forget_password.dart';
import 'package:exam/features/auth/presentation/screens/login.dart';
import 'package:exam/features/auth/presentation/screens/register_screen.dart';
import 'package:exam/features/profile/presentation/screens/profile_screen.dart';
import 'package:exam/features/profile/presentation/screens/reset_password_screen.dart';

import 'package:exam/features/auth/presentation/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Exam());
}

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel(
        username: 'ahmed',
        email: 'ahmed123@gmail.com',
        createdAt: DateTime.now(),
        firstName: 'Ahmed',
        id: '12345',
        isVerified: true,
        lastName: 'Safwat',
        phone: '01010636562',
        role: 'admin');

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Login.routeName: (context) => const Login(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(user: user),
          ResetPasswordScreen.routeName: (context) =>
              const ResetPasswordScreen(),
          ForgetPassword.routeName: (context) => ForgetPassword(),
          EmailVerification.routeName: (context) => const EmailVerification(),
          ResetPassword.routeName: (context) => const ResetPassword(),
        },
        initialRoute: ProfileScreen.routeName,
        initialRoute: Login.routeName,
        theme: AppTheme.appThemeData,
      ),
    );
  }
}
