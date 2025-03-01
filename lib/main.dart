import 'package:exam/core/di/di.dart';
import 'package:exam/features/auth/core/presentation/cubit/token_cubit.dart';
import 'package:exam/features/auth/register/data/models/user_model.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/auth/forgetPassword/presentation/view/screens/email_verification.dart';
import 'package:exam/features/auth/forgetPassword/presentation/view/screens/forget_password.dart';
import 'package:exam/features/auth/login/presentation/view/screens/login.dart';
import 'package:exam/features/auth/register/presentation/screens/register_screen.dart';
import 'package:exam/features/profile/presentation/screens/profile_screen.dart';
import 'package:exam/features/profile/presentation/screens/reset_password_screen.dart';

import 'package:exam/features/auth/forgetPassword/presentation/view/screens/reset_password.dart';
import 'package:exam/features/exam/explore/presentation/screens/languages.dart';
import 'package:exam/features/exam/explore/presentation/screens/lay_out.dart';
import 'package:exam/features/exam/explore/presentation/screens/survay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final tokenCubit = getIt<TokenCubit>();
  await tokenCubit.loadToken();

  runApp(
    BlocProvider<TokenCubit>.value(
      value: tokenCubit,
      child: const Exam(),
    ),
  );
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
      builder: (_, __) => BlocBuilder<TokenCubit, String?>(
        builder: (context, token) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              Login.routeName: (context) => const Login(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              ProfileScreen.routeName: (context) => ProfileScreen(user: user),
              ResetPasswordScreen.routeName: (context) =>
                  const ResetPasswordScreen(),
              ForgetPassword.routeName: (context) => ForgetPassword(),
              EmailVerification.routeName: (context) =>
                  const EmailVerification(),
              ResetPassword.routeName: (context) => const ResetPassword(),
              LayOut.routeName: (context) => const LayOut(),
              Survay.routeName: (context) => const Survay(),
              Languages.routeName: (context) => const Languages(),
            },
            initialRoute: token != null ? LayOut.routeName : Login.routeName,
            theme: AppTheme.appThemeData,
          );
        },
      ),
    );
  }
}
