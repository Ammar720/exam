import 'package:exam/core/app_bloc_observer.dart';
import 'package:exam/core/di/di.dart';
import 'package:exam/features/auth/core/presentation/cubit/token_cubit.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/auth/forgetPassword/presentation/view/screens/email_verification.dart';
import 'package:exam/features/auth/forgetPassword/presentation/view/screens/forget_password.dart';
import 'package:exam/features/auth/login/presentation/view/screens/login.dart';
import 'package:exam/features/auth/register/presentation/screens/register_screen.dart';
import 'package:exam/features/exams/presentation/view/screens/start_exam.dart';
import 'package:exam/features/profile/presentation/screens/profile_screen.dart';
import 'package:exam/features/profile/presentation/screens/reset_password_screen.dart';

import 'package:exam/features/auth/forgetPassword/presentation/view/screens/reset_password.dart';
import 'package:exam/features/exams/presentation/view/screens/exams.dart';
import 'package:exam/features/subjects/presentation/screens/lay_out.dart';
import 'package:exam/features/subjects/presentation/screens/survay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = AppBlocObserver();
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
              ProfileScreen.routeName: (context) => ProfileScreen(),
              ResetPasswordScreen.routeName: (context) =>
                  const ResetPasswordScreen(),
              ForgetPassword.routeName: (context) => ForgetPassword(),
              EmailVerification.routeName: (context) =>
                  const EmailVerification(),
              ResetPassword.routeName: (context) => const ResetPassword(),
              LayOut.routeName: (context) => const LayOut(),
              Survay.routeName: (context) => const Survay(),
              Exams.routeName: (context) => const Exams(),
              StartExam.routeName: (context) => const StartExam(),
            },
            initialRoute: token == null ? Login.routeName : LayOut.routeName,
            theme: AppTheme.appThemeData,
          );
        },
      ),
    );
  }
}
