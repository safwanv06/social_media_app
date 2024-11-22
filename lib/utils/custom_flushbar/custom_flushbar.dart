import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';

import 'model/flushbar_type.dart';

export 'model/flushbar_type.dart';

flushBarNotification(
    {required BuildContext context,
    required String message,
    required FlushBarType type}) {
  late Color backGroundColor;

  Color messageColor = appColors.colorFFFFFF;

  switch (type) {
    case FlushBarType.success:
      backGroundColor = appColors.flushBarSuccessColor;
    case FlushBarType.warning:
      backGroundColor = appColors.flushBarWarningColor;
    case FlushBarType.error:
      backGroundColor = appColors.colorC70033;
  }
  Flushbar(
    backgroundColor: backGroundColor,
    borderRadius: BorderRadius.circular(appSizeConstants.radius_8),
    padding: EdgeInsets.symmetric(
        horizontal: appSizeConstants.padding_16.w,
        vertical: appSizeConstants.padding_12.h),
    margin: EdgeInsets.symmetric(horizontal: appSizeConstants.padding_24.sp),
    messageText: Row(
      children: [
        Icon(
          Icons.info_outline,
          size: 20.sp,
          color: messageColor,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            message,
            softWrap: true,
            style: TextStyle(
              color: messageColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
}
