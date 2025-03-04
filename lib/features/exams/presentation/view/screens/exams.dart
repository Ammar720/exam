import 'package:exam/features/exams/presentation/view/screens/start_exam.dart';
import 'package:exam/features/exams/presentation/view/widgets/exam_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Exams extends StatelessWidget {
  static const String routeName = "/exams";
  const Exams({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Languages"),
        centerTitle: false,
        leading: const Icon(Icons.arrow_back_ios_new),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "English",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, __) =>  InkWell(
                  onTap: () => Navigator.pushReplacementNamed(context, StartExam.routeName),
                  child: ExamItem()),
                itemCount: 3,
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
