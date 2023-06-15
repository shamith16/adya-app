import 'package:adya_app/src/screens/home_screen/home_binding.dart';
import 'package:adya_app/src/screens/home_screen/home_screen.dart';
import 'package:adya_app/src/screens/player_screen/player_binding.dart';
import 'package:adya_app/src/screens/player_screen/player_screen.dart';
import 'package:adya_app/src/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/splash_screen/splash_binding.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';
  static const String playerScreen = '/playerScreen';

  static List<GetPage> pages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: playerScreen,
      page: () => const PlayerScreen(),
      binding: PlayerBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
