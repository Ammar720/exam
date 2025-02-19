import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = '/reset-password';
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    Text(
                      'Reset password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Password must not be empty and must contain 6 characters with upper case letter and one number at least ',
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
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _passwordController,
                          validator: Validator.validatePassword,
                          obscureText: true,
                          style: Theme.of(context).textTheme.titleMedium,
                          cursorColor: AppTheme.black,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 24.h),
                        TextFormField(
                          controller: _confirmPasswordController,
                          validator: (val) => Validator.validateConfirmPassword(
                              val, _passwordController.text),
                          obscureText: true,
                          style: Theme.of(context).textTheme.titleMedium,
                          cursorColor: AppTheme.black,
                          decoration: InputDecoration(
                            labelText: 'Confirm password',
                            labelStyle: Theme.of(context).textTheme.bodySmall,
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Confirm password',
                            hintStyle: Theme.of(context).textTheme.bodyLarge,
                            contentPadding: EdgeInsets.all(16.sp),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 48.h),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('Reset'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
