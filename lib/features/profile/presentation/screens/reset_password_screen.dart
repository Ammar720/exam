import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/resetPassword';
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Updated Successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle labelTextStyle = TextStyle(
      color: AppTheme.gray,
      letterSpacing: 0.4.sp,
    );
    final TextStyle hintTextStyle = TextStyle(
      color: AppTheme.placeHolder,
      fontSize: 14.sp,
      letterSpacing: 0.5.sp,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset PassWord'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _currentPasswordController,
                      validator: Validator.validatePassword,
                      decoration: InputDecoration(
                        labelText: 'Current password',
                        labelStyle: labelTextStyle,
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter Current password',
                        hintStyle: hintTextStyle,
                        contentPadding: EdgeInsets.all(16.sp),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: _newPasswordController,
                      validator: Validator.validatePassword,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'New password',
                        labelStyle: labelTextStyle,
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter New password',
                        hintStyle: hintTextStyle,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      validator: (val) => Validator.validateConfirmPassword(
                          val, _newPasswordController.text),
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: labelTextStyle,
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter Confirm password',
                        hintStyle: hintTextStyle,
                        contentPadding: EdgeInsets.all(16.sp),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(height: 40.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(343.w, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        backgroundColor: AppTheme.blue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 10.h),
                      ),
                      onPressed: _submitForm,
                      child: Text(
                        'Update',
                        style: TextStyle(
                          color: AppTheme.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
