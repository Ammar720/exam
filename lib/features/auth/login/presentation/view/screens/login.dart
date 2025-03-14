import 'package:exam/core/di/di.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/utils/ui_utils.dart';
import 'package:exam/core/utils/validator.dart';
import 'package:exam/features/auth/forgetPassword/presentation/view/screens/forget_password.dart';
import 'package:exam/features/auth/login/presentation/viewModel/cubits/login_cubit.dart';
import 'package:exam/features/auth/login/presentation/viewModel/states/login_states.dart';
import 'package:exam/features/auth/register/presentation/screens/register_screen.dart';
// import 'package:exam/features/exam/explore/presentation/screens/lay_out.dart';
import 'package:exam/features/subjects/presentation/screens/lay_out.dart';
import 'package:exam/features/subjects/presentation/screens/survay.dart';
// import 'package:exam/features/subjects/presentation/view/screens/subjects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final LoginCubit _cubit = getIt<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (_) => _cubit,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
            titleSpacing: 16.w,
            centerTitle: false,
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
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
                          hintText: "Enter your email",
                        ),
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
                          hintText: "Enter your Password",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: const Icon(Icons.square_outlined)),
                      const Text("Remmember me"),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ForgetPassword.routeName);
                        },
                        child: const Text(
                          "Forget password?",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
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
                    BlocListener<LoginCubit, LoginStates>(
                      listener: (context, state) {
                        if (state is LoginLoading) {
                          UIUtils.showLoading(context);
                        } else {
                          UIUtils.hideLoading(context);
                        }
                        if (state is LoginSuccess) {
                          Navigator.pushNamed(context, Survay.routeName,
                              arguments: _emailController.text);
                        } else if (state is LoginError) {
                          UIUtils.showMessage(state.message);
                        }
                      },
                      child: Expanded(
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
        ));
  }
}
