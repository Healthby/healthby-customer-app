import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  final String nameRoute = '/login';
  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
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
          Positioned(
            bottom: 250,
            width: Get.width,
            child: Form(
              key: keyForm,
              child: Container(
                // height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                // color: Colors.amber,
                child: Column(children: [
                  //username
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some username';
                      }
                      return null;
                    },
                  ),
                  //password
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10)),
                    onPressed: () {
                      if (keyForm.currentState!.validate()) {}
                    },
                    child: const Text('LOGIN'),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
