import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../main.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: appSizeConstants.size66.h,
        width: appSizeConstants.size66.w,
        decoration: BoxDecoration(
            color: appColors.colorC70033,
            borderRadius: BorderRadius.circular(appSizeConstants.radius_33)),
        child: Icon(
          Icons.add,
          color: appColors.colorFFFFFF,
          size: appSizeConstants.size40.sp,
        ),
      ),
    );
  }
}
