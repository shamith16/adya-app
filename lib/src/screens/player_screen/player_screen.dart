import 'package:adya_app/src/screens/player_screen/player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends GetView<PlayerController> {
  const PlayerScreen({Key? key}) : super(key: key);

  static const String routeName = '/playerScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(controller.videoController),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: VideoProgressIndicator(
              controller.videoController,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Colors.red,
                bufferedColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              padding: const EdgeInsets.all(20),
            ),
          ),
          Positioned(
              bottom: 20,
              right: 5,
              child: ElevatedButton(
                child: const Text("feeling different?",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                onPressed: () => Get.back(),
              ))
        ],
      ),
    );
  }
}
