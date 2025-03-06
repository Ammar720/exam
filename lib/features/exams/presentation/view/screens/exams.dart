import 'package:exam/core/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Exams extends StatelessWidget {
  static const String routeName = "/exams";
  const Exams({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Languge"),
          centerTitle: false,
          leading: const Icon(Icons.arrow_back_ios_new),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text("English"),
              Container(
                color: AppTheme.placeHolder,
                height: 150.sp,
                width: 400.sp,
                child: const Row(
                  children: [
                    Icon(
                      Icons.ac_unit_rounded,
                      size: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("High level"),
                              SizedBox(
                                width: 30,
                              ),
                              Text("30 minute")
                            ],
                          ),
                          Text("30 Question"),
                          Row(
                            children: [
                              Text("from: 1.0"),
                              SizedBox(
                                width: 30,
                              ),
                              Text("from: 1.0")
                            ],
                          )
                        ],
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
