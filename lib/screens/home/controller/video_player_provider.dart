import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerProvider extends ChangeNotifier {

  late VideoPlayerController _controller;

  get playerController => _controller;
  bool isLoading = false;
  bool isInitialised = false;
  bool isPlaying = false;
  String? id;

  initialise({required VideoPlayerController videoController,required String passedId})async{
    id=passedId;
    isLoading=true;
    notifyListeners();
    _controller= videoController;
    await _controller.initialize();
    id=passedId;
    isInitialised=true;
    isLoading=false;
    notifyListeners();
  }

  playVideo()async{
   await _controller.play();
   isPlaying=true;
   notifyListeners();
  }

  pauseVideo()async{
   await _controller.pause();
   isPlaying=false;
   notifyListeners();
  }
}
