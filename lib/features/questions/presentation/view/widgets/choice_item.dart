import 'package:exam/core/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiceItem extends StatelessWidget {
  final int index;
  final int? selectedAnswer;
  final List<String> answers;
  const ChoiceItem(
      {super.key,
      required this.index,
      required this.selectedAnswer,
      required this.answers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: 343.w,
      padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 8.w, right: 8.w),
      decoration: BoxDecoration(
        color: AppTheme.lightBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.blue, width: 2.w),
              ),
              child: selectedAnswer == index
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.blue,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 18.w),
            Expanded(
              child: Text(
                answers[index],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
