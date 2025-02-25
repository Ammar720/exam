import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/register/data/models/user_model.dart';
import 'package:exam/features/profile/presentation/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});
  // final UserModel user;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserModel user = UserModel(
      username: 'ahmed',
      email: 'ahmed123@gmail.com',
      createdAt: DateTime.now(),
      firstName: 'Ahmed',
      id: '12345',
      isVerified: true,
      lastName: 'Safwat',
      phone: '01010636562',
      role: 'admin');
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    _userNameController.text = user.username!;
    _firstNameController.text = user.firstName!;
    _lastNameController.text = user.lastName!;
    _emailController.text = user.email!;
    _phoneNumberController.text = user.phone!;

    _userNameController.addListener(_checkIfEdited);
    _firstNameController.addListener(_checkIfEdited);
    _lastNameController.addListener(_checkIfEdited);
    _emailController.addListener(_checkIfEdited);
    _phoneNumberController.addListener(_checkIfEdited);
  }

  void _checkIfEdited() {
    setState(() {
      _isButtonEnabled = _userNameController.text != user.username ||
          _firstNameController.text != user.firstName ||
          _lastNameController.text != user.lastName ||
          _emailController.text != user.email ||
          _phoneNumberController.text != user.phone;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile Updated Successfully!')),
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
        centerTitle: false,
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(81.r)),
                    child: Image.network(
                      'https://media.istockphoto.com/id/1388253782/photo/positive-successful-millennial-business-professional-man-head-shot-portrait.jpg?b=1&s=612x612&w=0&k=20&c=VsTsa0kjyZ7ALe-nyKAUfynyRxZo8H4LRMdu_ecPuOY=',
                      width: 81.w,
                      height: 81.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                          color: AppTheme.liteBlue,
                          borderRadius: BorderRadius.all(Radius.circular(6.r))),
                      child: Icon(
                        Icons.photo_camera_outlined,
                        color: AppTheme.white,
                        size: 16.sp,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userNameController,
                      validator: Validator.validateUsername,
                      // initialValue: _userNameController.text,
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
                    TextFormField(
                      validator: Validator.validatePassword,
                      initialValue: 'Password',
                      readOnly: true,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: 'Password',
                        labelStyle: labelTextStyle,
                        border: const OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter password',
                        hintStyle: hintTextStyle,
                        suffix: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ResetPasswordScreen.routeName);
                          },
                          child: Text(
                            'Change',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppTheme.blue,
                            ),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '★',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppTheme.lightGray,
                        fontWeight: FontWeight.w600,
                      ),
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
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: AppTheme.lightGray,
                        backgroundColor: AppTheme.blue,
                        fixedSize: Size(343.w, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        // backgroundColor:
                        //     _isButtonEnabled ? AppTheme.gray : AppTheme.blue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 10.h),
                      ),
                      onPressed: _isButtonEnabled ? _submitForm : null,
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
            ],
          ),
        ),
      ),
    );
  }
}
