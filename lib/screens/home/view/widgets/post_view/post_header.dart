import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../main.dart';
import '../../../../../utils/custom_round_image/custom_round_image.dart';

class PostHeader extends StatelessWidget {
  const PostHeader(
      {super.key, required this.imagePath, required this.userName, required this.createdDate});

  final String imagePath;
  final String userName;
  final int createdDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appSizeConstants.size40.h,
      child: Row(
        children: [
          CustomRoundImage(
              imageType: ImageTypeModel.network, imagePath: imagePath),
          SizedBox(
            width: appSizeConstants.padding_12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: fontStyles.text_12_500_FFFFFF,
              ),
              const Spacer(),
              Text(
                "$createdDate days ago",
                style: fontStyles.text_12_400_D5D5D5,
              )
            ],
          ),
        ],
      ),
    );
  }
}
