import 'package:exam/features/exams/domain/entities/exam.dart';
import 'package:exam/features/exams/presentation/view/screens/exams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StartExam extends StatelessWidget {
  static const routeName = '/start-exam';
  const StartExam({super.key});

  @override
  Widget build(BuildContext context) {
    final Exam exams = ModalRoute.of(context)!.settings.arguments as Exam;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, Exams.routeName),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://s3-alpha-sig.figma.com/img/2d35/b236/edb74c89d43a39dd0e9bb299db3b977d?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=HHnz98Rzm6uDb5SMTS00SIhn-4hmXKbioiFREYdatZnz-ZX3CiRbaWu~Yv-urrb5Eh6xJPaiCDKLzeKW~Smp6GbwbleGXvO5OC9ntwyEjcIUSabqT3qI2juF7XKDldu3rx5-w6WIRitUGhxOYu41OY-O5gQBNTPrKPSLXWxWirvo~ChrLdcQQw-h9o-fVqu~3rFuV3wS2Q7HeR1FOuN1by4VV-gOgj-1ImvfP-5m-pepw3hHpZmzgXQFXfJHQdDBHTsfuOMZT1nkxywpCvKtP2wksj-ME9-x3RRZ0nAGBSqmTtUszw0mb4hr6Wlsl5kRBf6ih7F1hg68a9S~qhkOTg__",
                    height: 47.h,
                    width: 42.w,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    exams.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Text("${exams.duration} Minutes",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppTheme.blue, fontSize: 13.sp))
                ]),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      'High level',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      height: 21.h,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Color(0xff809ACD),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${exams.numberOfQuestions} Question",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.gray),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(
            thickness: 0.5.sp,
            color: Color(0xffCCD7EB),
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructions',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '• Read each question carefully.\n'
                      '• Manage your time wisely.\n'
                      '• You can review and change answers.\n'
                      '• Ensure a stable internet connection.\n'
                      '• Timer expiry = auto submission.',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppTheme.gray,
                            fontWeight: FontWeight.w500,
                          ),
                    )
                  ],
                ),
                SizedBox(height: 48.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Start",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
