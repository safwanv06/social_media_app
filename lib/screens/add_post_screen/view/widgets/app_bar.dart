import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/utils/custom_button/custom_button.dart';

import '../../../../main.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, required this.onTap, required this.onBackTapTap});

  final Function() onTap;
  final Function() onBackTapTap;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appColors.primaryBlack,
      leading: SizedBox(
        width: appSizeConstants.size25.w,
        height: appSizeConstants.size25.w,
        child: InkWell(
          onTap: onBackTapTap,
          child: Image.asset(
            imageData.arrowLeft,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      title: Text(
        "Add Feeds",
        style: fontStyles.text_16_600_White,
      ),
      actions: [
        CustomButton(
            borderColor: appColors.colorC70033.withOpacity(0.5),
            buttonName: "Share Post",
            onTap: onTap)
      ],
    );
  }
}
