import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/forgetPassword/presentation/screens/forget_password.dart';
import 'package:exam/features/auth/register/presentation/screens/register_screen.dart';
import 'package:exam/features/exam/explore/presentation/screens/lay_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        titleSpacing: 16.w,
        centerTitle: false,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    style: AppTheme.appThemeData.textTheme.bodyLarge
                        ?.copyWith(color: AppTheme.black),
                    validator: Validator.validateEmail,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: AppTheme.appThemeData.textTheme.bodySmall
                            ?.copyWith(color: AppTheme.black),
                        focusedBorder: const OutlineInputBorder(),
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: "Enter your email"),
                  ),
                  SizedBox(
                    height: 24.sp,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    style: AppTheme.appThemeData.textTheme.bodyLarge
                        ?.copyWith(color: AppTheme.black),
                    validator: Validator.validatePassword,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: AppTheme.appThemeData.textTheme.bodySmall
                            ?.copyWith(color: AppTheme.black),
                        focusedBorder: const OutlineInputBorder(),
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(),
                        errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: "Enter your Password"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {}, child: const Icon(Icons.square_outlined)),
                  const Text("Remmember me"),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetPassword.routeName);
                    },
                    child: const Text(
                      "Forget password?",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.sp,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, LayOut.routeName);
                        }
                      },
                      child: Text(
                        "Login",
                        style: AppTheme.appThemeData.textTheme.titleMedium
                            ?.copyWith(color: AppTheme.white),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 16.sp,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account?"),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RegisterScreen.routeName);
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: AppTheme.blue,
                        decoration: TextDecoration.underline),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
