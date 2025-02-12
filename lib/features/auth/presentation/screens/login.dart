import 'package:exam/core/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: false,
          leading: Icon(Icons.arrow_back_ios),
          titleSpacing: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: AppTheme.black),
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    hintText: "Enter your email"),
              ),
              SizedBox(
                height: 24.sp,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: AppTheme.black),
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    hintText: "Enter your Password"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    InkWell(onTap: () {}, child: Icon(Icons.square_outlined)),
                    Text("Remmember me"),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
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
                    child: Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(16),
                                backgroundColor: AppTheme.blue,
                                foregroundColor: AppTheme.white),
                            onPressed: () {},
                            child: Text("Login"))),
                  ),
                ],
              ),
              SizedBox(
                height: 16.sp,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Don't have an account?"),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppTheme.blue,
                          decoration: TextDecoration.underline),
                    ))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
