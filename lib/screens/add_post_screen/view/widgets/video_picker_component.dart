import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';

class VideoPickerComponent extends StatelessWidget {
  const VideoPickerComponent(
      {super.key, required this.onTap, required this.file});

  final Function() onTap;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
          color: appColors.colorFFFFFF.withOpacity(0.8),
          borderType: BorderType.RRect,
          radius: Radius.circular(appSizeConstants.radius_16),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: appSizeConstants.padding_16.w),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(appSizeConstants.radius_16)),
            child: Column(
              children: [
                SizedBox(
                  height: appSizeConstants.padding_80.h,
                ),
                Image.asset(imageData.videoPicker),
                SizedBox(
                  height: appSizeConstants.padding_24.h,
                ),
                Text(
                  file != null ? file!.path : "Select a video from Gallery",
                  style: fontStyles.text_16_600_White,
                ),
                SizedBox(
                  height: appSizeConstants.padding_80.h,
                ),
              ],
            ),
          )),
    );
  }
}
