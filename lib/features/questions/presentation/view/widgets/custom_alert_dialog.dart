import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/questions/domain/entities/check_questions_entity.dart';
import 'package:exam/features/questions/presentation/cubit/questions_cubit.dart';
import 'package:exam/features/questions/presentation/cubit/questions_states.dart';
import 'package:exam/features/questions/presentation/view/screens/exam_score.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAlertDialog extends StatelessWidget {
  final int timeSpent;
  final QuestionsCubit questionsCubit;
  final Exam exam;
  const CustomAlertDialog(
      {super.key,
      required this.timeSpent,
      required this.questionsCubit,
      required this.exam});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      content: SizedBox(
        width: 289.w,
        height: 230.h,
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/images/sand-clock 1.png',
                  fit: BoxFit.fill,
                  width: 45.w,
                  height: 86.h,
                ),
                Text("Time out!!",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 24.sp, color: AppTheme.error)),
              ]),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    ExamScore.routeName,
                    arguments: {
                      'result': (questionsCubit.state
                          as QuestionsSuccess<CheckQuestionsEntity>).questions,
                      'exam': exam
                    },
                  );
                },
                child: Text("View Score"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
