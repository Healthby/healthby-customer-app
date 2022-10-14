import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthby/page/login/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  final String nameRoute = '/splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => Get.toNamed(const LoginPage().nameRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/splash.png',
            fit: BoxFit.fitHeight,
            alignment: Alignment.topCenter,
          ),
          const Positioned(
            bottom: 150,
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
