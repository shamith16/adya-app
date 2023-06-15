import 'package:adya_app/src/screens/player_screen/player_controller.dart';
import 'package:get/get.dart';

class PlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerController>(() => PlayerController());
  }
}
