import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';

class ImagePickerComponent extends StatelessWidget {
  const ImagePickerComponent(
      {super.key, required this.onTap, required this.imageFile});

  final Function() onTap;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DottedBorder(
          color: appColors.colorFFFFFF.withOpacity(0.8),
          borderType: BorderType.RRect,
          radius: Radius.circular(appSizeConstants.radius_16),
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: appSizeConstants.padding_32.h,horizontal: appSizeConstants.padding_16.w),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(appSizeConstants.radius_16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imageData.imagePicker),
                SizedBox(
                  width: appSizeConstants.padding_24.h,
                ),
                Expanded(
                  child: Text(
                    imageFile!=null?imageFile!.path:"Add a thumbnail",
                    overflow: TextOverflow.ellipsis,
                    style: fontStyles.text_16_600_White,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
