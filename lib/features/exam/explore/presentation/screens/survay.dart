import 'package:exam/core/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Survay extends StatelessWidget {
  static const String routeName = "/survay";
  const Survay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Survey",
          style: TextStyle(color: AppTheme.blue),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.sp)),
              ),
            ),
            SizedBox(
              height: 40.sp,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Browse by subject",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 43.sp,
            ),
            Container(
              height: 80.sp,
              width: 343.sp,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.lightBlue,
              ),
              child: Row(
                children: [
                  Icon(Icons.abc),
                  Text("Languge"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
