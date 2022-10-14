import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final String nameRoute = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: CustomScrollView(slivers: [
        const SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 100.0,
          flexibleSpace: SafeArea(
            child: FlexibleSpaceBar(
              title: Text('Register', textScaleFactor: 1),
              centerTitle: true,
              // expandedTitleScale: 1.5,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    color: Get.theme.cardColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: const Center(
                    child: Text('data'),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
