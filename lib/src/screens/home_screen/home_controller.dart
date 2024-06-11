import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  late VideoPlayerController videoController;
  late VideoPlayerController initialVideoController;

  RxBool shouldShowEmotionsDialog = false.obs;
  RxBool shouldPauseVideo = false.obs;
  RxBool videoFromNetworkPlaying = false.obs;
  RxBool videoAfterUrl = false.obs;
  RxBool playerView = false.obs;

  @override
  void onInit() {
    videoController =
        VideoPlayerController.asset('assets/adya_emotion_track.mp4')
          ..initialize().then((_) {
            _startVideoPlayback();
          });
    initialVideoController = videoController;
    super.onInit();
  }

  @override
  void onClose() {
    videoController.removeListener(_videoListener);
    _disposeVideoController();
    super.onClose();
  }

  void _startVideoPlayback() {
    if (!videoAfterUrl.value) {
      videoController.play();
      videoController.setLooping(false);
      videoController.addListener(_videoListener);
    } else {
      videoController.pause();
      videoController.setLooping(false);
      videoController.addListener(_videoListener);
      videoController.seekTo(const Duration(seconds: 0));
    }
    update();
  }

  void _videoListener() {
    final currentPosition = videoController.value.position;
    final totalDuration = videoController.value.duration;

    if (!videoFromNetworkPlaying.value &&
        currentPosition >= totalDuration - const Duration(seconds: 3)) {
      shouldShowEmotionsDialog.value = true;
    } else {
      shouldShowEmotionsDialog.value = false;
    }

    update();
  }

  void _disposeVideoController() {
    videoController.pause();
    videoController.dispose();
  }

  void switchVideoController(String url) async {
    videoFromNetworkPlaying.value = true;
    videoAfterUrl.value = true;
    if (videoController.dataSource == url) {
      return;
    }

    videoController = VideoPlayerController.asset(url);
    await videoController.initialize();
    _startVideoPlayback();

    await videoController.play();
    await videoController.seekTo(const Duration(seconds: 1));
    while (videoController.value.position < videoController.value.duration) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    _switchToInitialVideo();
  }

  void _switchToInitialVideo() {
    videoController.pause();
    videoController.removeListener(_videoListener);

    videoController = initialVideoController;
    videoController.seekTo(const Duration(seconds: 0));
    videoController.pause(); // Stop the video

    shouldPauseVideo.value = true; // Set the pause state to true
    _startVideoPlayback();
    videoFromNetworkPlaying.value = false;
    videoAfterUrl.value = false;
    update();
  }
}
