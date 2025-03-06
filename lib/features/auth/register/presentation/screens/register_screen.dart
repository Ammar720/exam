import 'package:exam/core/di/di.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/login/presentation/view/screens/login.dart';
import 'package:exam/features/auth/register/domain/entities/register_request_entity.dart';
import 'package:exam/features/auth/register/presentation/cubit/register_state.dart';
import 'package:exam/features/auth/register/presentation/cubit/register_view_model.dart';
import 'package:exam/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign up'),
          centerTitle: false,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'User name',
                          border: const OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter your user name',
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: 'First name',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Enter first name',
                                contentPadding: EdgeInsets.all(16.sp),
                              ),
                            ),
                          ),
                          SizedBox(width: 17.w),
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameController,
                              validator: Validator.validateLastName,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                labelText: 'Last name',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Enter last name',
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: const OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter your email',
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Enter password',
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Confirm password',
                                border: const OutlineInputBorder(),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'Confirm password',
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          border: const OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter phone number',
                          contentPadding: EdgeInsets.all(16.sp),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 40.h),
                      BlocConsumer<RegisterViewModel, RegisterState>(
                        listener: (context, state) {
                          if (state.status == Status.success) {
                            Navigator.pushReplacementNamed(
                                context, ProfileScreen.routeName);
                          }
                          if (state.status == Status.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(state.exception.toString())),
                            );
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                state.status == Status.loading
                                    ? AppTheme.lightGray
                                    : AppTheme.blue,
                              ),
                            ),
                            onPressed: state.status == Status.loading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context
                                          .read<RegisterViewModel>()
                                          .register(RegisterRequestEntity(
                                            username: _userNameController.text,
                                            email: _emailController.text,
                                            firstName:
                                                _firstNameController.text,
                                            lastName: _lastNameController.text,
                                            password: _passwordController.text,
                                            rePassword:
                                                _confirmPasswordController.text,
                                            phone: _phoneNumberController.text,
                                          ));
                                    }
                                  },
                            child: state.status == Status.loading
                                ? SizedBox(
                                    width: double.infinity,
                                    height: 30.h,
                                    child: Center(
                                      child: Transform.scale(
                                        scale: 4,
                                        child: Lottie.asset(
                                          'assets/lottie/loading_lottie.json',
                                        ),
                                      ),
                                    ))
                                : Text(
                                    'Signup',
                                    style: TextStyle(
                                        color: AppTheme.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                          );
                        },
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
      ),
    );
  }
}
