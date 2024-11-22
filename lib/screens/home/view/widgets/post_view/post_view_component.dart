import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/screens/home/service/model/model.dart';
import 'package:social_media_app/screens/home/view/widgets/post_view/post_header.dart';
import 'package:social_media_app/screens/home/view/widgets/post_view/video_view.dart';

import '../../../controller/controller.dart';

class PostViewComponent extends StatelessWidget {
  const PostViewComponent({super.key, required this.postDetails,required this.onTap});

  final PostModel postDetails;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostHeader(
            imagePath: postDetails.user.image ?? "",
            createdDate:
                HomeController.calculateDays(date: postDetails.createdAt),
            userName: postDetails.user.name),
        SizedBox(
          height: appSizeConstants.padding_16.h,
        ),
        InkWell(
          onTap: onTap,
          child: VideoView(
            onTap: onTap,
            id: postDetails.id,
            imageUrl: postDetails.imageUrl,
            videoUrl: postDetails.videoUrl,
          ),
        ),
        SizedBox(
          height: appSizeConstants.padding_16.h,
        ),
        Text(
          postDetails.description,
          style: fontStyles.text_12_400_BDBDBD,
        ),
        SizedBox(
          height: appSizeConstants.padding_32.h,
        ),
      ],
    );
  }
}
