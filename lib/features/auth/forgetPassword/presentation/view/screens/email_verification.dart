import 'package:exam/core/di/di.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/ui_utils.dart';
import 'package:exam/features/auth/forgetPassword/presentation/view/screens/reset_password.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/cubits/forget_password_cubit.dart';
import 'package:exam/features/auth/forgetPassword/presentation/viewModel/states/forget_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class EmailVerification extends StatefulWidget {
  static const String routeName = '/verification';

  const EmailVerification({
    super.key,
  });

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final ForgetPasswordCubit _cubit = getIt<ForgetPasswordCubit>();
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider<ForgetPasswordCubit>(
      create: (_) => _cubit,
      child: Scaffold(
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
                      'Email verification',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Please enter your code that send to your email address ',
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
              BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
                listener: (context, state) {
                  print("Current State: $state"); // Debugging

                  if (state is ForgetPasswordLoading) {
                    UIUtils.showLoading(context);
                  } else {
                    UIUtils.hideLoading(context);
                  }

                  if (state is ForgetPasswordSuccess) {
                    Navigator.pushNamed(
                      context,
                      ResetPassword.routeName,
                    );
                  } else if (state is ResendOTPSuccess) {
                    UIUtils.showMessage('OTP resent to your email');
                  } else if (state is ForgetPasswordError) {
                    UIUtils.showMessage(state.message);
                  }
                },
                child: Pinput(
                  length: 6,
                  controller: _pinController,
                  keyboardType: TextInputType.number,
                  separatorBuilder: (index) => SizedBox(width: 16.w),
                  onCompleted: (pin) {
                    _cubit.verfiyResetCode(pin);
                    _pinController.clear();
                  },
                  // validator: (pin) {
                  // if (pin == correctCode) {
                  //   return null;
                  // } else {
                  //   return "ⓘ Invalid code";
                  // }
                  // },
                  defaultPinTheme: PinTheme(
                    width: 74.w,
                    height: 68.h,
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    decoration: BoxDecoration(
                      color: AppTheme.verifyCode,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 74.w,
                    height: 68.h,
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppTheme.blue, width: 1),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 74.w,
                    height: 68.h,
                    textStyle: Theme.of(context).textTheme.titleLarge,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppTheme.blue, width: 1),
                    ),
                  ),
                  errorPinTheme: PinTheme(
                    width: 74.w,
                    height: 68.h,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppTheme.error, width: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didnt receive code?',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () => {_cubit.enterEmail(email, isResend: true)},
                    child: Text("Resend Code",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppTheme.blue)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
