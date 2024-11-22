import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonName,
      required this.onTap,
       this.suffix, this.borderColor});

  final Function() onTap;
  final String buttonName;
  final Widget? suffix;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: appSizeConstants.padding_12.w,
            vertical: appSizeConstants.padding_8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(appSizeConstants.radius_24),
            border: Border.all(
                color: borderColor??appColors.color1F1F1F,
                width: appSizeConstants.borderWidth)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              buttonName,
              style: fontStyles.text_16_600_White,
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: suffix != null ? appSizeConstants.padding_16.w : 0),
                child: suffix ?? const SizedBox())
          ],
        ),
      ),
    );
  }
}
