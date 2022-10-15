import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../register/register.dart';

class LoginPage extends StatefulWidget {
  final String nameRoute = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final keyForm = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  submit() {
    if (keyForm.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    bool isbottom = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
            bottom: isbottom ? -50 : 150,
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
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    // textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                    // autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some username';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) => submit(),
                  ),
                  //password
                  TextFormField(
                    controller: passwordController,
                    // textAlign: TextAlign.center,
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
                    onFieldSubmitted: (value) => submit(),
                  ),
                  SizedBox(
                    height: isbottom ? 20 : 40,
                  ),
                  //button login
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 45),
                    ),
                    onPressed: () => submit(),
                    child: const Text('LOGIN'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //button regis
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(200, 45),
                    ),
                    onPressed: () => Get.toNamed(RegisterPage().nameRoute),
                    child: const Text('REGISTER'),
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
