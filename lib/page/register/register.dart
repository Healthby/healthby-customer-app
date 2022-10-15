import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/phonenumber_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  final String nameRoute = '/register';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final keyForm = GlobalKey<FormState>();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  final phoneController = TextEditingController();

  final _picker = ImagePicker();

  File? _photo;

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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      foregroundImage: _photo == null
                          ? const AssetImage('assets/icon.png')
                          : FileImage(_photo!) as ImageProvider,
                      radius: 90,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              XFile? photo = await _picker.pickImage(
                                source: ImageSource.camera,
                                preferredCameraDevice: CameraDevice.front,
                              );
                              if (photo != null) {
                                setState(() {
                                  _photo = File(photo.path);
                                });
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Get.theme.colorScheme.secondary,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        topLeft: Radius.circular(20))),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Get.theme.colorScheme.onSecondary,
                                  size: 16,
                                )),
                          ),
                          GestureDetector(
                            onTap: () async {
                              XFile? photo = await _picker.pickImage(
                                source: ImageSource.gallery,
                                preferredCameraDevice: CameraDevice.front,
                              );
                              if (photo != null) {
                                setState(() {
                                  _photo = File(photo.path);
                                });
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Get.theme.colorScheme.secondary,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Icon(
                                  Icons.camera,
                                  color: Get.theme.colorScheme.onSecondary,
                                  size: 16,
                                )),
                          ),
                        ],
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
