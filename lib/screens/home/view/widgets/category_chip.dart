import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip(
      {super.key, required this.name, this.bgColor, this.borderColor});

  final String name;
  final Color? bgColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: appSizeConstants.padding_8.w,
        bottom: appSizeConstants.padding_8.w,
        right: appSizeConstants.padding_8.w,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: appSizeConstants.padding_8.w,
          vertical: appSizeConstants.padding_8.h),
      decoration: BoxDecoration(
          color: bgColor ?? appColors.primaryBlack,
          borderRadius: BorderRadius.circular(appSizeConstants.radius_24),
          border: Border.all(
              color: borderColor ?? appColors.colorFFFFFF.withOpacity(0.5))),
      child: Text(
        name,
        style: fontStyles.text_12_400_E2E2E2,
      ),
    );
  }
}
