import 'package:exam/core/di/di.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/ui_utils.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/cubits/forget_password_cubit.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/states/forget_password_states.dart';
import 'package:exam/features/subjects/presentation/screens/lay_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final ForgetPasswordCubit _cubit = getIt<ForgetPasswordCubit>();

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

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
                            validator: (val) =>
                                Validator.validateConfirmPassword(
                                    val, _passwordController.text),
                            obscureText: true,
                            style: Theme.of(context).textTheme.titleMedium,
                            cursorColor: AppTheme.black,
                            decoration: InputDecoration(
                              labelText: 'Confirm password',
                              labelStyle: Theme.of(context).textTheme.bodySmall,
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                    BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
                      listener: (context, state) {
                        if (state is ForgetPasswordLoading) {
                          UIUtils.showLoading(context);
                        } else {
                          UIUtils.hideLoading(context);
                        }
                        if (state is ForgetPasswordSuccess) {
                          Navigator.pushReplacementNamed(
                            context,
                            LayOut.routeName,
                          );
                        } else if (state is ForgetPasswordError) {
                          UIUtils.showMessage(state.message);
                        }
                      },
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _cubit.resetPassword(
                                email,
                                _passwordController.text,
                              );
                            }
                          },
                          child: const Text('Reset')),
                    )
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
