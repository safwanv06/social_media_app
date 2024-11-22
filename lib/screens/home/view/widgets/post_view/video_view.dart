import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/main.dart';
import 'package:social_media_app/screens/home/controller/video_player_provider.dart';
import 'package:social_media_app/utils/loading_screen/loading_screen.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatelessWidget {
  const VideoView(
      {super.key,
      required this.imageUrl,
      required this.videoUrl,
      required this.id,
      required this.onTap});

  final String id;
  final String imageUrl;
  final String videoUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoPlayerProvider>(
      builder: (context, value, child) {
        return InkWell(
          onTap: onTap,
          child: AspectRatio(
            aspectRatio: 1,
            child: value.isLoading == true
                ? const LoadingScreen()
                : value.isInitialised == false || value.id != id
                    ? SizedBox(
                        width: screenUtil.screenWidth,
                        child: Image.network(
                          imageUrl,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const LoadingScreen();
                            } else {
                              return child;
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(imageData.notFoundImage);
                          },
                        ),
                      )
                    : VideoPlayer(value.playerController),
          ),
        );

        return value.isLoading == true
            ? AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  width: screenUtil.screenWidth,
                  child: LoadingScreen(),
                ),
              )
            : value.isInitialised == false && value.id == id
                ? InkWell(
                    onTap: onTap,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        width: screenUtil.screenWidth,
                        child: Image.network(
                          imageUrl,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const LoadingScreen();
                            } else {
                              return child;
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(imageData.notFoundImage);
                          },
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () async {
                      value.pauseVideo();
                    },
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: SizedBox(
                          width: screenUtil.screenWidth,
                          child: VideoPlayer(value.playerController)),
                    ),
                  );
      },
    );
  }
}
