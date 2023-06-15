import 'package:adya_app/src/constants.dart';
import 'package:adya_app/src/routes/pages.dart';
import 'package:adya_app/src/screens/home_screen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/homeScreen';

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            _buildVideoPlayer(),
            _buildVideoProgressIndicator(),
            _buildPlayPauseButton(),
            if (controller.shouldShowEmotionsDialog.value) _buildEmotionsCard(),
            _buildPlayerViewSwitch(),
          ],
        ),
      );
    });
  }

  Widget _buildVideoPlayer() {
    return VideoPlayer(controller.videoController);
  }

  Widget _buildVideoProgressIndicator() {
    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: VideoProgressIndicator(
        controller.videoController,
        allowScrubbing: true,
        padding: const EdgeInsets.all(20),
      ),
    );
  }

  Widget _buildPlayPauseButton() {
    return Positioned(
      bottom: 5,
      child: InkWell(
        onTap: () {
          final shouldPause = !controller.shouldPauseVideo.value;
          controller.shouldPauseVideo.value = shouldPause;
          shouldPause
              ? controller.videoController.pause()
              : controller.videoController.play();
        },
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(-3, -3),
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                offset: const Offset(3, 3),
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(
            controller.shouldPauseVideo.value ? Icons.play_arrow : Icons.pause,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildEmotionsCard() {
    return AnimatedOpacity(
      opacity: controller.shouldShowEmotionsDialog.value ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeIn,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        surfaceTintColor: Theme.of(Get.context!).primaryColor,
        color: Theme.of(Get.context!).primaryColorLight,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 380,
          width: 360,
          child: ListView.builder(
            itemCount: Constants.emojiAnims.length,
            itemBuilder: (context, index) {
              if (index % 3 == 0) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = index; i < index + 3; i++)
                      if (i < Constants.emojiAnims.length)
                        EmojiLabelledWidget(
                          emotionName: Constants.emojiAnims[i]["emotion"],
                          emotionEmoji: Constants.emojiAnims[i]["emoji"],
                          onTap: () {
                            if (controller.playerView.value) {
                              Get.toNamed(AppRoutes.playerScreen, arguments: {
                                "url": Constants.emojiAnims[i]["videoUrl"]
                              });
                            } else {
                              controller.switchVideoController(
                                  Constants.emojiAnims[i]["videoUrl"]);
                            }
                          },
                        ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerViewSwitch() {
    return Positioned(
      top: 25,
      right: 10,
      child: Switch(
          value: controller.playerView.value,
          onChanged: (value) => controller.playerView.value = value),
    );
  }
}

class EmojiLabelledWidget extends StatelessWidget {
  const EmojiLabelledWidget(
      {super.key,
      required this.emotionEmoji,
      required this.emotionName,
      this.onTap});

  final String emotionEmoji;
  final String emotionName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emotionEmoji,
                style: const TextStyle(fontSize: 40),
                textAlign: TextAlign.center),
            Text(emotionName,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
