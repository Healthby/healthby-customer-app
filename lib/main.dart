import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthby/page/login/login.dart';

import 'page/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Healthby',
      theme: ThemeData(
        // primaryColor: const Color(0xFF0061a4),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF0061a4),
          onPrimary: Colors.white,
          secondary: Color(0xFF535f70),
          onSecondary: Colors.white,
          error: Color(0xFFD32F2F),
          onError: Colors.white,
          background: Color(0xFFFDFCFF),
          onBackground: Color(0xFF1A1C1E),
          surface: Color(0xFFFDFCFF),
          onSurface: Color(0xFF1A1C1E),
        ),
        fontFamily: GoogleFonts.ibmPlexSansThai().fontFamily,
        textTheme: GoogleFonts.ibmPlexSansThaiTextTheme(const TextTheme(
          headline1: TextStyle(
              fontSize: 99, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: TextStyle(
              fontSize: 62, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: TextStyle(fontSize: 49, fontWeight: FontWeight.w400),
          headline4: TextStyle(
              fontSize: 35, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          headline6: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        )),
      ),
      initialRoute: const SplashPage().nameRoute,
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
          name: const SplashPage().nameRoute,
          page: () => const SplashPage(),
          transition: Transition.fade,
        ),
        GetPage(
          name: const LoginPage().nameRoute,
          page: () => const LoginPage(),
        )
      ],
    );
  }
}
