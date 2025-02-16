import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/presentation/screens/email_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam/core/resources/app_theme.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = '/forget';

  ForgetPassword({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                children: [
                  Text(
                    'Forget Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Please enter your email associated to your account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppTheme.gray),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    style: Theme.of(context).textTheme.titleMedium,
                    controller: _emailController,
                    validator: Validator.validateEmail,
                    cursorColor: AppTheme.black,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
                SizedBox(height: 48.h),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, EmailVerification.routeName);
                      }
                    },
                    child: const Text('Continue'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
