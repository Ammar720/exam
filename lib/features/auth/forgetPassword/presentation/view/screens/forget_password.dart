import 'package:exam/core/di/di.dart';
import 'package:exam/core/utils/ui_utils.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/forgetPassword/presentation/view/screens/email_verification.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/cubits/forget_password_cubit.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/states/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:exam/core/resources/app_theme.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = '/forget';

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final ForgetPasswordCubit _cubit = getIt<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (_) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Password"),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                    BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
                      listener: (context, state) {
                        if (state is ForgetPasswordLoading) {
                          UIUtils.showLoading(context);
                        } else {
                          UIUtils.hideLoading(context);
                        }
                        if (state is ForgetPasswordSuccess) {
                          Navigator.pushNamed(
                              context, EmailVerification.routeName,
                              arguments: _emailController.text);
                        } else if (state is ForgetPasswordError) {
                          UIUtils.showMessage(state.message);
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _cubit.enterEmail(_emailController.text);
                          }
                        },
                        child: const Text('Continue'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
