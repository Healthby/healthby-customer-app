import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/phonenumber_input_formatter.dart';

class RegisterPage extends StatelessWidget {
  final String nameRoute = '/register';
  RegisterPage({super.key});
  final keyForm = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController();

  submit() {
    if (keyForm.currentState!.validate()) {}
  }

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
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage('assets/icon.png'),
                      radius: 90,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Get.theme.colorScheme.secondary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Icon(
                          Icons.edit,
                          color: Get.theme.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Form(
                  key: keyForm,
                  child: Container(
                    // height: Get.height,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: Get.theme.cardColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(children: [
                      TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.text,
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
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        // textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        // autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some password';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: firstnameController,
                        keyboardType: TextInputType.name,
                        // obscureText: true,
                        // textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          labelText: 'FirstName',
                        ),
                        // autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some firstname';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: lastnameController,
                        keyboardType: TextInputType.name,
                        // obscureText: true,
                        // textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          labelText: 'LastName',
                        ),
                        // autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some lastname';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        // obscureText: true,
                        // textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                        ),
                        // autofocus: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                          PhoneNumberInputFormatter()
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 45),
                        ),
                        onPressed: () => submit(),
                        child: const Text('REGISTER'),
                      ),
                    ]),
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
