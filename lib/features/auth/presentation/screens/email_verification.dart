import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/auth/presentation/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class EmailVerification extends StatelessWidget {
  static const String routeName = '/verification';

  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();
    const String correctCode = "1234";
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
            Pinput(
              length: 4,
              controller: codeController,
              keyboardType: TextInputType.number,
              separatorBuilder: (index) => SizedBox(width: 16.w),
              validator: (pin) {
                if (pin == correctCode) {
                  return null;
                } else {
                  return "ⓘ Invalid code";
                }
              },
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
              onCompleted: (pin) {
                if (pin == correctCode) {
                  Navigator.pushNamed(context, ResetPassword.routeName);
                  codeController.clear();
                }
              },
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
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppTheme.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
