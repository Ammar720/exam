import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/features/exams/presentation/view/screens/exams.dart';
import 'package:exam/features/questions/presentation/view/widgets/choice_item.dart';
import 'package:exam/features/questions/presentation/view/widgets/custom_alert_dialog.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Questions extends StatefulWidget {
  static const routeName = '/questions';
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  static const int examDuration = 60 * 20;
  late DateTime endTime;
  final ValueNotifier<int?> selectedAnswer = ValueNotifier<int?>(null);
  final ValueNotifier<Color> counterColor =
      ValueNotifier<Color>(AppTheme.success);

  List<String> answers = [
    "Its going to rain today.",
    "Its going to rain today.",
    "Its going to rain today.",
    "Its going to rain today.",
  ];

  @override
  void initState() {
    super.initState();
    endTime = DateTime.now().add(Duration(seconds: examDuration));
  }

  @override
  void dispose() {
    selectedAnswer.dispose();
    super.dispose();
  }

  void _onExamEnd() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomAlertDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, Exams.routeName),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          Image.asset(
            'assets/images/image 2.png',
            fit: BoxFit.fill,
            height: 30.h,
            width: 24.w,
          ),
          SizedBox(width: 10.w),
          ValueListenableBuilder<Color>(
            valueListenable: counterColor,
            builder: (context, value, child) => TimerCountdown(
              format: CountDownTimerFormat.minutesSeconds,
              endTime: endTime,
              onEnd: _onExamEnd,
              enableDescriptions: false,
              timeTextStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20.sp, color: counterColor.value),
              spacerWidth: 2.w,
              colonsTextStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20.sp, color: counterColor.value),
              onTick: (Duration timeLeft) {
                if (timeLeft.inSeconds <= 60 * 5) {
                  counterColor.value = AppTheme.error;
                }
              },
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            'Question 1 of 20',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
          LinearProgressIndicator(
            value: 1 / 20,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.blue),
            backgroundColor: AppTheme.lightBlack,
            minHeight: 4.h,
          ),
          SizedBox(height: 28.h),
          Text(
            'Select the correctly punctuated sentence.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 24.h),
          Column(
            children: List.generate(
              answers.length,
              (index) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedAnswer.value = index;
                    },
                    child: ValueListenableBuilder<int?>(
                      valueListenable: selectedAnswer,
                      builder: (context, selectedIndex, child) {
                        return ChoiceItem(
                          index: index,
                          selectedAnswer: selectedIndex,
                          answers: answers,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 80.h),
          Row(children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(163.w, 48.h),
                backgroundColor: AppTheme.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(
                    color: AppTheme.blue,
                  ),
                ),
              ),
              child: Text(
                'Back',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppTheme.blue,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(width: 16.w),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(163.w, 48.h),
                backgroundColor: AppTheme.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    side: BorderSide(
                      color: AppTheme.white,
                    )),
              ),
              child: Text(
                'Next',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppTheme.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
