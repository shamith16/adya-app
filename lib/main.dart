import 'package:adya_app/src/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AdyaApp());
}

class AdyaApp extends StatelessWidget {
  const AdyaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Adya',
      debugShowCheckedModeBanner: false,
      theme: _setupThemeData(),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 900),
    );
  }

  ThemeData _setupThemeData() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
      colorSchemeSeed: const Color(0x00ffd251), //Golden Yellow
    );
  }
}
