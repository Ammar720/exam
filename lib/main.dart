import 'package:exam/features/auth/presentation/screens/login.dart';
import 'package:exam/features/auth/presentation/screens/register_screen.dart';
import 'package:exam/features/exam/explore/presentation/screens/languages.dart';
import 'package:exam/features/exam/explore/presentation/screens/lay_out.dart';
import 'package:exam/features/exam/explore/presentation/screens/survay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Exam());
}

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Login.routeName: (context) => const Login(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          LayOut.routeName: (context) => const LayOut(),
          Survay.routeName: (context) => const Survay(),
          Languages.routeName: (context) => const Languages(),
        },
        initialRoute: Languages.routeName,
      ),
    );
  }
}
