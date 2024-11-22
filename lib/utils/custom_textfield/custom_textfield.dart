import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.onTap,
      this.isEnabled = true,
      required this.onChanged,
      required this.controller,
      this.hintText,
      this.maxLength,
        this.keyboard,
      this.suffixWidget});

  TextEditingController controller;
  bool isEnabled;
  Function()? onTap;
  Function(String value) onChanged;
  Widget? suffixWidget;
  String? hintText;
  TextInputType? keyboard;
  int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: appSizeConstants.padding_12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(appSizeConstants.radius_8),
          border: Border.all(color: appColors.colorFFFFFF)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              maxLength: maxLength,
              style: fontStyles.text_24_500_White,
              keyboardType: keyboard,
              decoration: InputDecoration(
                counterText: "",
                hintText: hintText,
                hintStyle: fontStyles.text_12_400_BDBDBD,
                focusedBorder: InputBorder.none,
                enabled: false,
              ),
              onChanged: onChanged,
              controller: controller,
              onTap: onTap,
              enabled: isEnabled,
            ),
          ),
          suffixWidget ?? const SizedBox()
        ],
      ),
    );
  }
}
