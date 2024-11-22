import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/screens/home/view/widgets/post_view/post_header.dart';
import 'package:social_media_app/utils/custom_round_image/custom_round_image.dart';
import 'package:video_player/video_player.dart';

import '../../../controller/controller.dart';
import '../../../controller/video_player_provider.dart';
import '../../../service/model/model.dart';
import 'post_view_component.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key, required this.posts});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoPlayerProvider>(
      builder: (context, value, child) => Expanded(
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              PostModel postDetails = posts[index];
              VideoPlayerController controller =
                  VideoPlayerController.networkUrl(
                      Uri.parse(postDetails.videoUrl));
              return PostViewComponent(
                postDetails: postDetails,
                onTap: () async {
                  if (value.id == postDetails.id) {
                    if (value.isPlaying == true) {
                      value.pauseVideo();
                    } else {
                      await value.initialise(
                          videoController: controller,
                          passedId: postDetails.id);
                      value.playVideo();
                    }
                  } else {
                    await value.initialise(
                        videoController: controller, passedId: postDetails.id);
                    value.playVideo();
                  }
                },
              );
            }),
      ),
    );
  }
}
