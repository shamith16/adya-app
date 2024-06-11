import 'dart:ui';

import 'package:adya_app/src/routes/pages.dart';
import 'package:adya_app/src/screens/splash_screen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  static const String routeName = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(controller.videoController),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          _buildGetStartedButton(),
        ],
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return Positioned(
      bottom: 30,
      child: ElevatedButton(
        onPressed: () {
          controller.videoController.pause();
          Get.offAndToNamed(AppRoutes.homeScreen);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.transparent,
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
