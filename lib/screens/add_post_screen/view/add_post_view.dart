import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/screens/add_post_screen/controller/add_feed_controller.dart';
import 'package:social_media_app/screens/add_post_screen/service/service.dart';

import 'package:social_media_app/screens/add_post_screen/view/widgets/app_bar.dart';
import 'package:social_media_app/screens/add_post_screen/view/widgets/category_component.dart';
import 'package:social_media_app/screens/add_post_screen/view/widgets/image_picker_component.dart';
import 'package:social_media_app/screens/add_post_screen/view/widgets/video_picker_component.dart';
import 'package:social_media_app/utils/custom_flushbar/custom_flushbar.dart';
import 'package:social_media_app/utils/loading_screen/loading_screen.dart';
import 'package:social_media_app/utils/middleware/api_error_handling/api_error_handling.dart';

import '../controller/controller.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddFeedProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: CustomAppBar(
          onBackTapTap: () {
            value.resetState();
            Navigator.pop(context);
          },
          onTap: () {
            if (AddFeedController.validation(
                videoFile: value.videoFile,
                imageFile: value.imageFile,
                categories: value.selectedCategories)) {
              loadingScreen(context);
              AddPostService.sharePost(
                      imageFile: value.imageFile!,
                      videoFile: value.videoFile!,
                      selectedCategories: value.selectedCategories!)
                  .then(
                (value1) {
                  value.resetState();
                  Navigator.pop(context);
                  Navigator.pop(context);
                  flushBarNotification(
                      context: context,
                      message: "Feed shared",
                      type: FlushBarType.success);
                },
              ).onError(
                (error, stackTrace) {
                  Navigator.pop(context);
                  apiErrorHandling(context: context, error: error);
                },
              );
            } else {
              flushBarNotification(
                  context: context,
                  message: "Add all fields to share.",
                  type: FlushBarType.error);
            }
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(appSizeConstants.padding_16.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VideoPickerComponent(
                  onTap: () {
                    value.pickVideoFile();
                  },
                  file: value.videoFile,
                ),
                SizedBox(
                  height: appSizeConstants.padding_16.h,
                ),
                ImagePickerComponent(
                  onTap: () {
                    value.pickImageFile();
                  },
                  imageFile: value.imageFile,
                ),
                SizedBox(
                  height: appSizeConstants.padding_16.h,
                ),
                CategoryComponent()
              ],
            ),
          ),
        ),
      );
    });
  }
}
