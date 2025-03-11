import 'package:exam/core/di/di.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:exam/core/widgets/error_indicator.dart';
import 'package:exam/core/widgets/loding_indicator.dart';
import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/exams/presentation/view/screens/exams.dart';
import 'package:exam/features/questions/domain/entities/question.dart';
import 'package:exam/features/questions/presentation/cubit/questions_cubit.dart';
import 'package:exam/features/questions/presentation/cubit/questions_states.dart';
import 'package:exam/features/questions/presentation/view/widgets/choice_item.dart';
import 'package:exam/features/questions/presentation/view/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final bool isAnswered = false;
  final ValueNotifier<Color> counterColor =
      ValueNotifier<Color>(AppTheme.success);

  final QuestionsCubit questionsCubit = getIt<QuestionsCubit>();

  void _onExamEnd() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CustomAlertDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Exam exam = ModalRoute.of(context)!.settings.arguments as Exam;
    final int examDuration = 60 * exam.duration;
    DateTime endTime = DateTime.now().add(Duration(seconds: examDuration));

    return BlocProvider<QuestionsCubit>(
      create: (context) => questionsCubit..getQuestions(exam.id),
      child: Scaffold(
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
          child: BlocBuilder<QuestionsCubit, QuestionsStates>(
              builder: (context, state) {
            if (state is QuestionsLoading) {
              return LoadingIndicator();
            } else if (state is QuestionsError) {
              return ErrorIndicator(state.message);
            } else if (state is QuestionsSuccess<List<Question>>) {
              return state.questions.isEmpty
                  ? Center(
                      child: Text('No Available Questions',
                          style: Theme.of(context).textTheme.titleLarge))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          Text(
                            'Question ${state.questionIndex! + 1} of ${state.questions.length}',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          LinearProgressIndicator(
                            value: (state.questionIndex! + 1) /
                                state.questions.length,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppTheme.blue),
                            backgroundColor: AppTheme.lightBlack,
                            minHeight: 4.h,
                          ),
                          SizedBox(height: 28.h),
                          Text(
                            state.questions[state.questionIndex!].question,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 24.h),
                          Column(
                            children: List.generate(
                              state.questions[state.questionIndex!].answers
                                  .length,
                              (index) => Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      questionsCubit.selectAnswer(index);
                                    },
                                    child: ChoiceItem(
                                      index: index,
                                      selectedAnswer: state.selectedAnswers![
                                          state.questionIndex!],
                                      answers: state
                                          .questions[state.questionIndex!]
                                          .answers,
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
                              onPressed: () {
                                context
                                    .read<QuestionsCubit>()
                                    .goToPreviousQuestion();
                              },
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: AppTheme.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<QuestionsCubit>()
                                    .goToNextQuestion();
                              },
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: AppTheme.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ])
                        ]);
            } else {
              return SizedBox();
            }
          }),
        ),
      ),
    );
  }
}
