import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/exams/presentation/view/screens/exams.dart';
import 'package:exam/features/questions/domain/entities/check_questions_entity.dart';
import 'package:exam/features/questions/presentation/view/screens/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ExamScore extends StatelessWidget {
  static const routeName = '/exam_score';
  const ExamScore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final CheckQuestionsEntity result = args['result'] as CheckQuestionsEntity;
    final Exam exam = args['exam'] as Exam;

    double correctPercentage =
        double.tryParse(result.total.replaceAll('%', '')) ?? 0;
    String formattedPercentage = correctPercentage.toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Score'),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, Exams.routeName),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 40.h),
          Text(
            'Your score',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              SizedBox(
                height: 120.h,
                width: 121.w,
                child: CircularPercentIndicator(
                  radius: 60.r,
                  lineWidth: 7.w,
                  percent:  correctPercentage/100 ,
                  animation: true,
                  animationDuration: 1200,
                  center: Text(
                    "$formattedPercentage%",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Color(0xff373737), fontSize: 20.sp),
                  ),
                  progressColor: AppTheme.blue,
                  backgroundColor: AppTheme.error,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressBorderColor: AppTheme.white,
                  backgroundWidth: 6.w,
                ),
              ),
              SizedBox(width: 28.5.w),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 18.w),
                child: Column(children: [
                  Row(children: [
                    Text(
                      'Correct',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppTheme.blue),
                    ),
                    SizedBox(width: 85.w),
                    Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(110.r),
                        border: Border.all(color: AppTheme.blue),
                      ),
                      child: Center(
                        child: Text(
                          result.correct.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.blue, fontSize: 13.sp),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(height: 8.h),
                  Row(children: [
                    Text(
                      'Incorrect',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppTheme.error),
                    ),
                    SizedBox(width: 76.w),
                    Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(110.r),
                        border: Border.all(color: AppTheme.error),
                      ),
                      child: Center(
                        child: Text(
                          result.wrong.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.error, fontSize: 13.sp),
                        ),
                      ),
                    )
                  ])
                ]),
              )
            ],
          ),
          SizedBox(height: 80.h),
          ElevatedButton(onPressed: () {}, child: Text('Show results')),
          SizedBox(height: 24.h),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Questions.routeName,
                    arguments: exam);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.white,
                foregroundColor: AppTheme.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  side: BorderSide(
                    color: AppTheme.blue,
                    width: 1.w,
                  ),
                ),
              ),
              child: Text('Start again')),
        ]),
      ),
    );
  }
}
