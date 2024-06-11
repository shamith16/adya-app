import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends GetxController {
  late final VideoPlayerController videoController;

  @override
  void onInit() {
    var args = Get.arguments as Map<String, dynamic>;

    videoController = VideoPlayerController.asset(args['url'])
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
      Get.back();
    }
  }

  void _disposeVideoController() {
    videoController.pause();
    videoController.dispose();
  }
}
