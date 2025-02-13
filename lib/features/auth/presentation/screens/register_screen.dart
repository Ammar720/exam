import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/presentation/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Done')),
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
        title: const Text('Sign up'),
        titleSpacing: 16.w,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      validator: Validator.validateUsername,
                      decoration: InputDecoration(
                        labelText: 'User name',
                        labelStyle: labelTextStyle,
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your user name',
                        hintStyle: hintTextStyle,
                        contentPadding: EdgeInsets.all(16.sp),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            validator: Validator.validateFirstName,
                            decoration: InputDecoration(
                              labelText: 'First name',
                              labelStyle: labelTextStyle,
                              border: const OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Enter first name',
                              hintStyle: hintTextStyle,
                              contentPadding: EdgeInsets.all(16.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 17.w),
                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            validator: Validator.validateLastName,
                            decoration: InputDecoration(
                              labelText: 'Last name',
                              labelStyle: labelTextStyle,
                              border: const OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Enter last name',
                              hintStyle: hintTextStyle,
                              contentPadding: EdgeInsets.all(16.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      controller: _emailController,
                      validator: Validator.validateEmail,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: labelTextStyle,
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter your email',
                        hintStyle: hintTextStyle,
                        contentPadding: EdgeInsets.all(16.sp),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            validator: Validator.validatePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: labelTextStyle,
                              border: const OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Enter password',
                              hintStyle: hintTextStyle,
                              contentPadding: EdgeInsets.all(16.sp),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        SizedBox(width: 17.w),
                        Expanded(
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            validator: (val) =>
                                Validator.validateConfirmPassword(
                                    val, _passwordController.text),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm password',
                              labelStyle: labelTextStyle,
                              border: const OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintText: 'Confirm password',
                              hintStyle: hintTextStyle,
                              contentPadding: EdgeInsets.all(16.sp),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    TextFormField(
                      validator: Validator.validatePhoneNumber,
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Phone number',
                        labelStyle: labelTextStyle,
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter phone number',
                        hintStyle: hintTextStyle,
                        contentPadding: EdgeInsets.all(16.sp),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 40.h),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, Login.routeName),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: AppTheme.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16.sp),
                      ))
                ],
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
