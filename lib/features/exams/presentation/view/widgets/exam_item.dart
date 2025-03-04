import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/core/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamItem extends StatelessWidget {
  const ExamItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103.h,
      width: 343.w,
      padding:
          EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h, bottom: 16.h),
      decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppTheme.boxShadow,
              spreadRadius: 0,
              blurRadius: 8,
            ),
          ]),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://s3-alpha-sig.figma.com/img/2d35/b236/edb74c89d43a39dd0e9bb299db3b977d?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=HHnz98Rzm6uDb5SMTS00SIhn-4hmXKbioiFREYdatZnz-ZX3CiRbaWu~Yv-urrb5Eh6xJPaiCDKLzeKW~Smp6GbwbleGXvO5OC9ntwyEjcIUSabqT3qI2juF7XKDldu3rx5-w6WIRitUGhxOYu41OY-O5gQBNTPrKPSLXWxWirvo~ChrLdcQQw-h9o-fVqu~3rFuV3wS2Q7HeR1FOuN1by4VV-gOgj-1ImvfP-5m-pepw3hHpZmzgXQFXfJHQdDBHTsfuOMZT1nkxywpCvKtP2wksj-ME9-x3RRZ0nAGBSqmTtUszw0mb4hr6Wlsl5kRBf6ih7F1hg68a9S~qhkOTg__",
            height: 71.h,
            width: 60.w,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("High level",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(width: 83.w),
                  Text("30 Minutes",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppTheme.blue, fontSize: 13.sp))
                ],
              ),
              Text(
                "20 Question",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 13.sp),
              ),
              SizedBox(height: 11.h),
              Text("From: 1.0  To: 6.00",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 13.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
