import 'package:exam/core/di/di.dart';
import 'package:exam/core/widgets/error_indicator.dart';
import 'package:exam/core/widgets/loding_indicator.dart';
import 'package:exam/features/exams/presentation/view/screens/start_exam.dart';
import 'package:exam/features/exams/presentation/view/widgets/exam_item.dart';
import 'package:exam/features/exams/presentation/view_model/exam_cubit.dart';
import 'package:exam/features/exams/presentation/view_model/exam_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Exams extends StatefulWidget {
  static const String routeName = "/exams";
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

final ExamCubit examCubit = getIt<ExamCubit>();

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => examCubit..getExams("670037f6728c92b7fdf434fc"),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Languages"),
            titleSpacing: 0,
            leading: const Icon(Icons.arrow_back_ios_new),
          ),
          body: BlocBuilder<ExamCubit, ExamStates>(builder: (context, state) {
            if (state is ExamLoading) {
              return const LoadingIndicator();
            } else if (state is ExamError) {
              return ErrorIndicator(state.message);
            } else if (state is ExamSuccess) {
              return state.exams.isEmpty
                  ? Center(child: Text("No Available Exams"))
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.exams[0].title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 24.h),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (_, index) => InkWell(
                                onTap: () => Navigator.pushReplacementNamed(
                                    context, StartExam.routeName,
                                    arguments: state.exams[index]),
                                child: ExamItem(
                                  exam: state.exams[index],
                                ),
                              ),
                              itemCount: state.exams.length,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 16.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            }
            return Center(
              child: Text("something went wrong"),
            );
          }),
        ));
  }
}
