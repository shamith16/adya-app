import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  late final VideoPlayerController videoController;

  @override
  void onInit() {
    videoController = VideoPlayerController.asset('assets/adya_intro.mp4')
      ..initialize().then((_) {
        _startVideoPlayback();
      });
    super.onInit();
  }

  @override
  void onClose() {
    videoController.removeListener(_videoListener);
    _disposeVideoController();
    super.onClose();
  }

  void _startVideoPlayback() {
    videoController.play();
    videoController.setLooping(false);
    videoController.addListener(_videoListener);
    update();
  }

  void _videoListener() {
    if (videoController.value.position >= videoController.value.duration) {
      videoController.seekTo(Duration.zero);
      videoController.play();
    }
  }

  void _disposeVideoController() {
    videoController.pause();
    videoController.dispose();
  }
}
